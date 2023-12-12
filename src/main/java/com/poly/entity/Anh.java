package com.poly.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
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
    @Column(name = "id")
    private Integer id;

    private String ma;
    @ManyToOne
    @JoinColumn(name = "MaSP",referencedColumnName = "Ma")
    @JsonIgnore
    private SanPham sanPham;
    private int trangThai;
}