package com.poly.dao.daoPhu;

import com.poly.entity.MaGiamGia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface MaGiamGiaDAO extends JpaRepository<MaGiamGia, Integer> {
@Query("SELECT a from MaGiamGia a where a.ma=?1")
    MaGiamGia findMaGiamGiaByMa(String ma);
}
