package com.poly.entity;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Data;
import lombok.Getter;
import net.minidev.json.annotate.JsonIgnore;

import javax.persistence.*;
import javax.persistence.criteria.CriteriaBuilder;
import java.math.BigDecimal;
import java.sql.Date;
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

    @Column(name = "Tinh")
    private String tinh;

    @Column(name = "Huyen")
    private String huyen;

    @Column(name = "Xa")
    private String xa;

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

    @Column(name = "ThanhToan")
    private Integer thanhToan;

    @JsonIgnore
    @OneToMany(mappedBy = "donHang", fetch = FetchType.LAZY)
    private List<DonHangChiTiet> chiTietDonHangList;


    public DonHang(GioHang gioHang) {
        this.maGiamGia = gioHang.getMaGiamGia();
        this.soDienThoai = gioHang.getSoDienThoai();
        this.tinh = gioHang.getTinh();
        this.huyen = gioHang.getHuyen();
        this.xa = gioHang.getXa();
        this.dcChiTiet = gioHang.getDcChiTiet();
        this.account = gioHang.getAccount();;
        this.ngayDatHang = gioHang.getNgayDatHang();
        this.tienGiam = gioHang.getTienGiam();
        this.phiGiaoHang = gioHang.getPhiGiaoHang();
        this.tongTien = gioHang.getTongTien();
        this.trangThai = gioHang.getTrangThai();
        this.thanhToan =0;
    }

    public DonHang() {
    }

    public DonHang(Long id, Account account, String maGiamGia, String soDienThoai, String dcChiTiet, String tinh, String huyen, String xa, LocalDateTime  ngayDatHang, BigDecimal tienGiam, BigDecimal phiGiaoHang, BigDecimal tongTien, Integer trangThai, Integer thanhToan, List<DonHangChiTiet> chiTietDonHangList) {
        this.id = id;
        this.account = account;
        this.maGiamGia = maGiamGia;
        this.soDienThoai = soDienThoai;
        this.dcChiTiet = dcChiTiet;
        this.tinh = tinh;
        this.huyen = huyen;
        this.xa = xa;
        this.ngayDatHang = ngayDatHang;
        this.tienGiam = tienGiam;
        this.phiGiaoHang = phiGiaoHang;
        this.tongTien = tongTien;
        this.thanhToan = thanhToan;
        this.trangThai = trangThai;
        this.chiTietDonHangList = chiTietDonHangList;

    }

    // Constructors, getters, and setters
}
