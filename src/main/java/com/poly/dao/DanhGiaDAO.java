package com.poly.dao;

import com.poly.entity.DanhGia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import java.util.List;

public interface DanhGiaDAO extends JpaRepository<DanhGia,Double> {

     @Query("SELECT a FROM DanhGia a WHERE a.sanPham.ma =:ma")
     List<DanhGia> getDanhGiaByMaSP(String ma);


     @Query("SELECT a FROM DanhGia a WHERE a.sanPham.id =:id")
     List<DanhGia> getDanhGiaByid(Integer id);
}
