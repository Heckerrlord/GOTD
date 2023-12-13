package com.poly.controller;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import com.poly.dao.AuthorityDAO;
import com.poly.dao.DonHangDAO;
import com.poly.dao.RoleDAO;
import com.poly.entity.Account;
import com.poly.entity.Authority;
import com.poly.entity.Role;
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
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

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
    @Autowired
    AuthorityDAO aDao;
    @Autowired
    RoleDAO roleDAO;
    @Autowired
    DonHangDAO donHangDAO;



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
        session.setAttribute("authenticatedAccount", account);
        Account account1 = accountDAO.findByUsername(rq.getRemoteUser());
        String[] roles = account1.getAuthorities().stream()
                .map(er -> er.getRole().getId())
                .toArray(String[]::new); // Chuyển kết quả thành một mảng String[]
        boolean hasDireRole = Arrays.asList(roles).contains("DIRE"); // Kiểm tra xem mảng roles có chứa role "DIRE" không
        if (hasDireRole) {
            return "redirect:/admin";
        } else {
            model.addAttribute("message", "Đăng nhập thành công");
            return "redirect:/index";
        }
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
        if (accountService.isUsernameExists(account.getUsername())) {
            model.addAttribute("message", "Tên đăng nhập đã tồn tại");
            return "auth/register";
        }
        if (accountService.isEmailExists(account.getEmail())){
            model.addAttribute("message","Email này đã tồn tại");
            return "auth/register";
        }
        account.setPhoto("user.png");
        account.setToken("token");
        account.setTrangThai(0);
        accountService.create(account);
        Role role = roleDAO.findById("CUST").get();
        Authority a = new Authority();
        a.setAccount(account);
        a.setRole(role);
        aDao.save(a);
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
            Optional<Account> optionalAccount = accountService.findByEmail(email);
           if (optionalAccount.isPresent()) {
               String token = RandomString.make(50);
               accountService.updateToken(token, email);
               String resetLink = getSiteURL(request) + "/auth/reset-password?token=" + token;
               mailer.sendEmail(email, resetLink);
               model.addAttribute("message", "We have sent a reset password link to your email. "
                       + "If you don't see the email, check your spam folder.");
           }else{
               model.addAttribute("message", "Email không tồn tại");
           }
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
        model.addAttribute("tiensd", donHangDAO.tongTienDaSd(rq.getRemoteUser()));
        model.addAttribute("donmua" , donHangDAO.donHang(rq.getRemoteUser()));
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
        model.addAttribute("tiensd", donHangDAO.tongTienDaSd(rq.getRemoteUser()));
        model.addAttribute("donmua" , donHangDAO.donHang(rq.getRemoteUser()));
        accountService.update(account);

        model.addAttribute("updateSuccess", true);
        return "auth/index";
    }






    public String getSiteURL(HttpServletRequest request) {
        String siteURL = request.getRequestURL().toString();
        return siteURL.replace(request.getServletPath(), "");
    }
}
