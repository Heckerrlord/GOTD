package com.poly.controller;

import com.poly.dao.CTSPDAO;
import com.poly.dao.DSYTDAO;
import com.poly.entity.ChiTietSanPham;
import com.poly.entity.DanhSachYeuThich;
import com.poly.service.CTSPService;
import com.poly.service.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Optional;

@Controller
public class Home2Controller {

	@Autowired
	CTSPDAO pdao;

	@Autowired
	CTSPService ctspService;
	@Autowired
	SanPhamService productService;
	@Autowired
	DSYTDAO dsytdao;
	@Autowired
	HttpServletRequest request;

	@RequestMapping({ "/", "/index" })
	public String home(Model model, @RequestParam("cid") Optional<String> cid,
					   String ma)  {
			List<ChiTietSanPham> list = pdao.findDistinctByMasp();
			model.addAttribute("items", list);

			List<DanhSachYeuThich> list1 = dsytdao.findAll();
			model.addAttribute("favorite",list1);
		return "index";
	}

	@RequestMapping({ "/admin", "/admin/index" })
	public String admin(Model model) {
		return "redirect:/admin/index.html";
	}

	@RequestMapping("sanpham")
	public String sanpham(){
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
