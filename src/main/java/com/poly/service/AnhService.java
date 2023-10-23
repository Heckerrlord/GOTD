package com.poly.service;

import com.poly.entity.Anh;
import com.poly.entity.SanPham;

import java.util.List;

public interface AnhService {
    List<Anh> findAll();

    Anh findById(Integer id);

    Anh create(Anh anh);

    Anh update(Anh anh);

    void delete(Integer id);
}
