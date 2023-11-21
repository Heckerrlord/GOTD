package com.poly.controller;

import com.poly.dao.CTSPDAO;
import com.poly.dao.DSYTDAO;
import com.poly.dao.DanhGiaDAO;
import com.poly.dao.daoPhu.KichCoDAO;
import com.poly.dao.daoPhu.MauSacDAO;
import com.poly.entity.ChiTietSanPham;
import com.poly.entity.DanhSachYeuThich;
import com.poly.entity.CoAo;
import com.poly.entity.ThuongHieu;
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
		Double averageRating = danhGiaDAO.findAverageRatingByMaSanPham(sanPhamMa);
		averageRating = (averageRating != null) ? averageRating : 5;
		List<DanhSachYeuThich> list1 = dsytdao.findAll();
		model.addAttribute("favorite",list1);
		model.addAttribute("m", mdao.findMauSacByMaSanPham(item.getSanPham().getMa()));
		model.addAttribute("kc", kcdao.findKichCoByMaSanPham(item.getSanPham().getMa()));
		model.addAttribute("item", item);
		model.addAttribute("averageRating",averageRating);
		return "product/detail";
	}


//	@RequestMapping("/product/detail/{id}")
//	public String detail(Model model, @PathVariable("id") Long id) {
//		ChiTietSanPham item = productService.findById(id);
//		List<MauSac> m = mausacService.findAll();
//		List<KichCo> kc = kichcoService.findAll();
//
//
//
//
//
//		model.addAttribute("item", item);
//		model.addAttribute("m", m);
//		model.addAttribute("kc", kc);
//		List<DanhSachYeuThich> list1 = dsytdao.findAll();
//		model.addAttribute("favorite",list1);
//		return "product/detail";
//	}


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
//		List<MauSac> colors = mauSacService.findAll();
//		model.addAttribute("colors", colors);
		List<ChiTietSanPham> list = pdao.findDistinctByMasp();
		model.addAttribute("items", list);
		List<DanhSachYeuThich> list1 = dsytdao.findAll();
		model.addAttribute("favorite",list1);
		return "sanpham";
	}

}
