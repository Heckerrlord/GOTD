package com.poly.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Data
@NoArgsConstructor

public class Anh implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column (unique = true)
    private String ma;

    @ManyToOne
    @JoinColumn(name = "MaSP")
    private SanPham sanPham;

    private int trangThai;
}
