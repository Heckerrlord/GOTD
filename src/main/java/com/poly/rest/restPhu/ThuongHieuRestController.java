package com.poly.rest.restPhu;

import com.poly.entity.phu.ThuongHieu;
import com.poly.service.serPhu.ThuongHieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/thuonghieu")
public class ThuongHieuRestController {
    @Autowired
    private ThuongHieuService thuongHieuService;

    @GetMapping
    public List<ThuongHieu> getAll(Model model) {
        model.addAttribute("item", thuongHieuService.findAll());
        return thuongHieuService.findAll();
    }

    @GetMapping("{id}")
    public ThuongHieu getOne(@PathVariable("id") Integer id) {
        return thuongHieuService.findById(id);
    }

    @PostMapping
    public ThuongHieu create(@RequestBody ThuongHieu thuongHieu) {
        return thuongHieuService.create(thuongHieu);
    }

    @PutMapping("{id}")
    public ThuongHieu update(@PathVariable("id") Integer id,
                             @RequestBody ThuongHieu thuongHieu) {
        return thuongHieuService.update(thuongHieu);
    }

    @DeleteMapping("{id}")
    public void delete(@PathVariable("id") Integer id) {
        thuongHieuService.delete(id);
    }

}
