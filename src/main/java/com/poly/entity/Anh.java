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
    private String ma;
    @ManyToOne
    @JoinColumn(name = "MaSP",referencedColumnName = "Ma")
    private SanPham sanPham;
    private int trangThai;
}