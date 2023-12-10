package com.poly.controller;

import com.poly.entity.ChiTietSanPham;
import com.poly.entity.KichCo;
import com.poly.entity.MauSac;
import com.poly.entity.ThuongHieu;
import com.poly.service.CTSPService;
import com.poly.service.serPhu.KichCoService;
import com.poly.service.serPhu.MauSacService;
import com.poly.service.serPhu.ThuongHieuService;
import com.sun.mail.iap.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("api/products")
public class ProductResContronller {

    @Autowired
    CTSPService ctspService;

    @Autowired
    ThuongHieuService thuongHieuService;

    @Autowired
    KichCoService kichCoService;

    @Autowired
    MauSacService mauSacService;

//    @GetMapping("/filter")
//    public ResponseEntity<List<ChiTietSanPham>> getFilteredProducts(
//            @RequestParam(name = "brandName", required = false) List<String> brandNames,
//            @RequestParam(name = "size", required = false) List<String> sizes,
//            @RequestParam(name = "color", required = false) List<String> colors,
//            @RequestParam(name = "minPrice", required = false) Long minPrice,
//            @RequestParam(name = "maxPrice", required = false) Long maxPrice) {
//
//        List<ChiTietSanPham> filteredProducts = ctspService.findByFilters(brandNames, sizes, colors, minPrice, maxPrice);
//        return ResponseEntity.ok(filteredProducts);
//    }

    @GetMapping("/getall")
    public ResponseEntity<?> getAll(){
        List<ChiTietSanPham> list = ctspService.findAll();
        return ResponseEntity.ok(list);
    }

    @GetMapping("/brands")
    public ResponseEntity<?> getAllBrands() {
        List<ThuongHieu> brands = thuongHieuService.findAll();
        return ResponseEntity.ok(brands);
    }


    @GetMapping("/sizes")
    public ResponseEntity<?> getAllSizes() {
        List<KichCo> sizes = kichCoService.findAll();
        return ResponseEntity.ok(sizes);
    }


    @GetMapping("/colors")
    public ResponseEntity<?> getAllColors() {
        List<MauSac> colors = mauSacService.findAll();
        return ResponseEntity.ok(colors);
    }


//    @GetMapping("/getList")
//    public ResponseEntity<?> getAllSanPham(@RequestParam(name = "brandNames", required = false,defaultValue = "") String brandNames,
//                                                              @RequestParam(name = "sizes", required = false,defaultValue = "") String sizes,
//                                                              @RequestParam(name = "colors", required = false,defaultValue = "") String colors,
//                                                              @RequestParam(name = "minPrice", required = false,defaultValue ="0") Long minPrice,
//                                                              @RequestParam(name = "maxPrice", required = false,defaultValue = "9999999") Long maxPrice) {
//        List<ChiTietSanPham> item;
//        if (brandNames.isEmpty() && sizes.isEmpty() && colors.isEmpty() && minPrice == null && maxPrice == null) {
//            item = ctspService.findDistinctByMasp();
//        } else {
//            item = ctspService.findByFilters(brandNames, sizes, colors, minPrice, maxPrice);
//        }
//
//        Map<String, Object> response = new HashMap<>();
//        response.put("item", item);
//        return ResponseEntity.ok().body(item);
//    }

    @GetMapping("/getList")
    public ResponseEntity<Map<String, Object>> getAllSanPham(
            @RequestParam(name = "brandNames", required = false, defaultValue = "") String brandNames,
            @RequestParam(name = "sizes", required = false, defaultValue = "") String sizes,
            @RequestParam(name = "colors", required = false, defaultValue = "") String colors,
            @RequestParam(name = "minPrice", required = false, defaultValue = "0") Long minPrice,
            @RequestParam(name = "maxPrice", required = false, defaultValue = "9999999") Long maxPrice,
            @RequestParam(name = "page", defaultValue = "0") int page,
            @RequestParam(name = "pageSize", defaultValue = "12") int pageSize) {

        Page<ChiTietSanPham> pageResult;

        if (brandNames.isEmpty() && sizes.isEmpty() && colors.isEmpty() && minPrice == null && maxPrice == null) {
            pageResult = ctspService.findDistinctByMaspp(PageRequest.of(page, pageSize));
        } else if(brandNames.isEmpty() && sizes.isEmpty() && colors.isEmpty() && minPrice == null && maxPrice == null){
            pageResult = ctspService.findAllOrderByGiaBanAsc(PageRequest.of(page, pageSize));
        }
        else {
            pageResult = ctspService.findByFilters(brandNames, sizes, colors, minPrice, maxPrice, PageRequest.of(page, pageSize));
        }

        List<ChiTietSanPham> items = pageResult.getContent();

        Map<String, Object> response = new HashMap<>();
        response.put("items", items);
        response.put("totalItems", pageResult.getTotalElements());
        response.put("totalPages", pageResult.getTotalPages());
        response.put("currentPage", pageResult.getNumber());

        return ResponseEntity.ok().body(response);
    }




}
