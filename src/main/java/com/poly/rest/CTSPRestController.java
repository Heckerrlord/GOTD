package com.poly.rest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.poly.dao.CTSPDAO;
import com.poly.dao.daoPhu.KichCoDAO;
import com.poly.dao.daoPhu.MauSacDAO;
import com.poly.entity.ChiTietSanPham;
import com.poly.entity.DanhSachYeuThich;
import com.poly.entity.KichCo;
import com.poly.entity.MauSac;
import com.poly.service.CTSPService;
import com.poly.service.serPhu.KichCoService;
import com.poly.service.serPhu.MauSacService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@CrossOrigin("*")
@RestController
@RequestMapping("/rest/products")
public class CTSPRestController {
	@Autowired
    CTSPService productService;
	@Autowired
	CTSPDAO pdao;
	@Autowired
	MauSacService mausacService;
	@Autowired
	KichCoService kichcoService;
	@Autowired
	MauSacDAO mdao;
	@Autowired
	KichCoDAO kcdao;


	@GetMapping
	public List<ChiTietSanPham> getAll() {
		return productService.findAll();

	}


	@GetMapping("{id}")
	public ChiTietSanPham getOne(@PathVariable("id") Long id) {
		return productService.findById(id);
	}

	@PostMapping
	public ChiTietSanPham create(@RequestBody ChiTietSanPham product) {
		return productService.create(product);
	}

	@PutMapping("{id}")
	public ChiTietSanPham update(@PathVariable("id") Integer id, @RequestBody ChiTietSanPham product) {
		return productService.update(product);
	}

	@DeleteMapping("{id}")
	public void delete(@PathVariable("id") Long id) {
		productService.delete(id);
	}

	@GetMapping("/favorites")
	public ResponseEntity<List<ChiTietSanPham>> getFavorites(@RequestParam String username) {
		List<ChiTietSanPham> favorites = productService.findFavorites(username);
		return ResponseEntity.ok(favorites);
	}



	@GetMapping("detail/{sanPhamMa}")
    public ResponseEntity<Object> detailSanPham(
		@PathVariable String sanPhamMa,
		@RequestParam(required = false) String kichCoCode,
		@RequestParam(required = false) String mauSacCode
) {
	ChiTietSanPham item;
	// Lấy thông tin chi tiết sản phẩm từ các mã kích cỡ và màu sắc
	if (kichCoCode != null && mauSacCode != null) {
		item = pdao.findFirstBySanPhamMaAndKichCoCodeAndMauSacCode(sanPhamMa, kichCoCode, mauSacCode);
	} else if (kichCoCode != null) {
		item = pdao.findFirstBySanPhamMaAndKichCoCode(sanPhamMa, kichCoCode);
	} else if (mauSacCode != null) {
		item = pdao.findFirstBySanPhamMaAndMauSacCode(sanPhamMa, mauSacCode);
	} else {
		item = pdao.findFirstBySanPhamMa(sanPhamMa);
	}

	// Lấy danh sách màu sắc và kích cỡ
	List<MauSac> m = mdao.findMauSacByMaSanPham(item.getSanPham().getMa());
	List<KichCo> kc = kcdao.findKichCoByMaSanPham(item.getSanPham().getMa());

	Map<String, Object> response = new HashMap<>();
	response.put("item", item);
	response.put("m", m);
	response.put("kc", kc);

	return ResponseEntity.ok(response);
}



}
