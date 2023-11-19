package com.poly.service.serPhu;


import com.poly.entity.KichCo;

import java.util.List;

public interface KichCoService {
    List<KichCo> findAll();

    KichCo findById(Integer id);

    KichCo create(KichCo kichCo);

    KichCo update(KichCo kichCo);

    void delete(Integer id);
}
