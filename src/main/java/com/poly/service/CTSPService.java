package com.poly.service;

import java.util.List;

import com.poly.entity.ChiTietSanPham;
import com.poly.model.dto.ChiTietSanPhamDTO;
import com.poly.model.dto.ChiTietSanPhamResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;

public interface CTSPService {
    List<ChiTietSanPham> findAll();

    ChiTietSanPham findById(Long id);

    ChiTietSanPham create(ChiTietSanPham product);

    ChiTietSanPham update(ChiTietSanPham product);

    void delete(Long id);

    List<ChiTietSanPham> findFavorites(String username);

    Page<ChiTietSanPham> getListCTSP(String maThuongHieu, String maMau, String maKichCo, Long minGiaBan, Long maxGiaBan, Pageable pageable);


    Page<ChiTietSanPham> findByFilters(
            String keywords,
            String brandNames,
            String sizes,
            String colors,
            String categories,
            Long minPrice,
            Long maxPrice,
            String sortType,
            Pageable pageable);

    Page<ChiTietSanPham> findDistinctByMaspp(Pageable pageable);

    List<ChiTietSanPhamDTO> findTop5SanPhamBySoLuongBan(Pageable pageable);

    List<ChiTietSanPhamResponse> findTop5SanPhamBySoLuongBan();


}
