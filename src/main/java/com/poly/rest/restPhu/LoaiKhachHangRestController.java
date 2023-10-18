package com.poly.rest.restPhu;

import com.poly.entity.phu.LoaiKhachHang;
import com.poly.service.serPhu.LoaiKhachHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/loaikhachhang")
public class LoaiKhachHangRestController {
    @Autowired
    private LoaiKhachHangService loaiKhachHangService;

    @GetMapping
    public List<LoaiKhachHang> getAll(Model model) {
        model.addAttribute("item", loaiKhachHangService.findAll());
        return loaiKhachHangService.findAll();
    }

    @GetMapping("{id}")
    public LoaiKhachHang getOne(@PathVariable("id") Integer id) {
        return loaiKhachHangService.findById(id);
    }

    @PostMapping
    public LoaiKhachHang create(@RequestBody LoaiKhachHang loaiKhachHang) {
        return loaiKhachHangService.create(loaiKhachHang);
    }

    @PutMapping("{id}")
    public LoaiKhachHang update(@PathVariable("id") Integer id,
                                @RequestBody LoaiKhachHang loaiKhachHang) {
        return loaiKhachHangService.update(loaiKhachHang);
    }

    @DeleteMapping("{id}")
    public void delete(@PathVariable("id") Integer id) {
        loaiKhachHangService.delete(id);
    }

}
