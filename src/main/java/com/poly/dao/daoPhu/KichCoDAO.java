package com.poly.dao.daoPhu;

import com.poly.entity.KichCo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface KichCoDAO extends JpaRepository<KichCo, Integer> {
    @Query("SELECT DISTINCT m FROM KichCo m JOIN m.LkichCo c WHERE c.sanPham.ma = :maSanPham")
    List<KichCo> findKichCoByMaSanPham(@Param("maSanPham") String maSanPham);


        @Query("SELECT kc FROM KichCo kc " +
                "JOIN ChiTietSanPham ctsp ON kc.code = ctsp.kichCo.code " +
                "JOIN MauSac ms ON ctsp.mauSac.code = ms.code " +
                "WHERE ctsp.sanPham.ma = :maSanPham AND ms.code = :maMau")
        List<KichCo> findKichCoByMaSanPhamAndMaMau(String maSanPham, String maMau);


}
