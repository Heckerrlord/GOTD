package com.poly.dao;


import com.poly.entity.DonHang;
import com.poly.entity.GioHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface GioHangDAO extends JpaRepository<GioHang, Long> {
    @Query("SELECT o FROM GioHang o WHERE o.account.username=?1")
    GioHang findByUsername(String username);
    @Query("SELECT o FROM GioHang o WHERE o.account.username=?1 and o.trangThai=?2")
    GioHang findByUsernameAndTrangThai (String username,Integer tt);
}
