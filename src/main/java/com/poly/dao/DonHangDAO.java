package com.poly.dao;


import com.poly.entity.DonHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

public interface DonHangDAO extends JpaRepository<DonHang, Long> {
    @Query("SELECT o FROM DonHang o WHERE o.account.username=?1")
    List<DonHang> findByUsername(String username);
    @Query("SELECT o FROM DonHang o WHERE o.account.username=?1 and o.trangThai=?2")
    List<DonHang> findByUsernameAndTrangThai (String username,Integer tt);
    List<DonHang> findAllByTrangThai(int trangThai);

    @Query(value = "SELECT COUNT(*) FROM DonHang WHERE TrangThai = 0", nativeQuery = true)
    Integer getSoLuongDon();

    /*thống kê doanh thu*/

    @Query(value = "SELECT SUM(TongTien) AS DoanhThu, MONTH(NgayDatHang) AS Thang FROM DonHang WHERE YEAR(NgayDatHang) = ?1 AND TrangThai = 4 GROUP BY MONTH(NgayDatHang)", nativeQuery = true)
    List<Object[]> getDoanhThuThang(int year);


    @Query(value = "SELECT YEAR (NgayDatHang) From DonHang GROUP BY  YEAR(NgayDatHang)", nativeQuery = true)
    List<Integer> getYear();

    @Query(value = " SELECT SUM(TongTien) From DonHang WHERE YEAR(NgayDatHang) = ? AND TrangThai = 4", nativeQuery = true)
    Double getDoamhThuNam(int year);

    @Query(value = "SELECT SUM(TongTien) FROM DonHang WHERE NgayDatHang BETWEEN :sevenDaysAgo AND :currentDate AND TrangThai = 4 ", nativeQuery = true)
    Double thongKeDoanhThu7NgayGanNhat(Timestamp sevenDaysAgo, Timestamp currentDate);

    @Query(value = "SELECT SUM(TongTien) AS doanhThuThang FROM DonHang WHERE YEAR(NgayDatHang) = YEAR(GETDATE())AND MONTH(NgayDatHang) = MONTH(GETDATE()) AND TrangThai = 4", nativeQuery = true)
    Double thongKeThangHienTai();

    @Query(value = "SELECT NgayDatHang AS Ngay,SUM(TongTien) AS DoanhThu FROM DonHang WHERE TrangThai = 4 GROUP BY NgayDatHang ORDER BY  NgayDatHang", nativeQuery = true)
    List<Object[]> thongkeNgay();


}
