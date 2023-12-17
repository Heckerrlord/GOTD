package com.poly.model.dto;

import lombok.*;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@Builder
public class ChiTietSanPhamDTO {

    private String ma;

    private String ten;

    private String anh;

    private long tongSoLuong;

    public ChiTietSanPhamDTO(String ma, String ten,String anh, long tongSoLuong) {
        this.ma = ma;
        this.ten = ten;
        this.anh = anh;
        this.tongSoLuong = tongSoLuong;
    }
}
