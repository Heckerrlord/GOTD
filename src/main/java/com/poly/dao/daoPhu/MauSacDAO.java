package com.poly.dao.daoPhu;

import com.poly.entity.MauSac;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MauSacDAO extends JpaRepository<MauSac, Integer> {

    @Query("SELECT DISTINCT m FROM MauSac m JOIN m.lMauSac c WHERE c.sanPham.ma = :maSanPham")
    List<MauSac> findMauSacByMaSanPham(@Param("maSanPham") String maSanPham);


    @Query("SELECT ms FROM MauSac ms " +
            "JOIN ChiTietSanPham ctsp ON ms.code = ctsp.mauSac.code " +
            "JOIN KichCo kc ON ctsp.kichCo.code = kc.code " +
            "WHERE ctsp.sanPham.ma = :maSanPham AND kc.code = :maKichCo")
    List<MauSac> findMauSacByMaSanPhamAndMaKichCo(String maSanPham, String maKichCo);
}
