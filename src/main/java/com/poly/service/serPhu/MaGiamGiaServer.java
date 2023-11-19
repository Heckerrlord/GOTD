package com.poly.service.serPhu;

import com.poly.entity.MaGiamGia;

import java.util.List;

public interface MaGiamGiaServer {
    List<MaGiamGia> findAll();

    MaGiamGia findById(Integer id);

    MaGiamGia create(MaGiamGia maGiamGia);

    MaGiamGia update(MaGiamGia maGiamGia);

    void delete(Integer id);
}
