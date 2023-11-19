package com.poly.rest;

import com.poly.dao.DonHangCTDAO;
import com.poly.dao.DonHangDAO;
import com.poly.dao.GioHangCTDAO;
import com.poly.dao.daoPhu.MaGiamGiaDAO;
import com.poly.entity.*;
import com.poly.entity.MaGiamGia;
import com.poly.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.net.URI;
import java.util.ArrayList;
import java.util.List;

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
	@Autowired
	MaGiamGiaDAO mdao;

	@PostMapping
	@Transactional
	public ResponseEntity<Object> createGioHang(@RequestBody GioHang gioHang){
		DonHang donHang = new DonHang(gioHang);
		donHang.setTrangThai(0);

		MaGiamGia mgg = mdao.findMaGiamGiaByMa(donHang.getMaGiamGia());
		if (mgg !=null){
			mgg.setSl(mgg.getSl()-1);
			mdao.save(mgg);
		}

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
		Long gioHangId = donHang.getId();
		String location = ServletUriComponentsBuilder
				.fromCurrentContextPath()
				.path("/cart/bill/")
				.path(String.valueOf(gioHangId))
				.toUriString();

		return ResponseEntity.created(URI.create(location)).build();
	}

	
	@GetMapping
	public List<DonHang> getAll(Model model,int tt) {
		return orderDao.findAllByTrangThai(tt);
	}

	@PutMapping("/update/{id}")
	public DonHang update(@PathVariable("id") Long id,
						   @RequestBody DonHang donHang) {
		return orderDao.save(donHang);
	}
	@GetMapping("/discount/{ma}")
		public MaGiamGia getmgg(@PathVariable("ma") String ma){
			return mdao.findMaGiamGiaByMa(ma);
	}


}






