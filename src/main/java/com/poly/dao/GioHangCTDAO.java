package com.poly.dao;



import com.poly.entity.DonHangChiTiet;
import com.poly.entity.GioHang;
import com.poly.entity.GioHangChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface GioHangCTDAO extends JpaRepository<GioHangChiTiet, Long> {
    @Query("SELECT d FROM GioHangChiTiet d WHERE d.gioHang.id = :idGioHang AND d.trangThai = :trangThai")
    List<GioHangChiTiet> findByIdGioHangAndTrangThai(
             Long idGioHang,
             Integer trangThai
    );

    GioHangChiTiet findByChiTietSanPhamIdAndGioHangIdAndTrangThai(Long idSP,Long idGH, int trangthai);

    void deleteAllByGioHang(GioHang gioHang);

    List<GioHangChiTiet> findByGioHang(GioHang gioHang);
}
