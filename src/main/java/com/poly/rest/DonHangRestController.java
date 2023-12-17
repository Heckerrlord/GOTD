package com.poly.rest;

import com.fasterxml.jackson.databind.JsonNode;
import com.poly.entity.DonHang;
import com.poly.entity.GioHang;
import com.poly.service.DonHangService;
import com.poly.service.GioHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

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

	@GetMapping("/doanhthu/thang")
	public ResponseEntity<List<Object[]>> getDoanhThuThang(@RequestParam int year) {
		List<Object[]> result = orderService.getDoanhThuThang(year);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}

	@GetMapping("/nam")
	public ResponseEntity<List<Integer>> getYears() {
		List<Integer> result = orderService.getYear();
		return new ResponseEntity<>(result, HttpStatus.OK);
	}

	@GetMapping("/doanhthu/nam")
	public ResponseEntity<Double> getDoanhThuNam(@RequestParam int year) {
		Double result = orderService.getDoamhThuNam(year);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}

	@GetMapping("/doanhthu/7ngay")
	public ResponseEntity<Double> thongKeDoanhThu7NgayGanNhat(
			@RequestParam @DateTimeFormat(pattern = "dd/MM/yyyy") LocalDate sevenDaysAgo,
			@RequestParam @DateTimeFormat(pattern = "dd/MM/yyyy") LocalDate currentDate) {

		LocalDateTime startDateTime = sevenDaysAgo.atStartOfDay();
		LocalDateTime endDateTime = currentDate.atTime(LocalTime.MAX);

		Double result = orderService.thongKeDoanhThu7NgayGanNhat(startDateTime,endDateTime);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	@GetMapping("/doanhthu/hientai")
	public ResponseEntity<Double> getDoanhthuThangHT(){
		Double result = orderService.thongKeThangHienTai();
		return  new ResponseEntity<>(result,HttpStatus.OK);
	}

	@GetMapping("/soluong")
	public  Integer getSoluong(){
		return  orderService.getSoLuongDon();
	}

  @GetMapping("/doanhthu/ngay")
  public ResponseEntity<List<Object[]>> getDoanhThuNgay(@RequestParam @DateTimeFormat(pattern = "dd/MM/yyyy") LocalDate sevenDaysAgo,
														@RequestParam @DateTimeFormat(pattern = "dd/MM/yyyy") LocalDate currentDate) {
	  LocalDateTime startDateTime = sevenDaysAgo.atStartOfDay();
	  LocalDateTime endDateTime = currentDate.atTime(LocalTime.MAX);
	  List<Object[]> result = orderService.thongKeTheoKhoang(startDateTime,endDateTime);
	  return new ResponseEntity<>(result, HttpStatus.OK);
  }






}
