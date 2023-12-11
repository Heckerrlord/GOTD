package com.poly.rest;

import com.poly.entity.ChiTietSanPham;
import com.poly.entity.DanhSachYeuThich;
import com.poly.service.CTSPService;
import com.poly.service.DSYTService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@CrossOrigin("*")
@RestController
@RequestMapping("/rest/favorites")
public class DSYTRestController {

    @Autowired
    DSYTService dsytService;
    @Autowired
    CTSPService ctspService;

    @GetMapping
    public List<DanhSachYeuThich> load(String username,String ma){
        return dsytService.getFavorite(username, ma);
    }

    @PostMapping
    public DanhSachYeuThich  create(@RequestBody DanhSachYeuThich yeuThich){
     return dsytService.create(yeuThich);
    }
    @DeleteMapping
    public void  delete(String ma,String username){
     dsytService.delete(ma, username);
    }

    @GetMapping("/check")
    public List<DanhSachYeuThich> getFavo(@RequestParam(name = "username") String username,@RequestParam(name = "ma") String ma){
        return dsytService.getFavorite(username,ma);
    }

}
