package com.poly.service.impl;

import java.sql.Timestamp;
import java.time.LocalDateTime;
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

	@Override
	public List<Object[]> getDoanhThuThang(int year) {
		return dao.getDoanhThuThang(year);
	}

	@Override
	public List<Integer> getYear() {
		return dao.getYear();
	}

	@Override
	public Double getDoamhThuNam(int year) {
		return dao.getDoamhThuNam(year);
	}

	@Override
	public Double thongKeDoanhThu7NgayGanNhat(LocalDateTime sevenDaysAgo, LocalDateTime currentDate) {
		Timestamp sevenDaysAgoTimestamp = Timestamp.valueOf(sevenDaysAgo);
		Timestamp currentDateTimestamp = Timestamp.valueOf(currentDate);

		return dao.thongKeDoanhThu7NgayGanNhat(sevenDaysAgoTimestamp, currentDateTimestamp);
	}

	@Override
	public Double thongKeThangHienTai() {
		return dao.thongKeThangHienTai();
	}

	@Override
	public Integer getSoLuongDon() {
		return dao.getSoLuongDon();
	}

	@Override
	public List<Object[]> thongkeNgay() {
		return dao.thongkeNgay();
	}

	@Override
	public List<Object[]> thongKeTheoKhoang(LocalDateTime sevenDaysAgo, LocalDateTime currentDate) {
		Timestamp sevenDaysAgoTimestamp = Timestamp.valueOf(sevenDaysAgo);
		Timestamp currentDateTimestamp = Timestamp.valueOf(currentDate);
		return dao.thongKeTheoKhoang(sevenDaysAgoTimestamp,currentDateTimestamp);
	}



}
