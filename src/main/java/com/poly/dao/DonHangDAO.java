package com.poly.dao;


import com.poly.entity.DonHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface DonHangDAO extends JpaRepository<DonHang, Long> {
    @Query("SELECT o FROM DonHang o WHERE o.account.username=?1")
    List<DonHang> findByUsername(String username);
    @Query("SELECT o FROM DonHang o WHERE o.account.username=?1 and o.trangThai=?2")
    DonHang findByUsernameAndTrangThai (String username,Integer tt);
}
