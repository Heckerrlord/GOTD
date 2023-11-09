package com.poly.entity.phu;

import com.poly.entity.Account;
import lombok.*;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Data
@Entity
@Table(name = "DiaChi")
@AllArgsConstructor
@NoArgsConstructor
public class DiaChi {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "Ten")
    private String ten;

    @Column(name = "ThanhPho")
    private String thanhpho;

    @Column(name = "Quan")
    private String huyen;

    @Column(name = "Phuong")
    private String xa;

    @Column(name = "ChiTiet")
    private String chiTiet;

    @Column(name = "GhiChu")
    private String gc;

    @Column(name = "TrangThai")
    private Integer tt;

    @ManyToOne
    @JoinColumn(name = "MaTaiKhoan")
    private Account accounts;

}
