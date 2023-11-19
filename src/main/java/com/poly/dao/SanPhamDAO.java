package com.poly.dao;

import com.poly.entity.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface SanPhamDAO extends JpaRepository<SanPham,Integer> {
    @Query("SELECT  a FROM SanPham a where a.ma=:ma")
    SanPham findSanPhamByMa(String ma);
}
