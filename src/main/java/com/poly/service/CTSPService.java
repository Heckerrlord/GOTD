package com.poly.service;

import java.util.List;

import com.poly.entity.ChiTietSanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface CTSPService {
	List<ChiTietSanPham> findAll();

	ChiTietSanPham findById(Long id);

	ChiTietSanPham create(ChiTietSanPham product);

	ChiTietSanPham update(ChiTietSanPham product);

	void delete(Long id);
	List<ChiTietSanPham> findFavorites(String username);

	Page<ChiTietSanPham> getListCTSP(String maThuongHieu, String maMau, String maKichCo, Long minGiaBan, Long maxGiaBan, Pageable pageable);


	Page<ChiTietSanPham> findByFilters(String brandNames,
									   String sizes,
									   String colors,
									   Long minPrice,
									   Long maxPrice,
									   Pageable pageable);

	Page<ChiTietSanPham> findDistinctByMaspp(Pageable pageable);

	Page<ChiTietSanPham> findAllOrderByGiaBanAsc(Pageable pageable);
}
