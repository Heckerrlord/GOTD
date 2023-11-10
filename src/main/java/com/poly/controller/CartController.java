//package com.poly.controller;
//
//import com.poly.dao.*;
//import com.poly.entity.*;
//import com.poly.service.CTSPService;
//import com.poly.service.GioHangCTService;
//import com.poly.service.GioHangService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//
//import javax.servlet.http.HttpServletRequest;
//import java.util.List;
//
//@Controller
//public class CartController {
//    @Autowired
//    private CTSPService productRepository;
//    @Autowired
//    private GioHangCTService GHCTDAO;
//    @Autowired
//    private GioHangService GHDAO;
//    @Autowired
//    HttpServletRequest request;
//
//@PostMapping("/createGioHang")
//    public String gioHang(@RequestBody GioHang gioHang){
//    gioHang.setSoDienThoai("0396884026");
//    GHDAO.create(gioHang);
//    return "redirect:/index";
//}
//
//}
