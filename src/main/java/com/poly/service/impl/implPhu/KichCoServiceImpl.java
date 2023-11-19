package com.poly.service.impl.implPhu;


import com.poly.dao.daoPhu.KichCoDAO;
import com.poly.entity.KichCo;
import com.poly.service.serPhu.KichCoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KichCoServiceImpl implements KichCoService {
    @Autowired
    private KichCoDAO kichCoDao;

    @Override
    public List<KichCo> findAll() {
        return kichCoDao.findAll();
    }

    @Override
    public KichCo findById(Integer id) {
        return kichCoDao.findById(id).get();
    }

    @Override
    public KichCo create(KichCo kichCo) {
        return kichCoDao.save(kichCo);
    }

    @Override
    public KichCo update(KichCo kichCo) {
        return kichCoDao.save(kichCo);
    }

    @Override
    public void delete(Integer id) {
        kichCoDao.deleteById(id);
    }
}
