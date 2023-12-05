package com.poly.model.dto;

import lombok.*;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChiTietSanPhamDTO {
    private Long id;

    private String sanPham;

    private String thuongHieu;

    private String mauSac;

    private String kichCo;

    private BigDecimal GiaBan;
}
