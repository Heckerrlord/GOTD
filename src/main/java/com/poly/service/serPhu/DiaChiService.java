package com.poly.service.serPhu;


import com.poly.entity.DiaChi;

import java.util.List;

public interface DiaChiService {
    List<DiaChi> findAll();

    List<DiaChi> getDiaChiByUsername(String username);

    DiaChi findById(Integer id);

    DiaChi create(DiaChi diaChi);

    DiaChi update(DiaChi diaChi);

    void delete(Integer id);
}
