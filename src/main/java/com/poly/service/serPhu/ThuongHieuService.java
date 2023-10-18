package com.poly.service.serPhu;

;

import com.poly.entity.phu.ThuongHieu;

import java.util.List;

public interface ThuongHieuService {
    List<ThuongHieu> findAll();

    ThuongHieu findById(Integer id);

    ThuongHieu create(ThuongHieu thuongHieu);

    ThuongHieu update(ThuongHieu thuongHieu);

    void delete(Integer id);
}
