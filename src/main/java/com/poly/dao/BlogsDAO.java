package com.poly.dao;

import com.poly.entity.Blogs;
import com.poly.entity.ChiTietSanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BlogsDAO extends JpaRepository<Blogs, Integer> {


    @Query(value = "select * from blogs where trangthai = 1", nativeQuery = true)
    List<Blogs> listBlogs();

}
