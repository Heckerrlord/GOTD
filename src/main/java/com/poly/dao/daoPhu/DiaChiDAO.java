package com.poly.dao.daoPhu;

import com.poly.entity.DiaChi;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface DiaChiDAO extends JpaRepository<DiaChi, Integer> {

    @Query(value = "SELECT * FROM DiaChi WHERE MaTaiKhoan =:username",nativeQuery = true)
    List<DiaChi> getDiaChiByUsername(String username);
}
