package com.poly.controller;

import com.poly.dao.CTSPDAO;
import com.poly.dao.DSYTDAO;
import com.poly.dao.DanhGiaDAO;
import com.poly.dao.daoPhu.KichCoDAO;
import com.poly.dao.daoPhu.MauSacDAO;
import com.poly.entity.*;
import com.poly.service.CTSPService;
import com.poly.service.serPhu.CoAoService;
import com.poly.service.serPhu.KichCoService;
import com.poly.service.serPhu.MauSacService;
import com.poly.service.serPhu.ThuongHieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductController {
	@Autowired
	CTSPService productService;
	@Autowired
	CTSPDAO pdao;
	@Autowired
	MauSacService mausacService;
	@Autowired
	MauSacDAO mdao;
	@Autowired
	KichCoDAO kcdao;
	@Autowired
	KichCoService kichcoService;
	@Autowired
	private ThuongHieuService thuongHieuService;

	@Autowired
	private CoAoService coAoService;

	@Autowired
	private MauSacService mauSacService;

	@Autowired
	private DSYTDAO dsytdao;

	@Autowired
	private DanhGiaDAO danhGiaDAO;



	@GetMapping("/product/detail/{sanPhamMa}")
	public String detailSanPham(
			Model model,
			@PathVariable String sanPhamMa,
			@RequestParam(required = false) String size,
			@RequestParam(required = false) String color
	) {
		Double averageRating = danhGiaDAO.findAverageRatingByMaSanPham(sanPhamMa);
		averageRating = (averageRating != null) ? averageRating : 5;
		ChiTietSanPham item;
		if (size != null && color != null) {
			item = pdao.findFirstBySanPhamMaAndKichCoCodeAndMauSacCode(sanPhamMa,size,color);
		} else if (size != null) {
			item = pdao.findFirstBySanPhamMaAndKichCoCode(sanPhamMa, size);
		} else if (color != null) {
			item = pdao.findFirstBySanPhamMaAndMauSacCode(sanPhamMa, color);
		} else {
			item = pdao.findFirstBySanPhamMa(sanPhamMa);
		}

		List<DanhSachYeuThich> list1 = dsytdao.findAll();
		model.addAttribute("favorite",list1);
		model.addAttribute("m", mdao.findMauSacByMaSanPham(item.getSanPham().getMa()));
		model.addAttribute("kc", kcdao.findAll());
		model.addAttribute("item", item);
		model.addAttribute("averageRating",averageRating);
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
		List<KichCo> kichCos = kichcoService.findAll();
		model.addAttribute("categories", kichCos);
		ArrayList<Integer> categoryIds = new ArrayList<Integer>();
		for (KichCo category : kichCos) {
			categoryIds.add(category.getId());
		}



		List<ChiTietSanPham> list = pdao.findDistinctByMasp();
		model.addAttribute("items", list);
		List<DanhSachYeuThich> list1 = dsytdao.findAll();
		model.addAttribute("favorite",list1);
		return "sanpham";
	}

}
