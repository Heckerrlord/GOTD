package com.poly.rest;

import com.fasterxml.jackson.databind.JsonNode;
import com.poly.entity.DonHang;
import com.poly.service.DonHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/orders")
public class DonHangRestController {

	@Autowired
	DonHangService orderService;

	@PostMapping
	public DonHang create(@RequestBody JsonNode orderData) {
		return orderService.create(orderData);
	}
}
