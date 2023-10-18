package com.poly.service.impl.implPhu;

import com.poly.dao.daoPhu.LoaiKhachHangDao;
import com.poly.dao.daoPhu.MauSacDAO;
import com.poly.entity.phu.LoaiKhachHang;
import com.poly.entity.phu.MauSac;
import com.poly.service.serPhu.LoaiKhachHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoaiKhachHangServiceimpl implements LoaiKhachHangService {
    @Autowired
    private LoaiKhachHangDao loaiKhachHangDao;

    @Override
    public List<LoaiKhachHang> findAll() {
        return loaiKhachHangDao.findAll();
    }

    @Override
    public LoaiKhachHang findById(Integer id) {
        return loaiKhachHangDao.findById(id).get();
    }

    @Override
    public LoaiKhachHang create(LoaiKhachHang loaiKhachHang) {
        return loaiKhachHangDao.save(loaiKhachHang);
    }

    @Override
    public LoaiKhachHang update(LoaiKhachHang loaiKhachHang) {
        return loaiKhachHangDao.save(loaiKhachHang);
    }

    @Override
    public void delete(Integer id) {
        loaiKhachHangDao.deleteById(id);
    }
}
