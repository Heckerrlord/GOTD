package com.poly.service.serPhu;

import com.poly.entity.phu.ChatLieu;

import java.util.List;

public interface ChatLieuSer {
    List<ChatLieu> findAll();

    ChatLieu findById(Integer id);

    ChatLieu create(ChatLieu chatLieu);

    ChatLieu update(ChatLieu chatLieu);

    void delete(Integer id);
}
