package com.poly.controller;

import com.poly.entity.ChiTietSanPham;
import com.poly.entity.phu.CoAo;
import com.poly.entity.phu.MauSac;
import com.poly.entity.phu.ThuongHieu;
import com.poly.service.CTSPService;
import com.poly.service.serPhu.CoAoService;
import com.poly.service.serPhu.MauSacService;
import com.poly.service.serPhu.ThuongHieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductController {
	@Autowired
	CTSPService productService;

	@Autowired
	private ThuongHieuService thuongHieuService;

	@Autowired
	private CoAoService coAoService;

	@Autowired
	private MauSacService mauSacService;

	@RequestMapping("/product/detail/{id}")
	public String detail(Model model, @PathVariable("id") Long id) {
		ChiTietSanPham item = productService.findById(id);
		model.addAttribute("item", item);
		return "product/detail";
	}

	@GetMapping("/sanpham")
	public String getShopPage(Model model) {
		// Get list brand
		List<ThuongHieu> brands = thuongHieuService.findAll();
		model.addAttribute("brands", brands);
		ArrayList<Integer> brandIds = new ArrayList<Integer>();
		for (ThuongHieu brand : brands) {
			brandIds.add(brand.getId());
		}
		model.addAttribute("brandIds", brandIds);

		// Get list category
		List<CoAo> coAos = coAoService.findAll();
		model.addAttribute("categories", coAos);
		ArrayList<Integer> categoryIds = new ArrayList<Integer>();
		for (CoAo category : coAos) {
			categoryIds.add(category.getId());
		}

		// Get list color
		List<MauSac> sizeVn = mauSacService.findAll();
		model.addAttribute("sizeVn", sizeVn);

		// Get list product
//		FilterProductReq req = new FilterProductReq(brandIds, categoryIds, new ArrayList<>(), (long) 0, Long.MAX_VALUE, 1);
//		PageableDto result = productService.filterProduct(req);
//		model.addAttribute("totalPages", result.getTotalPages());
//		model.addAttribute("currentPage", result.getCurrentPage());
//		model.addAttribute("listProduct", result.getItems());
		return "sanpham";
	}
}
