package com.poly.service;

import com.poly.entity.DonHangChiTiet;
import com.poly.entity.GioHangChiTiet;

public interface DonHangCTService {

    DonHangChiTiet create(DonHangChiTiet gioHangChiTiet);

    void delete(Long id);
}
