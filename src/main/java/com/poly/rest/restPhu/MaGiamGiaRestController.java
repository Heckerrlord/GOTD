package com.poly.rest.restPhu;

import com.poly.entity.MaGiamGia;
import com.poly.service.serPhu.MaGiamGiaServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/MaGiamGia")
public class MaGiamGiaRestController {
    @Autowired
    private MaGiamGiaServer maGiamGiaServer;

    @GetMapping
    public List<MaGiamGia> getAll(Model model) {
        model.addAttribute("item", maGiamGiaServer.findAll());
        return maGiamGiaServer.findAll();
    }

    @GetMapping("{id}")
    public MaGiamGia getOne(@PathVariable("id") Integer id) {
        return maGiamGiaServer.findById(id);
    }

    @PostMapping
    public MaGiamGia create(@RequestBody MaGiamGia maGiamGia) {
        return maGiamGiaServer.create(maGiamGia);
    }

    @PutMapping("{id}")
    public MaGiamGia update(@PathVariable("id") Integer id,
                            @RequestBody MaGiamGia maGiamGia) {
        return maGiamGiaServer.update(maGiamGia);
    }

    @DeleteMapping("{id}")
    public void delete(@PathVariable("id") Integer id) {
        maGiamGiaServer.delete(id);
    }
}
