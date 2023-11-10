package com.poly.rest;

import com.fasterxml.jackson.databind.JsonNode;
import com.poly.entity.DonHang;
import com.poly.entity.GioHang;
import com.poly.service.DonHangService;
import com.poly.service.GioHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/orders")
public class DonHangRestController {

	@Autowired
	DonHangService orderService;

	@Autowired
	GioHangService gioHangService;

//	@PostMapping
//	public GioHang create(@RequestBody GioHang donHang) {
//		return gioHangService.create(donHang);
//	}
}
