package com.poly.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.poly.entity.Anh;
import com.poly.entity.ChiTietSanPham;
import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Data
@Entity
@Table(name = "MauSac")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class MauSac implements Serializable {
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

    @OneToMany(mappedBy = "mauSac", fetch = FetchType.LAZY)
    @JsonIgnore
    private List<ChiTietSanPham> lMauSac;
}
