package com.poly.service;


import com.fasterxml.jackson.databind.JsonNode;
import com.poly.entity.DonHang;
import com.poly.entity.GioHang;

import java.util.List;

public interface GioHangService {

    GioHang create(GioHang gioHang);

    GioHang update(Long id,GioHang gioHang);

    GioHang findById(Long id);

    GioHang findByUsername(String username);

    GioHang findByUsernameAndTrangThai (String username,Integer tt);

    void delete(Long id);
}
