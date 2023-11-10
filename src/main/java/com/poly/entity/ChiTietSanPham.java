package com.poly.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.poly.entity.phu.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.fasterxml.jackson.annotation.JsonIgnore;
import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

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

    @ManyToOne
    @JoinColumn(name = "MaLoaiKH", referencedColumnName = "Ma")
    @JsonBackReference("spct-loaiKhachHang")
    private LoaiKhachHang loaiKhachHang;

    @ManyToOne
    @JoinColumn(name = "MaThuongHieu", referencedColumnName = "Ma")
    @JsonBackReference("spct-thuongHieu")
    private ThuongHieu thuongHieu;

    @ManyToOne
    @JoinColumn(name = "MaMau", referencedColumnName = "Ma")
    @JsonBackReference("spct-mauSac")
    private MauSac mauSac;

    @ManyToOne
    @JoinColumn(name = "MaKichCo", referencedColumnName = "Ma")
    @JsonBackReference("spct-kichCo")
    private KichCo kichCo;

    @ManyToOne
    @JoinColumn(name = "MaChatLieu", referencedColumnName = "Ma")
    @JsonBackReference("spct-chatLieu")
    private ChatLieu chatLieu;

    @ManyToOne
    @JoinColumn(name = "MaCoAo", referencedColumnName = "Ma")
    @JsonBackReference("spct-coAo")
    private CoAo coAo;


}

