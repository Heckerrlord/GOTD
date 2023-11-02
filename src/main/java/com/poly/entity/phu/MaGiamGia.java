package com.poly.entity.phu;

import lombok.*;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "MaGiamGia")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class MaGiamGia {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "Ten")
    private String ten;

    @Column(name = "Ma")
    private String ma;

    @Column(name = "SuKien")
    private String sk;

    @Column(name = "HinhThucGiam")
    private Integer htg;

    @Temporal(TemporalType.DATE)
    @Column(name = "NgayBatDau")
    private Date ngayBatDau = new Date();

    @Temporal(TemporalType.DATE)
    @Column(name = "NgayKetThuc")
    private Date ngayKetThuc = new Date();

    @Column(name = "GiamToiThieu")
    private BigDecimal gtt;

    @Column(name = "GiamToiDa")
    private BigDecimal gtd;

    @Column(name = "SoLuong")
    private Integer sl;

    @Column(name = "TrangThai")
    private Integer tt;

}
