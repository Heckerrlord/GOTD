package com.poly.service;

import com.poly.entity.SanPham;
import com.poly.entity.phu.ThuongHieu;

import java.util.List;

public interface SanPhamService {
    List<SanPham> findAll();

    SanPham findById(Integer id);

    SanPham create(SanPham sanPham);

    SanPham update(SanPham sanPham);

    void delete(Integer id);
}
