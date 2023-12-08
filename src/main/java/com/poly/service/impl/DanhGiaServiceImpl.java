package com.poly.service.impl;

import com.poly.dao.AccountDAO;
import com.poly.dao.DanhGiaDAO;
import com.poly.dao.SanPhamDAO;
import com.poly.entity.Account;
import com.poly.entity.DanhGia;
import com.poly.entity.SanPham;
import com.poly.service.DanhGiaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@Service
public class DanhGiaServiceImpl implements DanhGiaService {
    @Autowired
    DanhGiaDAO danhGiaDAO;
    @Autowired
    SanPhamDAO sanPhamDAO;
    @Autowired
    AccountDAO accountDAO;


    @Override
    public List<DanhGia> getDanhGiaByMaSp(String masp) {
        return danhGiaDAO.getDanhGiaByMaSP(masp);
    }

    @Override
    public Boolean findByUserAndProduct(String ma, String username) {
        List<DanhGia> danhGiaList = danhGiaDAO.getDanhGiaByUser(ma, username);

        // Kiểm tra xem danhGiaList có đánh giá từ user cụ thể cho sản phẩm không
        return danhGiaList != null && !danhGiaList.isEmpty();
    }


    @Override
    public DanhGia create(DanhGia danhGia, String user, String maSp) {
        SanPham existingSp = sanPhamDAO.findSanPhamByMa(maSp);
        Account existingAccount = accountDAO.findByUsername(user);
        danhGia.setSanPham(existingSp);
        danhGia.setAccount(existingAccount);
        return danhGiaDAO.save(danhGia);
    }

    @Override
    public DanhGia udpate(DanhGia danhGia) {
        return danhGiaDAO.save(danhGia);
    }
}
