package com.poly.service.serPhu;

import com.poly.entity.CoAo;

import java.util.List;

public interface CoAoService {
    List<CoAo> findAll();

    CoAo findById(Integer id);

    CoAo create(CoAo coAo);

    CoAo update(CoAo coAo);

    void delete(Integer id);
}
