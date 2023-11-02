package com.poly.service.impl.implPhu;

import com.poly.dao.daoPhu.ChatLieuDAO;
import com.poly.entity.phu.ChatLieu;
import com.poly.service.serPhu.ChatLieuSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChatLieuServiceImpl implements ChatLieuSer {
    @Autowired
    private ChatLieuDAO chatLieuDao;

    @Override
    public List<ChatLieu> findAll() {
        return chatLieuDao.findAll();
    }

    @Override
    public ChatLieu findById(Integer id) {
        return chatLieuDao.findById(id).get();
    }

    @Override
    public ChatLieu create(ChatLieu chatLieu) {
        return chatLieuDao.save(chatLieu);
    }

    @Override
    public ChatLieu update(ChatLieu chatLieu) {
        return chatLieuDao.save(chatLieu);
    }

    @Override
    public void delete(Integer id) {
        chatLieuDao.deleteById(id);
    }
}
