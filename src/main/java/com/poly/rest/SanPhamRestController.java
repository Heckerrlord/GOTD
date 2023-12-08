package com.poly.rest;

import com.poly.entity.SanPham;
import com.poly.service.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin("*")
@RestController
@RequestMapping("/rest/sanPham")
public class SanPhamRestController {
    @Autowired
    SanPhamService sanPhamService;

    @GetMapping
    public List<SanPham> getAll() {
        return sanPhamService.findAll();
    }

    @GetMapping("{id}")
    public SanPham getOne(@PathVariable("id") Integer id) {
        return sanPhamService.findById(id);
    }


    @PostMapping
    public SanPham create(@RequestBody SanPham product) {
        return sanPhamService.create(product);
    }

    @PutMapping("{id}")
    public SanPham update(@PathVariable("id") Integer id, @RequestBody SanPham product) {
        return sanPhamService.update(product);
    }

    @DeleteMapping("{id}")
    public void delete(@PathVariable("id") Integer id) {
        sanPhamService.delete(id);
    }

    @GetMapping("/soluong")
    public Integer getSoluong(){
        return sanPhamService.getSoLuongSp();
    }
}
