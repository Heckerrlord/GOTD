package com.poly.rest.restPhu;

import com.poly.entity.CoAo;
import com.poly.service.serPhu.CoAoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/coao")
public class CoAoRestController {
    @Autowired
    private CoAoService coAoService;

    @GetMapping
    public List<CoAo> getAll(Model model) {
        model.addAttribute("item", coAoService.findAll());
        return coAoService.findAll();
    }

    @GetMapping("{id}")
    public CoAo getOne(@PathVariable("id") Integer id) {
        return coAoService.findById(id);
    }

    @PostMapping
    public CoAo create(@RequestBody CoAo coAo) {
        return coAoService.create(coAo);
    }

    @PutMapping("{id}")
    public CoAo update(@PathVariable("id") Integer id,
                       @RequestBody CoAo coAo) {
        return coAoService.update(coAo);
    }

    @DeleteMapping("{id}")
    public void delete(@PathVariable("id") Integer id) {
        coAoService.delete(id);
    }

}
