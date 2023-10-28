package com.poly.rest;

import com.poly.entity.Anh;
import com.poly.entity.SanPham;
import com.poly.service.AnhService;
import com.poly.service.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

public class AnhRestController {
    @Autowired
    AnhService anhService;

    @GetMapping
    public List<Anh> getAll() {
        return anhService.findAll();
    }

//    @GetMapping("{id}")
//    public Anh getOne(@PathVariable("id") Integer id) {
//        return anhService.findById(id);
//    }

    @PostMapping
    public Anh create(@RequestBody Anh anh) {
        return anhService.create(anh);
    }

    @PutMapping("{id}")
    public Anh update(@PathVariable("id") Integer id, @RequestBody Anh anh) {
        return anhService.update(anh);
    }
//
//    @DeleteMapping("{id}")
//    public void delete(@PathVariable("id") Integer id) {
//        anhService.delete(id);
//    }
}
