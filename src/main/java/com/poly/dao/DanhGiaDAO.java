package com.poly.dao;

import com.poly.entity.DanhGia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import java.util.List;

public interface DanhGiaDAO extends JpaRepository<DanhGia,Integer> {

     @Query("SELECT a FROM DanhGia a WHERE a.sanPham.ma =:ma")
     List<DanhGia> getDanhGiaByMaSP(String ma);

     @Query("SELECT a FROM DanhGia a WHERE a.sanPham.ma =:ma AND a.account.username=:username")
     List<DanhGia> getDanhGiaByUser(String ma,String username);

    @Query(value = "SELECT AVG(CAST(DanhGia AS FLOAT)) AS TrungBinhDanhGia FROM  DanhGia WHERE  MaSanPham=:maSanPham", nativeQuery = true)
    Double findAverageRatingByMaSanPham(String maSanPham);




     @Query("SELECT a FROM DanhGia a WHERE a.sanPham.id =:id")
     List<DanhGia> getDanhGiaByid(Integer id);
}
