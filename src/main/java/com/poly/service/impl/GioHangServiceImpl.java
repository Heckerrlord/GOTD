package com.poly.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.poly.dao.DonHangCTDAO;
import com.poly.dao.DonHangDAO;
import com.poly.dao.GioHangCTDAO;
import com.poly.dao.GioHangDAO;
import com.poly.entity.DonHang;
import com.poly.entity.DonHangChiTiet;
import com.poly.entity.GioHang;
import com.poly.service.DonHangService;
import com.poly.service.GioHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class GioHangServiceImpl implements GioHangService {
	@Autowired
	GioHangDAO dao;

	@Autowired
	GioHangCTDAO ddao;


	@Override
	public GioHang create(GioHang gioHang) {
	return dao.save(gioHang);
	}

	@Override
	public GioHang update(Long id, GioHang updatedOrder) {
		// Kiểm tra xem đơn hàng có tồn tại hay không
		Optional<GioHang> existingOrder = dao.findById(id);
		if (existingOrder.isPresent()) {
			// Lấy đơn hàng hiện tại
			GioHang currentOrder = existingOrder.get();
			// Lưu đơn hàng đã cập nhật vào cơ sở dữ liệu
			return dao.save(currentOrder);
		} else {
			// Xử lý khi đơn hàng không tồn tại
			return null;
		}
	}


	@Override
	public GioHang findById(Long id) {
		return dao.findById(id).get();
	}

	@Override
	public GioHang findByUsername(String username) {
		return dao.findByUsername(username);
	}

	@Override
	public GioHang findByUsernameAndTrangThai(String username,Integer TrangThai) {
		return dao.findByUsernameAndTrangThai(username,TrangThai);
	}

	@Override
	public void delete(Long id){
		dao.deleteById(id);
	}


}
