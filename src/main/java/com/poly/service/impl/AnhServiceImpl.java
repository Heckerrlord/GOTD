//package com.poly.service.impl;
//
//import com.poly.dao.AnhDAO;
//import com.poly.dao.daoPhu.ChatLieuDao;
//import com.poly.entity.Anh;
//import com.poly.entity.SanPham;
//import com.poly.entity.phu.ChatLieu;
//import com.poly.service.AnhService;
//import com.poly.service.serPhu.ChatLieuSer;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import java.util.List;
//
//@Service
//public class AnhServiceimpl implements AnhService {
//    @Autowired
//    private AnhDAO anhDao;
//
//    @Override
//    public List<Anh> findAll() {
//        return anhDao.findAll();
//    }
//
//    @Override
//    public Anh create(Anh chatLieu) {
//        return anhDao.save(chatLieu);
//    }
//
//    @Override
//    public Anh update(Anh chatLieu) {
//        return anhDao.save(chatLieu);
//    }
//
//    @Override
//    public List<Anh> findByMaSP(String sp) {
//        return anhDao.findBySanPham_Ma(sp);
//
//    }
//}
