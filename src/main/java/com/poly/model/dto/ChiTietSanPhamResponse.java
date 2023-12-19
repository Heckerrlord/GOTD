package com.poly.model.dto;

import org.springframework.beans.factory.annotation.Value;

import java.math.BigDecimal;

public interface ChiTietSanPhamResponse {
    @Value("#{target.ma}")
    String getMa();

    @Value("#{target.ten}")
    String getTen();

    @Value("#{target.anh_ma}")
    String getAnh();

    @Value("#{target.gia_ban}")
    BigDecimal getGia();

    @Value("#{target.total_so_luong}")
    Long getTongSoLuong();

    @Value("#{target.row_number}")
    Long getRowNumber();
}
