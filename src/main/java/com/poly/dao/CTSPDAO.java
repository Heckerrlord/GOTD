package com.poly.dao;

import com.poly.entity.ChiTietSanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CTSPDAO extends JpaRepository<ChiTietSanPham, Long> {
    @Query("SELECT c FROM ChiTietSanPham c WHERE c.id IN (SELECT MAX(c2.id) FROM ChiTietSanPham c2 GROUP BY c2.sanPham.ma)")
    List<ChiTietSanPham> findDistinctByMasp();
    List<ChiTietSanPham> findChiTietSanPhamBySanPhamMa(String ma);
}
