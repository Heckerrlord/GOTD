package com.poly.dao;

import com.poly.entity.ChiTietSanPham;
import com.poly.entity.MauSac;
import com.poly.model.dto.ChiTietSanPhamDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CTSPDAO extends JpaRepository<ChiTietSanPham, Long> {

    @Query("SELECT c FROM ChiTietSanPham c WHERE c.id IN (SELECT MAX(c2.id) FROM ChiTietSanPham c2 GROUP BY c2.sanPham.ma)")
    List<ChiTietSanPham> findDistinctByMasp();


    @Query(value = "SELECT " +
            "MIN(c.id) AS id, " +
            "c.maSanPham AS maSanPham, " +
            "MIN(c.maMau) AS maMau, " +
            "MIN(c.maKichCo) AS maKichCo, " +
            "MIN(sp.maChatLieu) AS maChatLieu, " +
            "MIN(sp.maCoAo) AS maCoAo, " +
            "MIN(sp.maLoaiAo) AS maLoaiAo, " +
            "MIN(sp.maThuongHieu) AS maThuongHieu, " +
            "SUM(c.soLuong) AS soLuong, " +
            "MIN(c.giaNhap) AS giaNhap, " +
            "MIN(c.giaBan) AS giaBan, " +
            "MIN(c.moTa) AS moTa, " +
            "MIN(c.ngayThem) AS ngayThem, " +
            "MIN(c.ngaySua) AS ngaySua, " +
            "MIN(c.trangThai) AS trangThai " +
            "FROM ChiTietSanPham c " +
            "JOIN DanhSachYeuThich d ON c.maSanPham = d.maSanPham " +
            "JOIN SanPham sp ON sp.ma = d.maSanPham " +
            "WHERE d.maKhachHang = :username " +
            "GROUP BY c.maSanPham", nativeQuery = true)
    List<ChiTietSanPham> findFavorite(String username);

    ChiTietSanPham findFirstBySanPhamMaAndKichCoCodeAndMauSacCode(String sp, String kc, String ms);

    ChiTietSanPham findFirstBySanPhamMaAndKichCoCode(String sp, String kc);

    ChiTietSanPham findFirstBySanPhamMaAndMauSacCode(String sp, String ms);

    ChiTietSanPham findFirstBySanPhamMa(String ma);

    List<ChiTietSanPham> findAllBySanPhamMa(String ma);

    List<ChiTietSanPham> findAllByMauSac(MauSac mauSac);

    @Query("SELECT c FROM ChiTietSanPham c WHERE c.id IN (SELECT MAX(c2.id) FROM ChiTietSanPham c2 GROUP BY c2.sanPham.ma)")
    Page<ChiTietSanPham> findDistinctByMaspp(Pageable pageable);


    @Query(value = "SELECT c.id AS ctsp_id, c.* " +
            "FROM ChiTietSanPham c " +
            "INNER JOIN SanPham sp ON c.MaSanPham = sp.Ma " +
            "INNER JOIN ThuongHieu th ON sp.MaThuongHieu = th.Ma " +
            "INNER JOIN KichCo kc ON c.MaKichCo = kc.Ma " +
            "INNER JOIN MauSac ms ON c.MaMau = ms.Ma " +
            "INNER JOIN LoaiAo la ON sp.MaLoaiAo = la.Ma " +
            "WHERE (th.Ten IN (SELECT value FROM STRING_SPLIT(?1,',')) OR COALESCE(?1, '') = '') " +
            "AND (kc.Ten IN (SELECT value FROM STRING_SPLIT(?2,',')) OR COALESCE(?2, '') = '') " +
            "AND (ms.Ten IN (SELECT value FROM STRING_SPLIT(?3,',')) OR COALESCE(?3, '') = '') " +
            "AND (la.Ten IN (SELECT value FROM STRING_SPLIT(?4,',')) OR COALESCE(?4, '') = '') " +
            "AND c.GiaBan BETWEEN COALESCE(?5, 0) AND COALESCE(?6, 999999999) " +
            "AND (CASE WHEN ?7 = N'Hàng mới' THEN c.NgayThem END < GETDATE() OR COALESCE(?7, '') != N'Hàng mới') " +
            "ORDER BY " +
            "CASE WHEN ?7 = N'Giá thấp đến cao' THEN c.GiaBan END ASC, " +
            "CASE WHEN ?7 = N'Giá cao đến thấp' THEN c.GiaBan END DESC, " +
            "CASE WHEN ?7 = N'Hàng mới' THEN c.NgayThem END DESC",
            countQuery = "SELECT c.id AS ctsp_id, c.* " +
                    "FROM ChiTietSanPham c " +
                    "INNER JOIN SanPham sp ON c.MaSanPham = sp.Ma " +
                    "INNER JOIN ThuongHieu th ON sp.MaThuongHieu = th.Ma " +
                    "INNER JOIN KichCo kc ON c.MaKichCo = kc.Ma " +
                    "INNER JOIN MauSac ms ON c.MaMau = ms.Ma " +
                    "INNER JOIN LoaiAo la ON sp.MaLoaiAo = la.Ma " +
                    "WHERE (th.Ten IN (SELECT value FROM STRING_SPLIT(?1,',')) OR COALESCE(?1, '') = '') " +
                    "AND (kc.Ten IN (SELECT value FROM STRING_SPLIT(?2,',')) OR COALESCE(?2, '') = '') " +
                    "AND (ms.Ten IN (SELECT value FROM STRING_SPLIT(?3,',')) OR COALESCE(?3, '') = '') " +
                    "AND (la.Ten IN (SELECT value FROM STRING_SPLIT(?4,',')) OR COALESCE(?4, '') = '') " +
                    "AND c.GiaBan BETWEEN COALESCE(?5, 0) AND COALESCE(?6, 999999999) " +
                    "AND (CASE WHEN ?7 = N'Hàng mới' THEN c.NgayThem END < GETDATE() OR COALESCE(?7, '') != N'Hàng mới') " +
                    "ORDER BY " +
                    "CASE WHEN ?7 = N'Giá thấp đến cao' THEN c.GiaBan END ASC, " +
                    "CASE WHEN ?7 = N'Giá cao đến thấp' THEN c.GiaBan END DESC, " +
                    "CASE WHEN ?7 = N'Hàng mới' THEN c.NgayThem END DESC",
            nativeQuery = true)
    Page<ChiTietSanPham> findByFilters(String brandNames,
                                       String sizes,
                                       String colors,
                                       String categories,
                                       Long minPrice,
                                       Long maxPrice,
                                       String sortType,
                                       Pageable pageable);


    @Query("SELECT NEW com.poly.model.dto.ChiTietSanPhamDTO(sp.ma, sp.ten, a.ma, SUM(COALESCE(c.soLuong, 0))) " +
            "FROM DonHangChiTiet c " +
            "INNER JOIN ChiTietSanPham ct ON ct.id = c.chiTietSanPham.sanPham.id " +
            "INNER JOIN SanPham sp ON ct.sanPham.ma = sp.ma " +
            "INNER JOIN Anh a ON sp.ma = a.sanPham.ma " +
            "GROUP BY sp.ma, sp.ten, a.ma " +
            "ORDER BY SUM(COALESCE(c.soLuong, 0)) DESC")
    List<ChiTietSanPhamDTO> findTop5SanPhamBySoLuongBan(Pageable pageable);

}
