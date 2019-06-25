package com.itshidu.study.controller;

import com.itshidu.study.dao.CourseDao;
import com.itshidu.study.entity.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

@Controller
public class PriceController {
    @Autowired
    CourseDao courseDao ;
   @ResponseBody
    @GetMapping("/admin/course/{course_id}/price")
    public  Object price(ModelAndView view ,@PathVariable long course_id){
       Course course = courseDao.getOne(course_id);
         view.setViewName("price");
         view.addObject("course",course);
        return view;
    }
    @PostMapping("/admin/course{course_id}/price")
    public  Object price(@PathVariable long course_id, double discount, Date createdistime ,Date outdistime){
       Course course =courseDao.getOne(course_id);
       course.setDiscount(discount);
       course.setCreatedistime(createdistime);
       course.setOutdistime(outdistime);
            courseDao.save(course);
        return "redirect:/admin/course/{course_id}/price";
    }
}
