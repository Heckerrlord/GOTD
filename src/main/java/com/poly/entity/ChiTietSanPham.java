package com.poly.entity;

import com.poly.entity.phu.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Data
@NoArgsConstructor
public class ChiTietSanPham {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Date NgayThem;
    private Date NgaySua;
    private int SoLuong;
    private BigDecimal  GiaNhap;
    private BigDecimal  GiaBan;
    private String MoTa;
    private int Trangthai;
    // Các trường khác

    @ManyToOne
    @JoinColumn(name = "MaSanPham", referencedColumnName = "Ma", insertable = false, updatable = false)
    private SanPham sanPham;

    @ManyToOne
    @JoinColumn(name = "MaLoaiKH", referencedColumnName = "Ma")
    private LoaiKhachHang loaiKhachHang;

    @ManyToOne
    @JoinColumn(name = "MaThuongHieu", referencedColumnName = "Ma")
    private ThuongHieu thuongHieu;

    @ManyToOne
    @JoinColumn(name = "MaMau", referencedColumnName = "Ma")
    private MauSac mauSac;

    @ManyToOne
    @JoinColumn(name = "MaKichCo", referencedColumnName = "Ma")
    private KichCo kichCo;

    @ManyToOne
    @JoinColumn(name = "MaChatLieu", referencedColumnName = "Ma")
    private ChatLieu chatLieu;

    @ManyToOne
    @JoinColumn(name = "MaCoAo", referencedColumnName = "Ma")
    private CoAo coAo;
}

