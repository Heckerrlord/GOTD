package com.poly.service.impl.implPhu;

import com.poly.dao.daoPhu.DiaChiDAO;
import com.poly.entity.phu.DiaChi;
import com.poly.service.serPhu.DiaChiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DiaChiServiceImpl implements DiaChiService {
    @Autowired
    private DiaChiDAO diaChiDAO;

    @Override
    public List<DiaChi> findAll() {
        return diaChiDAO.findAll();
    }

    @Override
    public List<DiaChi> getDiaChiByUsername(String username) {
        return (List<DiaChi>) diaChiDAO.getDiaChiByUsername(username);
    }

    @Override
    public DiaChi findById(Integer id) {
        return diaChiDAO.findById(id).get();
    }

    @Override
    public DiaChi create(DiaChi diaChi) {
        return diaChiDAO.save(diaChi);
    }

    @Override
    public DiaChi update(DiaChi diaChi) {
        return diaChiDAO.save(diaChi);
    }

    @Override
    public void delete(Integer id) {
        diaChiDAO.deleteById(id);
    }
}
