package com.poly.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;
import java.math.BigDecimal;

    @Entity
    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    @Table(name = "GioHangChiTiet")
    public class GioHangChiTiet {
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;

        @ManyToOne(fetch = FetchType.EAGER)
        @JoinColumn(name = "MaGioHang", referencedColumnName = "id")
        private GioHang gioHang;

        @ManyToOne
        @JoinColumn(name = "MaSanPham", referencedColumnName = "id")
        private ChiTietSanPham chiTietSanPham;

        @Column(name = "SoLuong")
        private Integer soLuong;

        @Column(name = "DonGia")
        private BigDecimal donGia;

        @Column(name = "TrangThai")
        private Integer trangThai;


        public GioHangChiTiet( GioHang gioHang, ChiTietSanPham chiTietSanPham, Integer soLuong, BigDecimal donGia, Integer trangThai) {
            this.gioHang = gioHang;
            this.chiTietSanPham = chiTietSanPham;
            this.soLuong = soLuong;
            this.donGia = donGia;
            this.trangThai = trangThai;
        }
    }
