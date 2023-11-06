package com.poly.service.impl;

import com.poly.dao.DSYTDAO;
import com.poly.entity.DanhSachYeuThich;
import com.poly.service.DSYTService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class DSYTServiceImpl implements DSYTService {

    @Autowired
    DSYTDAO dsytdao;


    @Override
    public List<DanhSachYeuThich> findAll() {
        return dsytdao.findAll();
    }

    @Override
    public DanhSachYeuThich create(DanhSachYeuThich danhSachYeuThich) {
        return dsytdao.save(danhSachYeuThich);
    }

    @Override
    public void delete(String ma,String username) {
        dsytdao.delete(ma,username);
    }
}
