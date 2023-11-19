package com.poly.rest.restPhu;


import com.poly.entity.KichCo;
import com.poly.service.serPhu.KichCoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/kichco")
public class KichCoRestController {
    @Autowired
    private KichCoService kichCoService;

    @GetMapping
    public List<KichCo> getAll(Model model) {
        model.addAttribute("item", kichCoService.findAll());
        return kichCoService.findAll();
    }

    @GetMapping("{id}")
    public KichCo getOne(@PathVariable("id") Integer id) {
        return kichCoService.findById(id);
    }

    @PostMapping
    public KichCo create(@RequestBody KichCo kichCo) {
        return kichCoService.create(kichCo);
    }

    @PutMapping("{id}")
    public KichCo update(@PathVariable("id") Integer id,
                         @RequestBody KichCo kichCo) {
        return kichCoService.update(kichCo);
    }

    @DeleteMapping("{id}")
    public void delete(@PathVariable("id") Integer id) {
        kichCoService.delete(id);
    }
}
