package com.poly.service.impl;

import com.poly.dao.AnhDAO;
import com.poly.entity.Anh;
import com.poly.service.AnhService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AnhServiceImpl implements AnhService {

    @Autowired
    AnhDAO adao;

    @Override
    public List<Anh> findAll() {
        return adao.findAll();
    }

    @Override
    public Anh findById(Integer id) {
        return adao.findById(id).get();
    }

    @Override
    public Anh create(Anh anh) {
        return adao.save(anh);
    }

    @Override
    public Anh update(Anh anh) {
        return adao.save(anh);
    }

    @Override
    public void delete(Integer id) {
        adao.deleteById(id);
    }
}
