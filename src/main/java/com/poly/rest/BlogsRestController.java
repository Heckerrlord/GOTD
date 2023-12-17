package com.poly.rest;

import com.poly.entity.Blogs;
import com.poly.entity.ChatLieu;
import com.poly.service.impl.BlogsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/blogs")
public class BlogsRestController {
    @Autowired
    BlogsServiceImpl blogsService;

    @GetMapping("getAll")
    public List<Blogs> getAll(Model model) {
        model.addAttribute("item", blogsService.findAll());
        return blogsService.findAll();
    }

    @GetMapping("{id}")
    public Blogs getOne(@PathVariable("id") Integer id) {
        return blogsService.findById(id);
    }

    @PostMapping
    public Blogs create(@RequestBody Blogs blogs) {
        blogs.setNgayTao(java.time.LocalDate.now());
        blogs.setTrangThai(1);
        return blogsService.save(blogs);
    }

    @PutMapping("{id}")
    public Blogs update(@PathVariable("id") Integer id,
                           @RequestBody Blogs blogs) {
        return blogsService.save(blogs);
    }

    @DeleteMapping("{id}")
    public void delete(@PathVariable("id") Integer id) {
        blogsService.deleteById(id);
    }

    @GetMapping("listBlogs")
    public List<Blogs> listBlogs(Model model) {
        model.addAttribute("item", blogsService.listBlogs());
        return blogsService.listBlogs();
    }
    @PutMapping("/updatett/{id}")
    public Blogs archive(@PathVariable("id") Integer id) {
        Blogs blog = blogsService.findById(id);
        blog.setTrangThai(0);
        return blogsService.save(blog);
    }

    @PutMapping("/updatett1/{id}")
    public Blogs archive1(@PathVariable("id") Integer id) {
        Blogs blog = blogsService.findById(id);
        blog.setTrangThai(1);
        return blogsService.save(blog);
    }
}
