package com.poly.controller;

import com.poly.dao.CTSPDAO;
import com.poly.dao.DSYTDAO;
import com.poly.dao.DonHangCTDAO;
import com.poly.dao.SanPhamDAO;
import com.poly.entity.ChiTietSanPham;
import com.poly.entity.DanhSachYeuThich;
import com.poly.entity.SanPham;
import com.poly.service.CTSPService;
import com.poly.service.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
public class HomeController {

    @Autowired
    CTSPDAO pdao;
    @Autowired
    DSYTDAO dsytdao;
    @Autowired
    CTSPService ctspService;
    @Autowired
    SanPhamService productService;

    @Autowired
    SanPhamDAO sanPhamDAO;

    @Autowired
    DonHangCTDAO donHangCTDAO;

    @RequestMapping({"/", "/index"})
    public String home(Model model, @RequestParam("cid") Optional<String> cid) {
        List<DanhSachYeuThich> list1 = dsytdao.findAll();

        List<ChiTietSanPham> list = pdao.findDistinctByMasp();
        model.addAttribute("favorite", list1);
        model.addAttribute("items", list);

        // lấy danh sách đơn hàng trong 30 ngày gần đây
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.add(Calendar.DAY_OF_MONTH, -30);
        Date startDate = calendar.getTime();

        List<Long> list2 = sanPhamDAO.getShoppingWithinLast7Days(startDate);
        // lấy danh sách những sản phẩm có trong đơn hàng đó
        List<Integer> ProductIdList = donHangCTDAO.getProductIdList(list2);
        Pageable pageable = PageRequest.of(0, 4); // Lấy tối đa 4 sản phẩm
        List<SanPham> listSelling = sanPhamDAO.getTrending(ProductIdList, pageable);
        model.addAttribute("selling", listSelling);
        return "index";
    }

    @RequestMapping({"/admin", "/admin/index"})
    public String admin(Model model) {
        return "redirect:/admin/index.html";
    }

    @RequestMapping("sanpham")
    public String sanpham() {
        return "sanpham";
    }

    @RequestMapping("about")
    public String about() {
        return "about";
    }

    @RequestMapping("contact")
    public String contact() {
        return "contact";
    }
}
