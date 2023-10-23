package com.poly.dao;

import com.poly.entity.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SanPhamDAO extends JpaRepository<SanPham,Integer> {
}
