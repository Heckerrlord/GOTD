package com.poly.service.impl;

import com.poly.dao.DonHangCTDAO;
import com.poly.dao.GioHangCTDAO;
import com.poly.entity.DonHangChiTiet;
import com.poly.entity.GioHang;
import com.poly.entity.GioHangChiTiet;
import com.poly.service.DonHangCTService;
import com.poly.service.GioHangCTService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DonHangCTServiceImpl implements DonHangCTService {
	@Autowired
	DonHangCTDAO dao;

	@Override
	public DonHangChiTiet create(DonHangChiTiet gioHangCT) {
	return dao.save(gioHangCT);
	}



	@Override
	public void delete(Long id){
		dao.deleteById(id);
	}

//	@Override
//	public DonHangChiTiet findByChiTietSanPhamIdAndGioHangIdAndTrangThai(Long chiTietSanPhamId, Long i, int i1){
//		return dao.findByChiTietSanPhamIdAndGioHangIdAndTrangThai(chiTietSanPhamId,i,i1);
//	}
//	@Override
//	public void deleteAllItemsInCart(GioHang gioHang) {
//		dao.deleteAllByGioHang(gioHang);
//	}
}
