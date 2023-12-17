package com.poly.dao;

import com.poly.entity.ChiTietSanPham;
import com.poly.entity.MauSac;
import com.poly.model.dto.ChiTietSanPhamDTO;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

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
    @Query("SELECT a FROM ChiTietSanPham a WHERE a.mauSac.code = :mau AND a.kichCo.code = :size AND a.sanPham.ma = :ma")
    Optional<ChiTietSanPham> findExistingChiTiet(String mau,String size, String ma);


    ChiTietSanPham findFirstBySanPhamMaAndKichCoCode(String sp, String kc);

    ChiTietSanPham findFirstBySanPhamMaAndMauSacCode(String sp, String ms);

    ChiTietSanPham findFirstBySanPhamMa(String ma);

    List<ChiTietSanPham> findAllBySanPhamMa(String ma);

    List<ChiTietSanPham> findAllByMauSac(MauSac mauSac);

    @Query(value =
            "SELECT * FROM ChiTietSanPham " +
                    "WHERE (COALESCE(:maThuongHieu, '') = '' OR MaThuongHieu = :maThuongHieu) " +
                    "AND (COALESCE(:maMau, '') = '' OR MaMau = :maMau) " +
                    "AND (COALESCE(:maKichCo, '') = '' OR MaKichCo = :maKichCo) " +
                    "AND (COALESCE(:minGiaBan, '') = '' OR GiaBan >= :minGiaBan) " +
                    "AND (COALESCE(:maxGiaBan, '') = '' OR GiaBan <= :maxGiaBan)",
            countQuery =
                    "SELECT COUNT(*) FROM ChiTietSanPham " +
                            "WHERE (COALESCE(:maThuongHieu, '') = '' OR MaThuongHieu = :maThuongHieu) " +
                            "AND (COALESCE(:maMau, '') = '' OR MaMau = :maMau) " +
                            "AND (COALESCE(:maKichCo, '') = '' OR MaKichCo = :maKichCo) " +
                            "AND (COALESCE(:minGiaBan, '') = '' OR GiaBan >= :minGiaBan) " +
                            "AND (COALESCE(:maxGiaBan, '') = '' OR GiaBan <= :maxGiaBan)",
            nativeQuery = true)
    Page<ChiTietSanPham> getListCTSP(String maThuongHieu, String maMau, String maKichCo, Long minGiaBan, Long maxGiaBan, Pageable pageable);


    @Query("SELECT c FROM ChiTietSanPham c WHERE c.id IN (SELECT MAX(c2.id) FROM ChiTietSanPham c2 GROUP BY c2.sanPham.ma)")
    Page<ChiTietSanPham> findDistinctByMaspp(Pageable pageable);


    @Query(value = "SELECT c.id AS ctsp_id, c.* \n" +
            "FROM ChiTietSanPham c\n" +
            "INNER JOIN ThuongHieu th ON c.MaThuongHieu = th.Ma\n" +
            "INNER JOIN KichCo kc ON c.MaKichCo = kc.Ma\n" +
            "INNER JOIN MauSac ms ON c.MaMau = ms.Ma\n" +
            "WHERE (th.Ten IN (SELECT value FROM STRING_SPLIT(?1,',')) OR COALESCE(?1, '') = '')\n" +
            "AND (kc.Ten IN (SELECT value FROM STRING_SPLIT(?2,',')) OR COALESCE(?2, '') = '')\n" +
            "AND (ms.Ten IN (SELECT value FROM STRING_SPLIT(?3,',')) OR COALESCE(?3, '') = '')\n" +
            "AND c.GiaBan BETWEEN COALESCE(?4, 0) AND COALESCE(?5, 999999999)",
            countQuery = "SELECT COUNT(c.id) FROM ChiTietSanPham c\n" +
                    "INNER JOIN ThuongHieu th ON c.MaThuongHieu = th.Ma\n" +
                    "INNER JOIN KichCo kc ON c.MaKichCo = kc.Ma\n" +
                    "INNER JOIN MauSac ms ON c.MaMau = ms.Ma\n" +
                    "WHERE (th.Ten IN (SELECT value FROM STRING_SPLIT(?1,',')) OR COALESCE(?1, '') = '')\n" +
                    "AND (kc.Ten IN (SELECT value FROM STRING_SPLIT(?2,',')) OR COALESCE(?2, '') = '')\n" +
                    "AND (ms.Ten IN (SELECT value FROM STRING_SPLIT(?3,',')) OR COALESCE(?3, '') = '')\n" +
                    "AND c.GiaBan BETWEEN COALESCE(?4, 0) AND COALESCE(?5, 999999999)",
            nativeQuery = true)
    Page<ChiTietSanPham> findByFilters(String brandNames,
                                       String sizes,
                                       String colors,
                                       Long minPrice,
                                       Long maxPrice,
                                       Pageable pageable);


    @Query("SELECT c FROM ChiTietSanPham c ORDER BY c.GiaBan ASC")
    Page<ChiTietSanPham> findAllOrderByGiaBanAsc(Pageable pageable);
}
