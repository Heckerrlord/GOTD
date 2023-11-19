package com.poly.service.impl.implPhu;

import com.poly.dao.daoPhu.MaGiamGiaDAO;
import com.poly.entity.MaGiamGia;
import com.poly.service.serPhu.MaGiamGiaServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MaGiamGiaServiceImpl implements MaGiamGiaServer {
    @Autowired
    private MaGiamGiaDAO maGiamGiaDAO;

    @Override
    public List<MaGiamGia> findAll() {
        return maGiamGiaDAO.findAll();
    }

    @Override
    public MaGiamGia findById(Integer id) {
        return maGiamGiaDAO.findById(id).get();
    }

    @Override
    public MaGiamGia create(MaGiamGia maGiamGia) {
        return maGiamGiaDAO.save(maGiamGia);
    }

    @Override
    public MaGiamGia update(MaGiamGia maGiamGia) {
        return maGiamGiaDAO.save(maGiamGia);
    }

    @Override
    public void delete(Integer id) {
        maGiamGiaDAO.deleteById(id);
    }
}
