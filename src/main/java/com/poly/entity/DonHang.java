package com.poly.entity;
import lombok.Data;
import lombok.Getter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Data
@Getter
@Table(name = "DonHang")
public class DonHang {
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

    @Column(name = "DCChiTiet")
    private String dcChiTiet;

    @Column(name = "NgayDatHang")
    private LocalDateTime ngayDatHang;

    @Column(name = "TienGiam")
    private BigDecimal tienGiam;

    @Column(name = "PhiGiaoHang")
    private BigDecimal phiGiaoHang;


    @Column(name = "TongTien")
    private BigDecimal tongTien;

    @Column(name = "TrangThai")
    private Integer trangThai;

    @OneToMany(mappedBy = "donHang")
    private List<DonHangChiTiet> chiTietDonHangList;

    // Constructors, getters, and setters
}
