package com.poly.entity.phu;

import com.poly.entity.ChiTietSanPham;
import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Data
@Entity
@Table(name = "ThuongHieu")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ThuongHieu implements Serializable {
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

    @OneToMany(mappedBy = "thuongHieu")
    private List<ChiTietSanPham> lThuongHieu;
}
