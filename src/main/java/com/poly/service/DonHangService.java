package com.poly.service;


import com.fasterxml.jackson.databind.JsonNode;
import com.poly.entity.DonHang;
import com.poly.entity.SanPham;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface DonHangService {

    DonHang create(JsonNode orderData);

    DonHang findById(Long id);

    List<DonHang> findByUsername(String username);
}
