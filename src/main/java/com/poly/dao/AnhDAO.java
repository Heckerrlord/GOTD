package com.poly.dao;

import com.poly.entity.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface AnhDAO extends JpaRepository<Anh, String> {
    List<Anh> findBySanPham_Ma(String maSP);

}
