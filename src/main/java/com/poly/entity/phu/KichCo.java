package com.poly.entity.phu;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "KichCo")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class KichCo implements Serializable {
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

}
