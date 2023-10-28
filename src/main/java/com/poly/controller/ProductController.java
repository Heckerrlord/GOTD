package com.poly.controller;

import com.poly.entity.ChiTietSanPham;
import com.poly.service.CTSPService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	@Autowired
	CTSPService productService;

	@RequestMapping("/product/detail/{id}")
	public String detail(Model model, @PathVariable("id") Long id) {
		ChiTietSanPham item = productService.findById(id);
		model.addAttribute("item", item);
		return "product/detail";
	}
}
