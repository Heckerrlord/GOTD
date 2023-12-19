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

import javax.persistence.EntityNotFoundException;
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
        if (sanPham.getCtsp() != null && !sanPham.getCtsp().isEmpty()) {
            for (ChiTietSanPham chiTiet : sanPham.getCtsp()) {
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
            for (ChiTietSanPham chiTiet : updatedSanPham.getCtsp()) {
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
            List<Anh> currentImages = savedSanPham.getImage();

             // Kiểm tra xem người dùng đã chọn ảnh mới hay không
            if (updatedSanPham.getImage() != null && !updatedSanPham.getImage().isEmpty()) {
                // Lặp qua danh sách ảnh được cập nhật
                for (Anh updatedAnh : updatedSanPham.getImage()) {
                    // Kiểm tra xem ảnh đã tồn tại trong danh sách hiện tại hay không
                    Optional<Anh> existingAnhOptional = currentImages.stream()
                            .filter(existingAnh -> existingAnh.getMa().equals(updatedAnh.getMa()))
                            .findFirst();

                    if (existingAnhOptional.isPresent()) {
                        // Nếu ảnh đã tồn tại, cập nhật thuộc tính
                        Anh existingAnh = existingAnhOptional.get();
                        // Lưu thay đổi vào cơ sở dữ liệu
                        anhDAO.save(existingAnh);
                    } else {
                        // Nếu ảnh không tồn tại, thêm mới và liên kết với sản phẩm
                        updatedAnh.setSanPham(savedSanPham);
                        anhDAO.save(updatedAnh);
                    }
                }
                // Xóa các ảnh cũ không còn tồn tại trong danh sách ảnh được cập nhật
                currentImages.removeIf(existingAnh -> updatedSanPham.getImage().stream()
                        .noneMatch(updatedAnh -> existingAnh.getMa().equals(updatedAnh.getMa())));

                // Lưu thay đổi vào cơ sở dữ liệu
                anhDAO.deleteAll(currentImages);
            } else {
                anhDAO.deleteAll(currentImages);
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
    public SanPham udpateTT(Integer id, Integer trangthai) {
        Optional<SanPham> existingSanPhamOptional = pdao.findById(id);
        if (existingSanPhamOptional.isPresent()) {
            SanPham existingSanPham = existingSanPhamOptional.get();

            // Cập nhật trạng thái
            existingSanPham.setTrangThai(trangthai);

            // Lưu thay đổi vào cơ sở dữ liệu và trả về đối tượng đã được cập nhật
            return pdao.save(existingSanPham);
        } else {
            // Xử lý trường hợp không tìm thấy đối tượng để cập nhật
            throw new EntityNotFoundException("Không tìm thấy sản phẩm với ID: " + id);
        }
    }


    @Override
    public Integer getSoLuongSp() {
        return pdao.getSoLuongSP();
    }
}
