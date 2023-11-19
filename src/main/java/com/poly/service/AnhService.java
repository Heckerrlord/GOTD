package com.poly.service;

import com.poly.entity.Anh;


import java.util.List;

public interface AnhService {
    List<Anh> findAll();

    Anh create(Anh anh);

    List<Anh> findByMaSP(String sp);

    Anh update(Anh anh);


}
