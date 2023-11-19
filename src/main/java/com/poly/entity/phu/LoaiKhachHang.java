package com.poly.entity.phu;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.poly.entity.ChiTietSanPham;
import com.poly.entity.DonHangChiTiet;
import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;


@Data
@Entity
@Table(name = "LoaiKhachHang")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class LoaiKhachHang implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "Ma")
    private String code;

    @Column(name = "Ten")
    private String name;

    @Column(name = "TrangThai")
    private Integer tt;

    @OneToMany(mappedBy = "loaiKhachHang", fetch = FetchType.LAZY)
    @JsonIgnoreProperties("loaiKhachHang")
    private List<ChiTietSanPham> ctsplkh;
}
