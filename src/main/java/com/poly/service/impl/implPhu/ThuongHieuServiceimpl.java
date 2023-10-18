package com.poly.service.impl.implPhu;


import com.poly.dao.daoPhu.ThuongHieuDao;
import com.poly.entity.phu.ThuongHieu;
import com.poly.service.serPhu.ThuongHieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ThuongHieuServiceimpl implements ThuongHieuService {
    @Autowired
    private ThuongHieuDao thuongHieuDao;

    @Override
    public List<ThuongHieu> findAll() {
        return thuongHieuDao.findAll();
    }

    @Override
    public ThuongHieu findById(Integer id) {
        return thuongHieuDao.findById(id).get();
    }

    @Override
    public ThuongHieu create(ThuongHieu thuongHieu) {
        return thuongHieuDao.save(thuongHieu);
    }

    @Override
    public ThuongHieu update(ThuongHieu thuongHieu) {
        return thuongHieuDao.save(thuongHieu);
    }

    @Override
    public void delete(Integer id) {
        thuongHieuDao.deleteById(id);
    }
}
