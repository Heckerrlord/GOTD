package com.poly.controller;

import com.poly.entity.*;
import com.poly.model.dto.ChiTietSanPhamDTO;
import com.poly.service.CTSPService;
import com.poly.service.serPhu.KichCoService;
import com.poly.service.serPhu.LoaiKhachHangService;
import com.poly.service.serPhu.MauSacService;
import com.poly.service.serPhu.ThuongHieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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

    @Autowired
    LoaiKhachHangService loaiKhachHangService;

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
    @GetMapping
    public ResponseEntity<?> getAll() {
        List<ChiTietSanPham> list = ctspService.findAll();
        return ResponseEntity.ok(list);
    }


//    @GetMapping("/getall")
//    public ResponseEntity<?> getAll(){
//        List<ChiTietSanPham> list = ctspService.findAll();
//        return ResponseEntity.ok(list);
//    }

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

    @GetMapping("/categories")
    public ResponseEntity<?> getAllLoaiAo() {
        List<LoaiKhachHang> loaiAos = loaiKhachHangService.findAll();
        return ResponseEntity.ok(loaiAos);
    }

    @GetMapping("/getListTrangChu")
    public ResponseEntity<Map<String, Object>> getAllProductMain(
            @RequestParam(name = "page_main", defaultValue = "0") int page_main,
            @RequestParam(name = "pageSize_main", defaultValue = "8") int pageSize_main) {

        Page<ChiTietSanPham> pageResult;
        pageResult = ctspService.findDistinctByMaspp(PageRequest.of(page_main, pageSize_main));
        List<ChiTietSanPham> list_product = pageResult.getContent();
        Map<String, Object> response = new HashMap<>();
        response.put("list_product", list_product);
        response.put("currentPage_main", pageResult.getNumber());
        return ResponseEntity.ok().body(response);
    }



    @GetMapping("/getList")
    public ResponseEntity<Map<String, Object>> getAllSanPham(
            @RequestParam(name = "product_name", required = false, defaultValue = "") String keywords,
            @RequestParam(name = "brandNames", required = false, defaultValue = "") String brandNames,
            @RequestParam(name = "sizes", required = false, defaultValue = "") String sizes,
            @RequestParam(name = "colors", required = false, defaultValue = "") String colors,
            @RequestParam(name = "categories", required = false, defaultValue = "") String categories,
            @RequestParam(name = "minPrice", required = false, defaultValue = "0") Long minPrice,
            @RequestParam(name = "maxPrice", required = false, defaultValue = "99999999") Long maxPrice,
            @RequestParam(name = "sortType",required = false,defaultValue = "") String sortType,
            @RequestParam(name = "page", defaultValue = "0") int page,
            @RequestParam(name = "pageSize", defaultValue = "9") int pageSize) {

        Page<ChiTietSanPham> pageResult;

        if (keywords.isEmpty() && brandNames.isEmpty() && sizes.isEmpty() && colors.isEmpty() && categories.isEmpty() && minPrice == null && maxPrice == null && (sortType.equals("Giá thấp đến cao")|| sortType.equals("Giá cao đến thấp") || sortType.equals("Hàng mới"))) {
            pageResult = ctspService.findDistinctByMaspp(PageRequest.of(page, pageSize));
        } else {
            pageResult = ctspService.findByFilters(keywords, brandNames, sizes, colors,categories, minPrice, maxPrice,sortType, PageRequest.of(page, pageSize));
        }

        List<ChiTietSanPham> items = pageResult.getContent();

        Map<String, Object> response = new HashMap<>();
        response.put("items", items);
        response.put("totalItems", pageResult.getTotalElements());
        response.put("totalPages", pageResult.getTotalPages());
        response.put("currentPage", pageResult.getNumber());
        response.put("sortType", sortType);

        return ResponseEntity.ok().body(response);
    }

    @GetMapping("/top5_best_seller")
    public ResponseEntity<List<ChiTietSanPhamDTO>> getTop5() {
        List<ChiTietSanPhamDTO> ctsp = ctspService.findTop5SanPhamBySoLuongBan(PageRequest.of(0,5));
        return ResponseEntity.ok(ctsp);
    }


}
