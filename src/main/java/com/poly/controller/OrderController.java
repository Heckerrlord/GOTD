package com.poly.controller;



import com.poly.dao.DonHangDAO;
import com.poly.dao.daoPhu.MaGiamGiaDAO;
import com.poly.entity.DonHang;
import com.poly.entity.phu.MaGiamGia;
import com.poly.service.DonHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class OrderController {

	@Autowired
    DonHangService DHService;

	@Autowired
	DonHangDAO DHDao;
	@Autowired
    HttpServletRequest request;
	@Autowired
	MaGiamGiaDAO mdao;

	@RequestMapping("/cart/view")
	public String cart() {
		return "cart/view";
	}

	@RequestMapping("/cart/checkout")
	public String checkout(Model model) {
		if (!(request.isUserInRole("DIRE") || request.isUserInRole("STAF") || request.isUserInRole("CUST"))) {
			return "redirect:/auth/login/form";
		}
		List<MaGiamGia> list= mdao.findAll();
		model.addAttribute("mgg",list);
		return "cart/checkout";
	}

	@RequestMapping("/order/list")
	public String list(Model model, HttpServletRequest request) {
		String username = request.getRemoteUser();
		model.addAttribute("orders", DHDao.findByUsername(username));
		return "order/list";
	}

	@GetMapping("/order/cancel/{id}")
	public String updateStatus(@PathVariable("id") Long id){
		DonHang dh = DHDao.findById(id).get();
		dh.setTrangThai(2);
		DHDao.save(dh);
		return "redirect:order/list";
	}

	@RequestMapping("/order/detail/{id}")
	public String detail(@PathVariable("id") Long id, Model model) {
		model.addAttribute("order", DHService.findById(id));
		return "order/detail";
	}
	@RequestMapping("/cart/bill/{id}")
	public String bill(@PathVariable("id") Long id, Model model) {
		model.addAttribute("order", DHService.findById(id));
		return "cart/bill";
	}


}
