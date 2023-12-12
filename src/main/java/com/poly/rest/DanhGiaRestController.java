package com.poly.rest;

import com.poly.entity.DanhGia;
import com.poly.service.DanhGiaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/danhgia")
public class DanhGiaRestController {
    @Autowired
    DanhGiaService danhGiaService;

    @GetMapping
    public ResponseEntity<?> getAll(){
        List<DanhGia> result = danhGiaService.findAll();
        return  ResponseEntity.ok(result);
    }


    @GetMapping("/{ma}")
    public List<DanhGia> getDanhGiaByMaSp(@PathVariable String ma){
        return danhGiaService.getDanhGiaByMaSp(ma);
    }

    @GetMapping("/check")
    public ResponseEntity<?> checkReview(@RequestParam String maSanPham, @RequestParam String username) {
        List<DanhGia> listDanhGia = danhGiaService.findByUserAndProduct(maSanPham, username);
        return ResponseEntity.ok(listDanhGia);
    }

    @PostMapping("/{maSp}")
    public DanhGia createDanhGia(@RequestBody DanhGia danhGia,  String user, String maSp) {
        return danhGiaService.create(danhGia, user, maSp);
    }

    @PutMapping("/duyet-don")
    public ResponseEntity<DanhGia> duyetDon(@RequestBody DanhGia danhGia) {
        danhGia.setTrangThai(1);

        danhGiaService.udpate(danhGia);
        return new ResponseEntity<>(danhGia, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Integer id){
       danhGiaService.delete(id);
    }



}
