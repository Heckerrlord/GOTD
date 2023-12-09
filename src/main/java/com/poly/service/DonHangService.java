package com.poly.service;


import com.fasterxml.jackson.databind.JsonNode;
import com.poly.entity.DonHang;
import com.poly.entity.SanPham;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDateTime;
import java.util.List;

public interface DonHangService {

    DonHang create(DonHang donHang);

    DonHang findById(Long id);

    List<DonHang> findByUsername(String username);

    List<Object[]> getDoanhThuThang(int year);
    List<Integer> getYear();
    Double getDoamhThuNam(int year);
    Double thongKeDoanhThu7NgayGanNhat(LocalDateTime sevenDaysAgo, LocalDateTime currentDate);
    Double thongKeThangHienTai();
    Integer getSoLuongDon();
    List<Object[]> thongkeNgay();
    List<Object[]> thongKeSanPhamTuan();

}
