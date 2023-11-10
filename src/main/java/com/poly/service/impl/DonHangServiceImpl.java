package com.poly.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import com.poly.dao.DonHangCTDAO;
import com.poly.dao.DonHangDAO;
import com.poly.entity.DonHang;
import com.poly.entity.DonHangChiTiet;
import com.poly.service.DonHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class DonHangServiceImpl implements DonHangService {
	@Autowired
    DonHangDAO dao;

	@Autowired
    DonHangCTDAO ddao;
	@Override
	public DonHang create(DonHang donHang) {
		return  dao.save(donHang);

	}

//	public DonHangChiTiet createDHCT(DonHangChiTiet dhct) {
//		return ddao.save(dhct);
//	}

	@Override
	public DonHang findById(Long id) {
		return dao.findById(id).get();
	}

	@Override
	public List<DonHang> findByUsername(String username) {
		return dao.findByUsername(username);
	}
}
