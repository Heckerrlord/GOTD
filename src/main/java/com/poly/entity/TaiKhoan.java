package com.poly.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Data
public class TaiKhoan {

    @Id
    private String tenDangNhap;

    private String hoVaTen;
    private String email;
    private String soDienThoai;

    @Temporal(TemporalType.TIMESTAMP)
    private Date ngaySinh;

    private String matKhau;
    private String anh;

    private int trangThai;

    @OneToMany(mappedBy = "taiKhoan")
    private List<PhanQuyen> phanQuyens;
}

