package com.poly.service.impl;

import com.poly.dao.CTSPDAO;
import com.poly.entity.ChiTietSanPham;
import com.poly.service.CTSPService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CTSPServiceImpl implements CTSPService {
	@Autowired
	CTSPDAO pdao;

	@Override
	public List<ChiTietSanPham> findAll() {
		return pdao.findAll();
	}

	@Override
	public ChiTietSanPham findById(Long id) {
		return pdao.findById(id).get();
	}

	public ChiTietSanPham create(ChiTietSanPham product) {
		return pdao.save(product);
	}

	@Override
	public ChiTietSanPham update(ChiTietSanPham product) {
		return pdao.save(product);
	}

	@Override
	public void delete(Long id) {
		pdao.deleteById(id);
	}

	@Override
	public List<ChiTietSanPham> findChiTietSanPhamBySanPhamMa(String ma){
		return pdao.findChiTietSanPhamBySanPhamMa(ma);
	};

	@Override
	public List<ChiTietSanPham> findFavorites(String username) {
		return pdao.findFavorite(username);
	}
}
