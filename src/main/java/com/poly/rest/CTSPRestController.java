package com.poly.rest;

import java.util.List;

import com.poly.entity.ChiTietSanPham;
import com.poly.service.CTSPService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@CrossOrigin("*")
@RestController
@RequestMapping("/rest/products")
public class CTSPRestController {
	@Autowired
    CTSPService productService;

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
}
