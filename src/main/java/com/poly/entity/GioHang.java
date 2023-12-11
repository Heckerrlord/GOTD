package com.poly.entity;
import lombok.Data;
import lombok.Getter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Data
@Getter
@Table(name = "GioHang")
public class GioHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "MaKhachHang", referencedColumnName = "username")
    private Account account;

    @Column(name = "MaGiamGia")
    private String maGiamGia;

    @Column(name = "SoDienThoai")
    private String soDienThoai;

    @Column(name = "Tinh")
    private String tinh;

    @Column(name = "Huyen")
    private String huyen;

    @Column(name = "Xa")
    private String xa;

    @Column(name = "DCChiTiet")
    private String dcChiTiet;

    @Column(name = "NgayDatHang")
    private LocalDateTime  ngayDatHang;

    @Column(name = "TienGiam")
    private BigDecimal tienGiam;

    @Column(name = "PhiGiaoHang")
    private BigDecimal phiGiaoHang;

    @Column(name = "TongTien")
    private BigDecimal tongTien;

    @Column(name = "TrangThai")
    private Integer trangThai;



    // Constructors, getters, and setters
}
