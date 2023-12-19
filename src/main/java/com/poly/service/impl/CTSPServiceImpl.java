package com.poly.service.impl;

import com.poly.dao.CTSPDAO;
import com.poly.entity.ChiTietSanPham;
import com.poly.entity.SanPham;
import com.poly.model.dto.ChiTietSanPhamDTO;
import com.poly.service.CTSPService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class CTSPServiceImpl implements CTSPService {


    @Autowired
    CTSPDAO pdao;

    @Override
    public List<ChiTietSanPham> findAll() {
        return pdao.findAll();
    }

    @Override
    public ChiTietSanPham findById(Long id) {
        return pdao.findById(id).get();
    }

    public ChiTietSanPham create(ChiTietSanPham product) {
        return pdao.save(product);
    }

	@Override
	public ChiTietSanPham update(ChiTietSanPham product) {

		return pdao.save(product);
	}

    @Override
    public ChiTietSanPham udpateTT(Long id, Integer trangthai) {
        Optional<ChiTietSanPham> chiTietSanPham = pdao.findById(id);
        if (chiTietSanPham.isPresent()) {
            ChiTietSanPham existingSanPham = chiTietSanPham.get();

            // Cập nhật trạng thái
            existingSanPham.setTrangthai(trangthai);

            // Lưu thay đổi vào cơ sở dữ liệu và trả về đối tượng đã được cập nhật
            return pdao.save(existingSanPham);
        } else {
            // Xử lý trường hợp không tìm thấy đối tượng để cập nhật
            throw new EntityNotFoundException("Không tìm thấy sản phẩm với ID: " + id);
        }
    }

    @Override
    public void delete(Long id) {
        pdao.deleteById(id);
    }


    @Override
    public List<ChiTietSanPham> findFavorites(String username) {
        return pdao.findFavorite(username);
    }

    @Override
    public Page<ChiTietSanPham> getListCTSP(String maThuongHieu, String maMau, String maKichCo, Long minGiaBan, Long maxGiaBan, Pageable pageable) {
        return null;
    }

    @Override
    public Page<ChiTietSanPham> findByFilters(String keywords,String brandNames, String sizes, String colors,String categories, Long minPrice, Long maxPrice,String sortType, Pageable pageable) {
        return pdao.findByFilters(keywords,brandNames, sizes, colors,categories, minPrice, maxPrice,sortType, pageable);
    }

    @Override
    public Page<ChiTietSanPham> findDistinctByMaspp(Pageable pageable) {
        return pdao.findDistinctByMaspp(pageable);
    }

    @Override
    public List<ChiTietSanPhamDTO> findTop5SanPhamBySoLuongBan(Pageable pageable) {
//        List<Object[]> results = pdao.findTop5SanPhamBySoLuongBan(pageable);
//        List<ChiTietSanPhamDTO> dtos = new ArrayList<>();
//
//        for (Object[] result : results) {
//            ChiTietSanPhamDTO dto = new ChiTietSanPhamDTO();
//            dto.setMa((String) result[0]);
//            dto.setTen((String) result[1]);
//            dto.setAnh((String) result[2]);
//            dto.setGia((BigDecimal) result[3]);
//            dto.setTongSoLuong((Long) result[4]);
//
//            dtos.add(dto);
//        }

        return  pdao.findTop5SanPhamBySoLuongBan(pageable);
    }


}
