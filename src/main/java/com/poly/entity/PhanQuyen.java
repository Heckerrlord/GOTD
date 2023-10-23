package com.poly.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class PhanQuyen {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "ma_vai_tro")
    private VaiTro vaiTro;

    @ManyToOne
    @JoinColumn(name = "ten_dang_nhap")
    private TaiKhoan taiKhoan;
}

