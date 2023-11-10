package com.poly.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Data
@Getter
@Setter
@Table(name = "DonHangChiTiet")
public class DonHangChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    @ManyToOne
    @JsonBackReference
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




}
