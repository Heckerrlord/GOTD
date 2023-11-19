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


    @GetMapping("/{ma}")
    public List<DanhGia> getDanhGiaByMaSp(@PathVariable String ma){
        return danhGiaService.getDanhGiaByMaSp(ma);
    }

    @PostMapping("/{maSp}")
    public DanhGia createDanhGia(@RequestBody DanhGia danhGia,  String user, String maSp) {
        return danhGiaService.create(danhGia, user, maSp);
    }


}
