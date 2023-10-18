package com.poly.service.serPhu;

import com.poly.entity.phu.MauSac;

import java.util.List;

public interface MauSacService {
    List<MauSac> findAll();

    MauSac findById(Integer id);

    MauSac create(MauSac mauSac);

    MauSac update(MauSac mauSac);

    void delete(Integer id);
}
