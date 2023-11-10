package com.poly.controller;

import com.poly.dao.CTSPDAO;
import com.poly.dao.DSYTDAO;
import com.poly.entity.ChiTietSanPham;
import com.poly.entity.DanhSachYeuThich;
import com.poly.entity.phu.CoAo;
import com.poly.entity.phu.KichCo;
import com.poly.entity.phu.MauSac;
import com.poly.entity.phu.ThuongHieu;
import com.poly.service.CTSPService;
import com.poly.service.SanPhamService;
import com.poly.service.serPhu.CoAoService;
import com.poly.service.serPhu.KichCoService;
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
	CTSPDAO pdao;
	@Autowired
	MauSacService mausacService;
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
	@RequestMapping("/product/detail/{id}")
	public String detail(Model model, @PathVariable("id") Long id) {
		ChiTietSanPham item = productService.findById(id);
		List<MauSac> m = mausacService.findAll();
		List<KichCo> kc = kichcoService.findAll();
		model.addAttribute("item", item);
		model.addAttribute("m", m);
		model.addAttribute("kc", kc);
		List<DanhSachYeuThich> list1 = dsytdao.findAll();
		model.addAttribute("favorite",list1);
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

		List<ChiTietSanPham> list = pdao.findDistinctByMasp();
		model.addAttribute("items", list);

		List<DanhSachYeuThich> list1 = dsytdao.findAll();
		model.addAttribute("favorite",list1);

		return "sanpham";
	}

}
