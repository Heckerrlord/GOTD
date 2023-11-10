package com.poly.rest;

import com.poly.dao.DonHangCTDAO;
import com.poly.dao.DonHangDAO;
import com.poly.dao.GioHangCTDAO;
import com.poly.entity.*;
import com.poly.entity.phu.ChatLieu;
import com.poly.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/order")
public class OrderRestController {

	@Autowired
	GioHangCTService cartdetailService;

	@Autowired
	GioHangCTDAO cartdetailDao;

	@Autowired
	GioHangService cartService;

	@Autowired
	CTSPService spservice;

	@Autowired
	AccountService accservice;

	@Autowired
	HttpServletRequest request;
	@Autowired
	DonHangDAO orderDao;
	@Autowired
	DonHangService orderService;
	@Autowired
	DonHangCTDAO orderDetailService;

	@PostMapping
	@Transactional
	public GioHang create(@RequestBody GioHang gioHang) {
		DonHang donHang = new DonHang(gioHang);
		donHang.setTrangThai(0);
		orderService.create(donHang);

		GioHang gioHang1 = cartService.findByUsernameAndTrangThai(request.getRemoteUser(), 0);

		List<GioHangChiTiet> list;
		list = cartdetailDao.findByGioHang(gioHang1);

		List<DonHangChiTiet> donHangChiTietList = new ArrayList<>();
		for (GioHangChiTiet gioHangChiTiet : list) {
			DonHangChiTiet donHangChiTiet = new DonHangChiTiet();
			donHangChiTiet.setDonHang(donHang);
			donHangChiTiet.setChiTietSanPham(gioHangChiTiet.getChiTietSanPham());
			donHangChiTiet.setSoLuong(gioHangChiTiet.getSoLuong());
			donHangChiTiet.setDonGia(gioHangChiTiet.getDonGia());
			donHangChiTiet.setTrangThai(0);
			donHangChiTietList.add(donHangChiTiet);
			orderDetailService.saveAll(donHangChiTietList);
		}
		cartdetailService.deleteAllItemsInCart(gioHang1);
		return null;
	}

	
	@GetMapping
	public List<DonHang> getAll(Model model,int tt) {
		model.addAttribute("item", orderDao.findAllByTrangThai(0));
		model.addAttribute("item1", orderDao.findAllByTrangThai(1));
		model.addAttribute("item2", orderDao.findAllByTrangThai(2));
		return orderDao.findAllByTrangThai(tt);
	}

	@PutMapping("{id}")
	public DonHang update(@PathVariable("id") Long id,
						   @RequestBody DonHang donHang) {
		return orderDao.save(donHang);
	}

}






