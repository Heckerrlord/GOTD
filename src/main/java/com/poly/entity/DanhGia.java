package com.poly.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

import java.io.Serializable;
import java.util.Date;


@Entity
@SuppressWarnings("serial")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "DanhGia")
public class DanhGia implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;
    @Column(name = "DanhGia")
    Double sao;
    @Column(name = "BinhLuan")
    String comment;
    @Column(name = "Ngay")
    Date ngayCmt;
    @Column(name = "TrangThai")
    Integer trangThai;

    @ManyToOne
    @JoinColumn(name = "MaKhachHang",referencedColumnName = "Username")
    private Account account;

    @ManyToOne
    @JoinColumn(name = "MaSanPham",referencedColumnName = "Ma")
    private SanPham sanPham;
}
