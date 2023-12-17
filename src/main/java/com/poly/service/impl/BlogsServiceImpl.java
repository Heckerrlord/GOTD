package com.poly.service.impl;

import com.poly.dao.BlogsDAO;
import com.poly.entity.Blogs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BlogsServiceImpl {
    @Autowired
    BlogsDAO blogsDAO;

    public List<Blogs> findAll() {
        return blogsDAO.findAll();
    }

    public List<Blogs> listBlogs() {
        return blogsDAO.listBlogs();
    }

    public List<Blogs> findAll(Sort sort) {
        return blogsDAO.findAll(sort);
    }

    public List<Blogs> findAllById(Iterable<Integer> iterable) {
        return blogsDAO.findAllById(iterable);
    }

    public <S extends Blogs> List<S> saveAll(Iterable<S> iterable) {
        return blogsDAO.saveAll(iterable);
    }

    public void flush() {
        blogsDAO.flush();
    }

    public <S extends Blogs> S saveAndFlush(S s) {
        return blogsDAO.saveAndFlush(s);
    }

    public void deleteInBatch(Iterable<Blogs> iterable) {
        blogsDAO.deleteInBatch(iterable);
    }

    public void deleteAllInBatch() {
        blogsDAO.deleteAllInBatch();
    }

    public Blogs getOne(Integer integer) {
        return blogsDAO.getOne(integer);
    }

    public <S extends Blogs> List<S> findAll(Example<S> example) {
        return blogsDAO.findAll(example);
    }

    public <S extends Blogs> List<S> findAll(Example<S> example, Sort sort) {
        return blogsDAO.findAll(example, sort);
    }

    public Page<Blogs> findAll(Pageable pageable) {
        return blogsDAO.findAll(pageable);
    }

    public <S extends Blogs> S save(S s) {
        return blogsDAO.save(s);
    }

    public Blogs findById(Integer integer) {
        return blogsDAO.findById(integer).get();
    }

    public boolean existsById(Integer integer) {
        return blogsDAO.existsById(integer);
    }

    public long count() {
        return blogsDAO.count();
    }

    public void deleteById(Integer integer) {
        blogsDAO.deleteById(integer);
    }

    public void delete(Blogs blogs) {
        blogsDAO.delete(blogs);
    }

    public void deleteAll(Iterable<? extends Blogs> iterable) {
        blogsDAO.deleteAll(iterable);
    }

    public void deleteAll() {
        blogsDAO.deleteAll();
    }

    public <S extends Blogs> Optional<S> findOne(Example<S> example) {
        return blogsDAO.findOne(example);
    }

    public <S extends Blogs> Page<S> findAll(Example<S> example, Pageable pageable) {
        return blogsDAO.findAll(example, pageable);
    }

    public <S extends Blogs> long count(Example<S> example) {
        return blogsDAO.count(example);
    }

    public <S extends Blogs> boolean exists(Example<S> example) {
        return blogsDAO.exists(example);
    }
}
