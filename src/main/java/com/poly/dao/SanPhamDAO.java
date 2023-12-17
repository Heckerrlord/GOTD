package com.poly.dao;

import com.poly.entity.SanPham;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Optional;

public interface SanPhamDAO extends JpaRepository<SanPham,Integer> {
    @Query("SELECT  a FROM SanPham a where a.ma=:ma")
    SanPham findSanPhamByMa(String ma);

    @Query("SELECT  a FROM SanPham a where a.ma=:ma")
    Optional<SanPham> findMaUpdate(String ma);

    @Query(value = "SELECT COUNT(*) FROM SanPham WHERE TrangThai = 0",nativeQuery = true)
    Integer getSoLuongSP();

    @Query("SELECT p.id FROM DonHang p WHERE p.ngayDatHang >= :startDate")
    List<Long> getShoppingWithinLast7Days(LocalDateTime startDate);

    @Query("SELECT p FROM SanPham p WHERE p.id IN :productIds ORDER BY p.id DESC")
    List<SanPham> getTrending(@Param("productIds") List<Integer> productIds, Pageable pageable);


    List<SanPham> findByThuongHieuCode(String maThuongHieu);
}
