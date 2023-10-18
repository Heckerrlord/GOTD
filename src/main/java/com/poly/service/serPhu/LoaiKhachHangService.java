package com.poly.service.serPhu;


import com.poly.entity.phu.LoaiKhachHang;

import java.util.List;

public interface LoaiKhachHangService {
    List<LoaiKhachHang> findAll();

    LoaiKhachHang findById(Integer id);

    LoaiKhachHang create(LoaiKhachHang loaiKhachHang);

    LoaiKhachHang update(LoaiKhachHang loaiKhachHang);

    void delete(Integer id);
}
