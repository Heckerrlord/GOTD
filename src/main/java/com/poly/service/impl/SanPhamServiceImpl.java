package com.poly.service.impl;

import com.poly.dao.AnhDAO;
import com.poly.dao.CTSPDAO;
import com.poly.dao.SanPhamDAO;
import com.poly.dao.daoPhu.KichCoDAO;
import com.poly.dao.daoPhu.MauSacDAO;
import com.poly.dao.daoPhu.ThuongHieuDAO;
import com.poly.entity.*;
import com.poly.service.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class SanPhamServiceImpl implements SanPhamService {
    @Autowired
    SanPhamDAO pdao;
    @Autowired
    CTSPDAO ctspdao;
    @Autowired
    AnhDAO anhDAO;
    @Autowired
    ThuongHieuDAO thuongHieuDAO;
    @Autowired
    KichCoDAO kichCoDAO;
    @Autowired
    MauSacDAO mauSacDAO;


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
        // Thiết lập ngày tạo mới
        sanPham.setNgayTao(new Date());

        // Lưu thông tin cơ bản của sản phẩm
        SanPham savedSanPham = pdao.save(sanPham);
        // Lưu danh sách chi tiết sản phẩm
        if (sanPham.getChiTietSanPhams() != null && !sanPham.getChiTietSanPhams().isEmpty()) {
            for (ChiTietSanPham chiTiet : sanPham.getChiTietSanPhams()) {
                chiTiet.setSanPham(savedSanPham);
                ctspdao.save(chiTiet);
            }
        }
        // Lưu danh sách ảnh
        if (sanPham.getImage() != null && !sanPham.getImage().isEmpty()) {
            for (Anh anh : sanPham.getImage()) {
                anh.setSanPham(savedSanPham);
                anhDAO.save(anh);
            }
        }

        return savedSanPham;
    }


    @Override
    public SanPham update(SanPham updatedSanPham) {
        // Kiểm tra xem sản phẩm có tồn tại không
        Optional<SanPham> existingSanPham = pdao.findMaUpdate(updatedSanPham.getMa());
        if (existingSanPham.isPresent()) {
            SanPham currentSanPham = existingSanPham.get();
            currentSanPham.setTen(updatedSanPham.getTen());
            currentSanPham.setMoTa(updatedSanPham.getMoTa());
            SanPham savedSanPham = pdao.save(currentSanPham);

            // Cập nhật danh sách chi tiết sản phẩm
            for (ChiTietSanPham chiTiet : updatedSanPham.getChiTietSanPhams()) {
                Optional<ChiTietSanPham> existingChiTiet = ctspdao.findExistingChiTiet(
                        chiTiet.getMauSac().getCode(), chiTiet.getKichCo().getCode(), savedSanPham.getMa());

                if (existingChiTiet.isPresent()) {
                    ChiTietSanPham currentChiTiet = existingChiTiet.get();

                    // Cập nhật thông tin của chi tiết sản phẩm
                    currentChiTiet.setSoLuong(chiTiet.getSoLuong());
                    currentChiTiet.setGiaNhap(chiTiet.getGiaNhap());
                    currentChiTiet.setGiaBan(chiTiet.getGiaBan());
                    // ... Cập nhật các trường khác nếu cần
                    ctspdao.save(currentChiTiet);
                } else {
                    // Nếu chưa tồn tại, thì thêm mới
                    chiTiet.setSanPham(savedSanPham);
                    ctspdao.save(chiTiet);
                }
            }

            // Cập nhật danh sách ảnh
            if (updatedSanPham.getImage() != null && !updatedSanPham.getImage().isEmpty()) {
                for (Anh anh : updatedSanPham.getImage()) {
                    anh.setSanPham(savedSanPham);
                    anhDAO.save(anh);
                }
            }
            return savedSanPham;
        } else {
            // Trả về null hoặc thực hiện xử lý phù hợp với trường hợp sản phẩm không tồn tại
            return null;
        }
    }



    @Override
    public void delete(Integer id) {
        pdao.deleteById(id);
    }

    @Override
    public Integer getSoLuongSp() {
        return pdao.getSoLuongSP();
    }
}
