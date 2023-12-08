package com.poly.service;

import com.poly.entity.DanhGia;

import java.util.List;

public interface DanhGiaService {
    List<DanhGia> getDanhGiaByMaSp(String masp);

    Boolean findByUserAndProduct(String ma,String username);


    DanhGia create(DanhGia danhGia,String user,String maSp);

    DanhGia udpate(DanhGia danhGia);

}
