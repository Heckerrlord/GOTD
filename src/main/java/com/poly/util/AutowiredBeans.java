package com.poly.util;

import com.poly.dao.CTSPDAO;
import com.poly.service.CTSPService;
import com.poly.service.SanPhamService;
import com.poly.service.serPhu.KichCoService;
import com.poly.service.serPhu.MauSacService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AutowiredBeans {
    @Autowired
    CTSPService productService;
    @Autowired
    SanPhamService sanPhamService;
    @Autowired
    CTSPDAO pdao;
    @Autowired
    MauSacService mausacService;
    @Autowired
    KichCoService kichcoService;
}
