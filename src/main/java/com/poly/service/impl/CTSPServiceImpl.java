package com.poly.service.impl;

import com.poly.dao.CTSPDAO;
import com.poly.entity.ChiTietSanPham;
import com.poly.service.CTSPService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
	public List<ChiTietSanPham> findFavorites(String username) {
		return pdao.findFavorite(username);
	}

	@Override
	public Page<ChiTietSanPham> getListCTSP(String maThuongHieu, String maMau, String maKichCo, Long minGiaBan, Long maxGiaBan, Pageable pageable) {
		return pdao.getListCTSP(maThuongHieu,maMau,maKichCo,minGiaBan,maxGiaBan,pageable);
	}

	@Override
	public Page<ChiTietSanPham> findByFilters(String brandNames, String sizes, String colors, Long minPrice, Long maxPrice, Pageable pageable) {
		return pdao.findByFilters(brandNames, sizes, colors, minPrice, maxPrice, pageable);
	}

	@Override
	public Page<ChiTietSanPham> findDistinctByMaspp(Pageable pageable) {
		return pdao.findDistinctByMaspp(pageable);
	}

	@Override
	public Page<ChiTietSanPham> findAllOrderByGiaBanAsc(Pageable pageable) {
		return pdao.findAllOrderByGiaBanAsc(pageable);
	}


}
