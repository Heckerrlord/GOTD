package com.poly.rest;

import com.fasterxml.jackson.databind.JsonNode;
import com.poly.dao.GioHangCTDAO;
import com.poly.dao.daoPhu.MaGiamGiaDAO;
import com.poly.entity.ChiTietSanPham;
import com.poly.entity.DonHang;
import com.poly.entity.GioHang;
import com.poly.entity.GioHangChiTiet;
import com.poly.entity.phu.DiaChi;
import com.poly.entity.phu.MaGiamGia;
import com.poly.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/cart")
public class GioHangRestController {

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
	MaGiamGiaDAO mdao;


	@GetMapping("/view")
	public List<GioHangChiTiet> showCart(Model model) {
		try {
			String username = request.getRemoteUser();
			GioHang gioHang = cartService.findByUsernameAndTrangThai(username,0);
			if (gioHang == null) {
				gioHang = new GioHang();
				gioHang.setAccount(accservice.findById(username)); // Gán tài khoản cho giỏ hàng
				gioHang.setTrangThai(0);
				cartService.create(gioHang);

			}
			List<GioHangChiTiet> cartItems = cartdetailService.findByIdGioHangAndTrangThai(gioHang.getId(),0);
			return cartItems;
		}catch (Exception e){
			return null;
		}

	}



	@PostMapping("/add/{chiTietSanPhamId}")
	public ResponseEntity<?> addToCart(@PathVariable Long chiTietSanPhamId) {
			try {
				String username = request.getRemoteUser();
				GioHang gioHang = cartService.findByUsernameAndTrangThai(username,0);
				if (gioHang == null) {
					gioHang = new GioHang();
					gioHang.setAccount(accservice.findById(username));
					gioHang.setTrangThai(0);// Gán tài khoản cho giỏ hàng
					cartService.create(gioHang);
				}
				GioHangChiTiet existingCartItem = cartdetailService.findByChiTietSanPhamIdAndGioHangIdAndTrangThai(chiTietSanPhamId, gioHang.getId(), 0);
				if (existingCartItem != null) {
					existingCartItem.setSoLuong(existingCartItem.getSoLuong() + 1);
					cartdetailService.update(existingCartItem);
				} else {
					ChiTietSanPham chiTietSanPham = spservice.findById(chiTietSanPhamId);
					GioHangChiTiet newCartItem = new GioHangChiTiet(gioHang, chiTietSanPham, 1, chiTietSanPham.getGiaBan(), 0);
					cartdetailService.create(newCartItem);
				}
				return ResponseEntity.ok().build();
			}catch (Exception e){
				e.printStackTrace();
				return null;
			}
	}


	@PutMapping("/{id}")
	public ResponseEntity<?> updateCartItem(@PathVariable Long id, @RequestBody Map<String, Integer> requestBody) {
		Integer newQuantity = requestBody.get("newQuantity");
		GioHangChiTiet cartItem = cartdetailDao.findById(id).get();
		if (cartItem != null) {
			cartItem.setSoLuong(newQuantity);
			System.out.println(newQuantity);
			cartdetailService.update(cartItem);
			return ResponseEntity.ok().build();
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Không tìm thấy mục trong giỏ hàng");
		}
	}


	@DeleteMapping("/remove/{id}")
	@Transactional
	public ResponseEntity<?> removeCartItem(@PathVariable Long id) {
	cartdetailService.delete(id);
	return ResponseEntity.ok().build();
	}

	@DeleteMapping("/clear")
	@Transactional
	public ResponseEntity<?> clearCart() {
		String username = request.getRemoteUser();
		GioHang gioHang = cartService.findByUsernameAndTrangThai(username,0);
		if (gioHang != null) {
			cartdetailService.deleteAllItemsInCart(gioHang);
		}
		return ResponseEntity.ok().build();
	}






}






