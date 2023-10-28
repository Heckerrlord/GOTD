package com.poly.service.impl;

import com.poly.dao.SanPhamDAO;
import com.poly.entity.SanPham;
import com.poly.service.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SanPhamServiceImpl implements SanPhamService {
    @Autowired
    SanPhamDAO pdao;


    @Override
    public List<SanPham> findAll() {
        return pdao.findAll();
    }

    @Override
    public SanPham findById(Integer id) {
        return pdao.findById(id).get();
    }

    @Override
    public SanPham create(SanPham sanPham) {
        return pdao.save(sanPham);
    }

    @Override
    public SanPham update(SanPham sanPham) {
        return pdao.save(sanPham);
    }

    @Override
    public void delete(Integer id) {
        pdao.deleteById(id);
    }
}
