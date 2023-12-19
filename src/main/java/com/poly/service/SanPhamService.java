package com.poly.service;

import com.poly.entity.SanPham;

import java.util.List;

public interface SanPhamService {
    List<SanPham> findAll();

    SanPham findById(Integer id);

    SanPham create(SanPham sanPham);

    SanPham update(SanPham sanPham);

    void delete(Integer id);

    SanPham udpateTT(Integer id,Integer trangthai);

    Integer getSoLuongSp();
}
