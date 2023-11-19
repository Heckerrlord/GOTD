package com.poly.service.impl.implPhu;

import com.poly.dao.daoPhu.LoaiKhachHangDAO;
import com.poly.entity.LoaiKhachHang;
import com.poly.service.serPhu.LoaiKhachHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoaiKhachHangServiceImpl implements LoaiKhachHangService {
    @Autowired
    private LoaiKhachHangDAO loaiKhachHangDao;

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
