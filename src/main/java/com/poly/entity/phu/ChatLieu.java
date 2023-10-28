package com.poly.entity.phu;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Data
@Entity
@Table(name = "ChatLieu")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ChatLieu implements Serializable {
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

//    @OneToMany(mappedBy = "chatLieu")
//    private List<ChiTietSanPham> chiTietSanPhams;

}
