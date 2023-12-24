package com.poly.rest;

import com.poly.dao.CTSPDAO;
import com.poly.dao.DonHangCTDAO;
import com.poly.dao.DonHangDAO;
import com.poly.dao.GioHangCTDAO;
import com.poly.dao.daoPhu.MaGiamGiaDAO;
import com.poly.entity.*;
import com.poly.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.net.URI;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

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
	CTSPDAO spservice;
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
	public ResponseEntity<Object> createGioHang(@RequestBody GioHang gioHang) {
		DonHang donHang = new DonHang(gioHang);

        donHang.setNgayDatHang(LocalDateTime.now());
		MaGiamGia mgg = mdao.findMaGiamGiaByMa(donHang.getMaGiamGia());
		if (mgg != null) {
			mgg.setSl(mgg.getSl() - 1);
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

		List<Long> chiTietSanPhamIds = donHangChiTietList.stream()
				.map(donHangChiTiet -> donHangChiTiet.getChiTietSanPham().getId())
				.collect(Collectors.toList());

		List<ChiTietSanPham> chiTietSanPhamList = spservice.findAllById(chiTietSanPhamIds);

		for (ChiTietSanPham chiTietSanPham : chiTietSanPhamList) {
			for (DonHangChiTiet donHangChiTiet : donHangChiTietList) {
				if (donHangChiTiet.getChiTietSanPham().getId().equals(chiTietSanPham.getId())) {
					int soLuongHienTai = chiTietSanPham.getSoLuong();
					int soLuongDaMua = donHangChiTiet.getSoLuong();
					chiTietSanPham.setSoLuong(soLuongHienTai - soLuongDaMua);
					spservice.save(chiTietSanPham);
					break;
				}
			}
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
	public List<DonHang> getAll(Model model, int tt) {
		return orderDao.findAllByTrangThai(tt);
	}

	@PostMapping("/delete/{id}")
	public void deleteDHCT(@PathVariable long id) {
		orderDetailService.deleteById(id);
	}

	@PutMapping("/update/{id}")
	public DonHang update(@PathVariable("id") Long id,
						  @RequestBody DonHang donHang) {
		for (int i = 0; i < donHang.getChiTietDonHangList().size(); i++) {
			DonHangChiTiet obj = donHang.getChiTietDonHangList().get(i);
			obj.setDonHang(donHang);
			orderDetailService.saveAndFlush(obj);
			ChiTietSanPham chiTietSanPham = obj.getChiTietSanPham();
			int soluongform = obj.getSoLuong();
			if (chiTietSanPham != null) {
				int soLuongHienTai = chiTietSanPham.getSoLuong();
				int soLuongMoi = soLuongHienTai - soluongform;
				if (soLuongMoi >= 0) {
					chiTietSanPham.setSoLuong(soLuongMoi);
					spservice.save(chiTietSanPham);
				} else {

				}
			}
		}

		return orderDao.save(donHang);
	}

	@PutMapping("/huydon/{id}")
	public DonHang huydon(@PathVariable("id") Long id,
						  @RequestBody DonHang donHang) {
		for (int i = 0; i < donHang.getChiTietDonHangList().size(); i++) {
			DonHangChiTiet obj = donHang.getChiTietDonHangList().get(i);
			obj.setDonHang(donHang);
			orderDetailService.saveAndFlush(obj);
			ChiTietSanPham chiTietSanPham = obj.getChiTietSanPham();
			int soluongform = obj.getSoLuong();
			if (chiTietSanPham != null) {
				int soLuongHienTai = chiTietSanPham.getSoLuong();
				int soLuongMoi = soLuongHienTai + soluongform;
				if (soLuongMoi >= 0) {
					chiTietSanPham.setSoLuong(soLuongMoi);
					spservice.save(chiTietSanPham);
				} else {

				}
			}
		}

		return orderDao.save(donHang);
	}



	@GetMapping("/discount/{ma}")
	public MaGiamGia getmgg(@PathVariable("ma") String ma) {
		return mdao.findMaGiamGiaByMa(ma);
	}

}
