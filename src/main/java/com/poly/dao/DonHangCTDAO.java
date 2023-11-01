package com.poly.dao;



import com.poly.entity.DonHangChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface DonHangCTDAO extends JpaRepository<DonHangChiTiet, Long> {
    @Query("SELECT d FROM DonHangChiTiet d WHERE d.donHang.id = :idDonHang AND d.chiTietSanPham.id = :idChiTietSanPham AND d.trangThai = :trangThai")
    List<DonHangChiTiet> findByIdDonHangAndIdChiTietSanPhamAndTrangThai(
             Long idDonHang,
             Long idChiTietSanPham,
             Integer trangThai
    );
}
