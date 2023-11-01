package com.poly.entity;

import lombok.Data;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Data
@Table(name = "DonHangChiTiet")
public class DonHangChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "MaDonHang", referencedColumnName = "id")
    private DonHang donHang;

    @ManyToOne
    @JoinColumn(name = "MaSanPham", referencedColumnName = "id")
    private ChiTietSanPham chiTietSanPham;

    @Column(name = "SoLuong")
    private Integer soLuong;

    @Column(name = "DonGia")
    private BigDecimal donGia;

    @Column(name = "TrangThai")
    private Integer trangThai;

    // Constructors, getters, and setters
}
