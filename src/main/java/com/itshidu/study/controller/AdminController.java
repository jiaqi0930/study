package com.itshidu.study.controller;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.itshidu.study.entity.Category;
import com.itshidu.study.entity.Course;
import com.itshidu.study.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    CategoryService categoryService;

    @PostMapping("/course/create")
    public Object addcourse(Course course) {
        categoryService.save(course);
        return  "redirect:/admin/course/create";
    }
    @ResponseBody
    @GetMapping("/course/create")
    public Object course(ModelAndView v) {
        List<Category> list=  categoryService.findall();
        v.addObject("list",list);
        v.setViewName("coursesave");

        return v;
    }

}
