//package com.poly.controller;
//
//import com.poly.dao.CTSPDAO;
//import com.poly.dao.DonHangCTDAO;
//import com.poly.dao.DonHangDAO;
//import com.poly.dao.SanPhamDAO;
//import com.poly.entity.ChiTietSanPham;
//import com.poly.entity.DonHang;
//import com.poly.entity.DonHangChiTiet;
//import com.poly.entity.SanPham;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import javax.servlet.http.HttpServletRequest;
//import java.util.List;
//
//@Controller
//public class CartController {
//    @Autowired
//    private CTSPDAO productRepository;
//    @Autowired
//    private DonHangCTDAO donHangCTDAO;
//    @Autowired
//    private DonHangDAO donHangDAO;
//    @Autowired
//    HttpServletRequest request;
//
//
//    @GetMapping("/cart/view")
//    public String showCart(Model model) {
//        Long idDonHang=donHangDAO.findByUsernameAndTrangThai("admin",0).getId();
//        List<DonHangChiTiet> cartItems = donHangCTDAO.findByIdDonHangAndTrangThai(idDonHang,0);
//                model.addAttribute("cartItems", cartItems);
//        return "/cart/view";
//    }
//
//    @PostMapping("/cart/add/{productId}")
//    public String addToCart(@PathVariable Long productId) {
//        // Thêm sản phẩm vào giỏ hàng (cập nhật session/cookies)
//        return "redirect:/cart";
//    }
//
//    @PostMapping("/cart/remove/{productId}")
//    public String removeFromCart(@PathVariable Long productId) {
//        // Xóa sản phẩm khỏi giỏ hàng (cập nhật session/cookies)
//        return "redirect:/cart";
//    }
//
//    @GetMapping("/checkout")
//    public String checkout(Model model) {
//        // Hiển thị trang thanh toán
//        return "checkout";
//    }
//}
