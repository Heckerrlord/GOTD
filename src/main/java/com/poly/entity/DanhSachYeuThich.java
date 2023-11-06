package com.poly.entity;


import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import net.minidev.json.annotate.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Data
@Entity
@SuppressWarnings("serial")
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "DanhSachYeuThich")
public class DanhSachYeuThich implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;

    @Column(name = "MaSanPham")
    private String sanPham;

    @Column(name = "MaKhachHang")
    private String accounts;

    @Column(name = "Ngay")
    private Date date;

    @Column(name = "TrangThai")
    private Integer trangThai;
}
