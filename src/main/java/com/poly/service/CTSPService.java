package com.poly.service;

import java.util.List;

import com.poly.entity.ChiTietSanPham;

public interface CTSPService {
	List<ChiTietSanPham> findAll();

	ChiTietSanPham findById(Long id);

	ChiTietSanPham create(ChiTietSanPham product);

	ChiTietSanPham update(ChiTietSanPham product);

	void delete(Long id);

}
