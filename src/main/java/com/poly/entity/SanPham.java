package com.poly.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
public class SanPham implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(unique = true)
    private String ma;

    private String ten;

    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayTao;

    @Lob
    private String moTa;

    private int trangThai;

    @OneToMany(mappedBy = "sanPham")
    private List<Anh> image;

//    @OneToMany(mappedBy = "sanPham")
//    private List<ChiTietSanPham> chiTietSanPhamList;
}