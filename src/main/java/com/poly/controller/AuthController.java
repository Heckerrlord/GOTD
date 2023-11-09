package com.poly.controller;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import com.poly.entity.Account;
import com.poly.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import com.poly.dao.AccountDAO;
import com.poly.service.AccountService;
import com.poly.service.MailerService;

import net.bytebuddy.utility.RandomString;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
public class AuthController {

    @Autowired
    AccountDAO accountDAO;

    @Autowired
    AccountService accountService;

    @Autowired
    MailerService mailer;

    @Autowired
    UploadService uploadService;
    @Autowired
    HttpServletRequest rq;


    @CrossOrigin("*")
    @ResponseBody
    @RequestMapping("/rest/auth/authentication")
    public Object getAuthentication(HttpSession session) {
        return session.getAttribute("authentication");
    }

    @RequestMapping("/auth/login/form")
    public String logInForm(Model model, @ModelAttribute("account") Account account) {
        return "auth/login";
    }

    @RequestMapping("/auth/login/success")
    public String logInSuccess(HttpSession session, Model model, @ModelAttribute("account") Account account) {
        // Đối tượng `account` ở đây là tài khoản đã được xác thực

        // Lưu tài khoản vào session
        session.setAttribute("authenticatedAccount", account);
        System.out.println(account.getUsername());
        model.addAttribute("message", "Đăng nhập thành công");
        return "redirect:/index";
    }


    @RequestMapping("/auth/login/error")
    public String logInError(Model model, @Validated @ModelAttribute("account") Account account, Errors errors) {
        if (errors.hasErrors()) {
            model.addAttribute("message", "Sai thông tin đăng nhập!");
            return "auth/login";
        }
        System.out.println(account.getUsername());
        return "auth/login";
    }

    @RequestMapping("/auth/unauthoried")
    public String unauthoried(Model model, @ModelAttribute("account") Account account) {
        model.addAttribute("message", "Bạn không có quyền truy cập!");
        return "auth/login";
    }

    @RequestMapping("/auth/logout/success")
    public String logOutSuccess(Model model, @ModelAttribute("account") Account account) {
        model.addAttribute("message", "Bạn đã đăng xuất!");
        return "auth/login";
    }

    // OAuth2
    @RequestMapping("/oauth2/login/success")
    public String oauth2(OAuth2AuthenticationToken oauth2) {
        accountService.loginFromOAuth2(oauth2);
        return "forward:/auth/login/success";
    }

    @GetMapping("/auth/register")
    public String signUpForm(Model model) {
        model.addAttribute("account", new Account());
        return "auth/register";
    }

    @PostMapping("/auth/register")
    public String signUpSuccess(Model model, @Validated @ModelAttribute("account") Account account, Errors error,
                                HttpServletResponse response) {
        if (error.hasErrors()) {
            model.addAttribute("message", "Please correct the error below!");
            return "auth/register";
        }
        account.setPhoto("user.png");
        account.setToken("token");
        account.setTrangThai(0);
        accountService.create(account);
        model.addAttribute("message", "Đăng ký tài khoản mới thành công!");
        response.addHeader("refresh", "2;url=/auth/login/form");
        return "auth/register";
    }

    @GetMapping("/auth/forgot-password")
    public String forgotPasswordForm(Model model) {
        return "auth/forgot-password";
    }

    @PostMapping("/auth/forgot-password")
    public String processForgotPassword(@RequestParam("email") String email, HttpServletRequest request, Model model)
            throws Exception {
        try {
            String token = RandomString.make(50);
            accountService.updateToken(token, email);
            String resetLink = getSiteURL(request) + "/auth/reset-password?token=" + token;
            mailer.sendEmail(email, resetLink);
            model.addAttribute("message", "We have sent a reset password link to your email. "
                    + "If you don't see the email, check your spam folder.");
        } catch (MessagingException e) {
            e.printStackTrace();
            model.addAttribute("error", "Error while sending email");
        }
        return "auth/forgot-password";
    }

    @GetMapping("/auth/reset-password")
    public String resetPasswordForm(@Param(value = "token") String token, Model model) {
        Account account = accountService.getByToken(token);
        model.addAttribute("token", token);
        if (account == null) {
            model.addAttribute("message", "Invalid token!");
            return "redirect:/auth/login/form";
        }
        return "auth/reset-password";
    }

    @PostMapping("/auth/reset-password")
    public String processResetPassword(@RequestParam("token") String code, @RequestParam("password") String password,
                                       HttpServletResponse response, Model model) {
        Account token = accountService.getByToken(code);
        if (token == null) {
            model.addAttribute("message", "Invalid token!");
        } else {
            accountService.updatePassword(token, password);
            model.addAttribute("message", "You have successfully changed your password!");
            response.addHeader("refresh", "2;url=/auth/login/form");
        }
        return "auth/reset-password";
    }

    @GetMapping("/auth/change-password")
    public String changePasswordForm(Model model) {
        return "auth/change-password";
    }

    @PostMapping("/auth/change-password")
    public String processChangePassword(Model model, @RequestParam("username") String username,
                                        @RequestParam("password") String newPassword) {
        Account account = accountService.findById(username);
        accountService.changePassword(account, newPassword);
        model.addAttribute("message", "Change password successfully!");
        return "auth/change-password";
    }

    @GetMapping("/auth/change-info")
    public String changeInfo(Model model) {
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = userDetails.getUsername();
        Account account = accountService.findById(username);
        model.addAttribute("account", account);
        return "auth/index";
    }

    @PostMapping("/auth/change-info")
    public String updateInfo(
            Model model,
            @Validated @ModelAttribute("account") Account account,
            Errors errors, @RequestParam("file") MultipartFile file) {
        if (errors.hasErrors()) {
            model.addAttribute("updateFalse", true);
            System.out.println(errors.getAllErrors());
            return "auth/index";
        }
        if (file != null && !file.isEmpty()) {
            try {
                String folder = "images";

                File savedFile = uploadService.save(file, folder);

                String relativeImagePath = savedFile.getName();
                account.setPhoto(relativeImagePath);
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println(e.getMessage());
                model.addAttribute("", true);
                return "auth/index";
            }
        } else {
            account.setPhoto("user.png");
        }
        account.setUsername(account.getUsername());
        account.setPassword(account.getPassword());
        account.setTrangThai(account.getTrangThai());
        account.setToken(account.getToken());
        accountService.update(account);
        model.addAttribute("updateSuccess", true);
        return "auth/index";
    }






    public String getSiteURL(HttpServletRequest request) {
        String siteURL = request.getRequestURL().toString();
        return siteURL.replace(request.getServletPath(), "");
    }
}
