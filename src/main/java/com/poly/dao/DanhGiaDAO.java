package com.poly.dao;

import com.poly.entity.DanhGia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import java.util.List;

public interface DanhGiaDAO extends JpaRepository<DanhGia,Integer> {

     @Query("SELECT a FROM DanhGia a WHERE a.sanPham.ma =:ma and a.trangThai = 1")
     List<DanhGia> getDanhGiaByMaSP(String ma);

     @Query("SELECT a FROM DanhGia a WHERE a.sanPham.ma =:ma AND a.account.username=:username")
     List<DanhGia> getDanhGiaByUser(String ma,String username);

    @Query("SELECT a FROM DanhGia a WHERE a.account.username=:username")
    List<DanhGia> getDanhGiaUser(String username);

    @Query(value = "SELECT AVG(CAST(DanhGia AS FLOAT)) AS TrungBinhDanhGia FROM  DanhGia WHERE  MaSanPham=:maSanPham AND TrangThai = 1", nativeQuery = true)
    Double findAverageRatingByMaSanPham(String maSanPham);


    @Query(value = "SELECT COUNT(DanhGia) AS luotDG FROM  DanhGia WHERE  MaSanPham=:maSanPham and TrangThai=1", nativeQuery = true)
    Integer countRating(String maSanPham);


     @Query("SELECT a FROM DanhGia a WHERE a.sanPham.id =:id")
     List<DanhGia> getDanhGiaByid(Integer id);
}
