package com.poly.rest.restPhu;

import com.poly.entity.phu.DiaChi;
import com.poly.service.serPhu.DiaChiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/diachi")
public class DiaChiRestController {
    @Autowired
    private DiaChiService diaChiService;

    @GetMapping
    public List<DiaChi> getAll(Model model) {
        model.addAttribute("item", diaChiService.findAll());
        return diaChiService.findAll();
    }

    @GetMapping("{id}")
    public DiaChi getOne(@PathVariable("id") Integer id) {
        return diaChiService.findById(id);
    }

    @PostMapping
    public DiaChi create(@RequestBody DiaChi diaChi) {
        return diaChiService.create(diaChi);
    }

    @PutMapping("{id}")
    public DiaChi update(@PathVariable("id") Integer id,
                         @RequestBody DiaChi diaChi) {
        return diaChiService.update(diaChi);
    }

    @DeleteMapping("{id}")
    public void delete(@PathVariable("id") Integer id) {
        diaChiService.delete(id);
    }
}
