package com.poly.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SanPham implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String ma;

    private String ten;

    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayTao;

    @Lob
    private String moTa;

    private int trangThai;

    @OneToMany(mappedBy = "sanPham")
    private List<Anh> image;

    @OneToMany(mappedBy = "sanPham")
    private List<ChiTietSanPham> ctsp;

    @ManyToOne(fetch = FetchType.LAZY)
    @JsonIgnoreProperties("Lthuonghieu")
    @JoinColumn(name = "MaThuongHieu", referencedColumnName = "ma")
    private ThuongHieu thuongHieu;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaChatLieu", referencedColumnName = "Ma")
    @JsonIgnoreProperties("Lchatlieu")
    private ChatLieu chatLieu;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaCoAo", referencedColumnName = "Ma")
    @JsonIgnoreProperties("LCoAo")
    private CoAo coAo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaLoaiAo", referencedColumnName = "Ma")
    @JsonIgnoreProperties("ctsplkh")
    private LoaiKhachHang loaiKhachHang;
    @OneToMany(mappedBy = "sanPham")
    private List<ChiTietSanPham> ctsp;

    @ManyToOne
    @JsonBackReference
    @JoinColumn(name = "MaThuongHieu", referencedColumnName = "ma")
    private ThuongHieu thuongHieu;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaChatLieu", referencedColumnName = "Ma")
    @JsonIgnoreProperties("Lchatlieu")
    private ChatLieu chatLieu;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaCoAo", referencedColumnName = "Ma")
    @JsonIgnoreProperties("LCoAo")
    private CoAo coAo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaLoaiAo", referencedColumnName = "Ma")
    @JsonIgnoreProperties("ctsplkh")
    private LoaiKhachHang loaiKhachHang;

    @JsonIgnore
    @OneToMany(mappedBy = "sanPham")
    private List<DanhGia> danhGias;
}