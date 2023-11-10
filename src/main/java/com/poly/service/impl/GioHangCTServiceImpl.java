package com.poly.service.impl;

import com.poly.dao.GioHangCTDAO;
import com.poly.dao.GioHangDAO;
import com.poly.entity.GioHang;
import com.poly.entity.GioHangChiTiet;
import com.poly.service.GioHangCTService;
import com.poly.service.GioHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GioHangCTServiceImpl implements GioHangCTService {
	@Autowired
	GioHangCTDAO dao;

	@Override
	public GioHangChiTiet create(GioHangChiTiet gioHangCT) {
	return dao.save(gioHangCT);
	}

	@Override
	public GioHangChiTiet update(GioHangChiTiet gioHangCT) {
		return dao.save(gioHangCT);
	}



	@Override
	public List<GioHangChiTiet> findByIdGioHangAndTrangThai(Long idGioHang,
													 Integer trangThai){
		return dao.findByIdGioHangAndTrangThai(idGioHang, trangThai);
	}


	@Override
	public void delete(Long id){
		dao.deleteById(id);
	}

	@Override
	public GioHangChiTiet findByChiTietSanPhamIdAndGioHangIdAndTrangThai(Long chiTietSanPhamId, Long i, int i1){
		return dao.findByChiTietSanPhamIdAndGioHangIdAndTrangThai(chiTietSanPhamId,i,i1);
	}
	@Override
	public void deleteAllItemsInCart(GioHang gioHang) {
		dao.deleteAllByGioHang(gioHang);
	}
}
