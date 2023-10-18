package com.poly.rest.restPhu;


import com.poly.entity.phu.ChatLieu;
import com.poly.service.serPhu.ChatLieuSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/chatlieu")
public class ChatLieuRestController {
    @Autowired
    private ChatLieuSer chatLieuSer;

    @GetMapping
    public List<ChatLieu> getAll(Model model) {
        model.addAttribute("item", chatLieuSer.findAll());
        return chatLieuSer.findAll();
    }

    @GetMapping("{id}")
    public ChatLieu getOne(@PathVariable("id") Integer id) {
        return chatLieuSer.findById(id);
    }

    @PostMapping
    public ChatLieu create(@RequestBody ChatLieu chatLieu) {
        return chatLieuSer.create(chatLieu);
    }

    @PutMapping("{id}")
    public ChatLieu update(@PathVariable("id") Integer id,
                         @RequestBody ChatLieu chatLieu) {
        return chatLieuSer.update(chatLieu);
    }

    @DeleteMapping("{id}")
    public void delete(@PathVariable("id") Integer id) {
        chatLieuSer.delete(id);
    }
}
