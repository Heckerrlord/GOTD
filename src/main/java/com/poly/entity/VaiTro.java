package com.poly.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Data
public class VaiTro {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(unique = true)
    private String ma;

    private String ten;

    private int trangThai;

    @OneToMany(mappedBy = "vaiTro")
    private List<PhanQuyen> phanQuyens;
}
