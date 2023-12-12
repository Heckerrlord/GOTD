package com.poly.service;

import com.poly.entity.DanhGia;

import java.util.List;

public interface DanhGiaService {
    List<DanhGia> getDanhGiaByMaSp(String masp);

    List<DanhGia> findByUserAndProduct(String ma,String username);

    List<DanhGia> findAll();


    void delete(Integer id);


    DanhGia create(DanhGia danhGia,String user,String maSp);

    DanhGia udpate(DanhGia danhGia);

}
