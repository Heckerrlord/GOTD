package com.poly.rest.restPhu;

import com.poly.entity.phu.MauSac;
import com.poly.service.serPhu.MauSacService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/color")
public class MauSacRestController {
    @Autowired
    private MauSacService mauSacService;

    @GetMapping
    public List<MauSac> getAll(Model model) {
        model.addAttribute("item", mauSacService.findAll());
        return mauSacService.findAll();
    }

    @GetMapping("{id}")
    public MauSac getOne(@PathVariable("id") Integer id) {
        return mauSacService.findById(id);
    }

    @PostMapping
    public MauSac create(@RequestBody MauSac mauSac) {
        return mauSacService.create(mauSac);
    }

    @PutMapping("{id}")
    public MauSac update(@PathVariable("id") Integer id,
                         @RequestBody MauSac mauSac) {
        return mauSacService.update(mauSac);
    }

    @DeleteMapping("{id}")
    public void delete(@PathVariable("id") Integer id) {
        mauSacService.delete(id);
    }

}
