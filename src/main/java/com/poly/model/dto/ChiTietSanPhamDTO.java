package com.poly.model.dto;

import lombok.*;

import java.math.BigDecimal;

@Getter
@Setter
@Builder
public class ChiTietSanPhamDTO {

    private String ma;

    private String ten;

    private String anh;

    private BigDecimal gia;

    private long tongSoLuong;

    public ChiTietSanPhamDTO() {
    }

    public ChiTietSanPhamDTO(String ma, String ten, String anh, BigDecimal gia, long tongSoLuong) {
        this.ma = ma;
        this.ten = ten;
        this.anh = anh;
        this.gia = gia;
        this.tongSoLuong = tongSoLuong;
    }
}
