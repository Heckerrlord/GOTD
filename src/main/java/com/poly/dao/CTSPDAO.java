package com.poly.dao;

import com.poly.entity.ChiTietSanPham;
import com.poly.entity.MauSac;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CTSPDAO extends JpaRepository<ChiTietSanPham, Long> {

    @Query("SELECT c FROM ChiTietSanPham c WHERE c.id IN (SELECT MAX(c2.id) FROM ChiTietSanPham c2 GROUP BY c2.sanPham.ma)")
    List<ChiTietSanPham> findDistinctByMasp();

    @Query(value = "SELECT MIN(C.id) AS id, C.MaSanPham, MIN(C.MaLoaiKH) AS MaLoaiKH, MIN(C.MaThuongHieu) AS MaThuongHieu, " +
            "MIN(C.MaMau) AS MaMau, MIN(C.MaKichCo) AS MaKichCo, MIN(C.MaChatLieu) AS MaChatLieu, MIN(C.MaCoAo) AS MaCoAo ," +
            "SUM(C.SoLuong) AS SoLuong, MIN(C.GiaNhap) AS GiaNhap, MIN(C.GiaBan) AS GiaBan, MIN(C.MoTa) AS MoTa ,MIN(C.NgayThem) AS NgayThem, " +
            "MIN(C.NgaySua) AS NgaySua, MIN(C.TrangThai) AS TrangThai FROM ChiTietSanPham C " +
            "JOIN DanhSachYeuThich D ON C.MaSanPham = D.MaSanPham WHERE D.MaKhachHang = :username GROUP BY C.MaSanPham", nativeQuery = true)
    List<ChiTietSanPham> findFavorite(String username);

    ChiTietSanPham findFirstBySanPhamMaAndKichCoCodeAndMauSacCode(String sp, String kc, String ms);
    ChiTietSanPham findFirstBySanPhamMaAndKichCoCode(String sp, String kc);
    ChiTietSanPham findFirstBySanPhamMaAndMauSacCode(String sp, String ms);
    ChiTietSanPham findFirstBySanPhamMa(String ma);
    List<ChiTietSanPham> findAllBySanPhamMa(String ma);
    List<ChiTietSanPham> findAllByMauSac(MauSac mauSac);
}
