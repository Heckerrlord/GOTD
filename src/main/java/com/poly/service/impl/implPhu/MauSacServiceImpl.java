package com.poly.service.impl.implPhu;

import com.poly.dao.daoPhu.MauSacDAO;
import com.poly.entity.phu.MauSac;
import com.poly.service.serPhu.MauSacService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MauSacServiceImpl implements MauSacService {

    @Autowired
    private MauSacDAO mauSacDAO;

    @Override
    public List<MauSac> findAll() {
        return mauSacDAO.findAll();
    }

    @Override
    public MauSac findById(Integer id) {
        return mauSacDAO.findById(id).get();
    }

    @Override
    public MauSac create(MauSac mauSac) {
        return mauSacDAO.save(mauSac);
    }

    @Override
    public MauSac update(MauSac mauSac) {
        return mauSacDAO.save(mauSac);
    }

    @Override
    public void delete(Integer id) {
        mauSacDAO.deleteById(id);
    }
}
