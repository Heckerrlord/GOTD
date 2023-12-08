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


    @JsonIgnore
    @OneToMany(mappedBy = "sanPham")
    private List<DanhGia> danhGias;
}