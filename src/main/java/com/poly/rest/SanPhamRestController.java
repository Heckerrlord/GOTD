package com.poly.rest;

import com.poly.entity.SanPham;
import com.poly.service.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityNotFoundException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public ResponseEntity<?> createSanPham(@RequestBody SanPham sanPham) {
        try {
            SanPham savedSanPham = sanPhamService.create(sanPham);
            return ResponseEntity.ok(savedSanPham); // Trả về đối tượng đã được lưu thành công
        } catch (Exception e) {
            // Xử lý lỗi và trả về mã lỗi HTTP phù hợp
            String errorMessage = "Có lỗi xảy ra khi tạo sản phẩm.";
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorMessage);
        }
    }


    @PutMapping
    public ResponseEntity<?> updateSanPham(@RequestBody SanPham updatedSanPham) {
        SanPham result = sanPhamService.update(updatedSanPham);
        if (result != null) {
            return ResponseEntity.ok().body(result);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("{id}")
    public void delete(@PathVariable("id") Integer id) {
        sanPhamService.delete(id);
    }

    @PutMapping("/update-trangthai/{id}")
    public ResponseEntity<String> updateTrangThai(@PathVariable Integer id, @RequestParam Integer newTrangThai) {
        try {
            sanPhamService.udpateTT(id, newTrangThai);
            return new ResponseEntity<>("Cập nhật trạng thái thành công", HttpStatus.OK);
        } catch (EntityNotFoundException e) {
            return new ResponseEntity<>("Không tìm thấy sản phẩm với ID: " + id, HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            return new ResponseEntity<>("Lỗi khi cập nhật trạng thái", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @GetMapping("/soluong")
    public Integer getSoluong(){
        return sanPhamService.getSoLuongSp();
    }
}
