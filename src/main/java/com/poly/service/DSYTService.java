package com.poly.service;

import com.poly.entity.DanhSachYeuThich;

import java.util.List;

public interface DSYTService {
    List<DanhSachYeuThich> findAll();
    DanhSachYeuThich create(DanhSachYeuThich danhSachYeuThich);

    void delete(String ma, String username);
}
