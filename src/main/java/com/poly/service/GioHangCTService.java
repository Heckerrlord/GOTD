package com.poly.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.poly.entity.DonHang;
import com.poly.entity.GioHang;
import com.poly.entity.GioHangChiTiet;

import java.util.List;

public interface GioHangCTService {

    GioHangChiTiet create(GioHangChiTiet gioHangChiTiet);

    GioHangChiTiet update(GioHangChiTiet gioHangChiTiet);

    List<GioHangChiTiet> findByIdGioHangAndTrangThai(Long idGioHang,
                                                     Integer trangThai);
    void delete(Long id);

    GioHangChiTiet findByChiTietSanPhamIdAndGioHangIdAndTrangThai(Long chiTietSanPhamId, Long i, int i1);

    void deleteAllItemsInCart(GioHang gioHang);
}
