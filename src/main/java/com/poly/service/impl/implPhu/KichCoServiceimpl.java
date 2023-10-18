package com.poly.service.impl.implPhu;


import com.poly.dao.daoPhu.KichCoDao;
import com.poly.entity.phu.KichCo;
import com.poly.service.serPhu.KichCoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KichCoServiceimpl implements KichCoService {
    @Autowired
    private KichCoDao kichCoDao;

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
