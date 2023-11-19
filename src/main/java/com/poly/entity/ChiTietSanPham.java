package com.poly.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@SuppressWarnings("serial")
@Entity
@Data
@NoArgsConstructor
public class ChiTietSanPham implements Serializable {
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

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "MaSanPham", referencedColumnName = "Ma")
    private SanPham sanPham;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaLoaiKH", referencedColumnName = "Ma")
    @JsonIgnoreProperties("ctsplkh")
    private LoaiKhachHang loaiKhachHang;


    @ManyToOne
    @JsonBackReference
    @JoinColumn(name = "MaThuongHieu", referencedColumnName = "ma")
    private ThuongHieu thuongHieu;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaMau", referencedColumnName = "Ma")
    @JsonIgnoreProperties("lMauSac")
    private MauSac mauSac;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaKichCo", referencedColumnName = "Ma")
    @JsonIgnoreProperties("LkichCo")
    private KichCo kichCo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaChatLieu", referencedColumnName = "Ma")
    @JsonIgnoreProperties("Lchatlieu")
    private ChatLieu chatLieu;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaCoAo", referencedColumnName = "Ma")
    @JsonIgnoreProperties("LCoAo")
    private CoAo coAo;


}

