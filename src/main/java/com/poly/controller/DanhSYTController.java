package com.poly.controller;


import com.poly.dao.CTSPDAO;
import com.poly.dao.DSYTDAO;
import com.poly.entity.ChiTietSanPham;
import com.poly.entity.DanhSachYeuThich;
import com.poly.entity.CoAo;
import com.poly.entity.MauSac;
import com.poly.entity.ThuongHieu;

import com.poly.service.serPhu.CoAoService;
import com.poly.service.serPhu.MauSacService;
import com.poly.service.serPhu.ThuongHieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class DanhSYTController {
    @Autowired
    ThuongHieuService thuongHieuService;
    @Autowired
    CoAoService coAoService;
    @Autowired
    MauSacService mauSacService;
    @Autowired
    CTSPDAO pdao;
    @Autowired
    HttpServletRequest request;
    @Autowired
    DSYTDAO dsytdao;


    @GetMapping("/favorites")
    public String getShopPage(Model model,String ma) {
        // Get list brand
        List<ThuongHieu> brands = thuongHieuService.findAll();
        model.addAttribute("brands", brands);
        ArrayList<Integer> brandIds = new ArrayList<Integer>();
        for (ThuongHieu brand : brands) {
            brandIds.add(brand.getId());
        }
        model.addAttribute("brandIds", brandIds);

        // Get list category
        List<CoAo> coAos = coAoService.findAll();
        model.addAttribute("categories", coAos);
        ArrayList<Integer> categoryIds = new ArrayList<Integer>();
        for (CoAo category : coAos) {
            categoryIds.add(category.getId());
        }

        // Get list color
        List<MauSac> sizeVn = mauSacService.findAll();
        model.addAttribute("sizeVn", sizeVn);

        List<ChiTietSanPham> list = pdao.findFavorite(request.getRemoteUser());
        model.addAttribute("items", list);

        List<DanhSachYeuThich> list1 = dsytdao.getFavorite(request.getRemoteUser(),ma);
        model.addAttribute("favorite",list1);

        return "product/favorite";
    }
}
