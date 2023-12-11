package com.poly.dao;

import com.poly.entity.DanhSachYeuThich;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.List;

public interface DSYTDAO extends JpaRepository<DanhSachYeuThich,Integer> {


    @Modifying
    @Query(value = "DELETE FROM DanhSachYeuThich WHERE MaSanPham = :ma AND MaKhachHang = :username", nativeQuery = true)
    @Transactional
    void delete(@Param("ma") String ma, @Param("username") String username);

    @Query(value = "SELECT c FROM  DanhSachYeuThich c WHERE c.accounts=:username and  c.sanPham=:ma" )
    List<DanhSachYeuThich> getFavorite (String username,String ma);



}
