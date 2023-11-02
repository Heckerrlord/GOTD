package com.poly.service.impl.implPhu;

import com.poly.dao.daoPhu.CoAoDAO;
import com.poly.entity.phu.CoAo;
import com.poly.service.serPhu.CoAoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CoAoServiceImpl implements CoAoService {
    @Autowired
    private CoAoDAO coAoDao;

    @Override
    public List<CoAo> findAll() {
        return coAoDao.findAll();
    }

    @Override
    public CoAo findById(Integer id) {
        return coAoDao.findById(id).get();
    }

    @Override
    public CoAo create(CoAo coAo) {
        return coAoDao.save(coAo);
    }

    @Override
    public CoAo update(CoAo coAo) {
        return coAoDao.save(coAo);
    }

    @Override
    public void delete(Integer id) {
        coAoDao.deleteById(id);
    }
}
