package com.itshidu.study.controller;

import com.itshidu.study.dao.CourseDao;
import com.itshidu.study.entity.Coupon;
import com.itshidu.study.entity.Course;
import com.itshidu.study.service.CouponService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import java.util.List;
import java.util.Date;

@Controller
public class PriceController {
    @Autowired
    CourseDao courseDao ;
    @Autowired
    CouponService couponService ;
   @ResponseBody
    @RequestMapping ("/admin/course/{course_id}/price")
    public  Object price(ModelAndView view ,@PathVariable long course_id){
       Course course = courseDao.getOne(course_id);
         view.setViewName("price");
         view.addObject("course",course);
        return view;
    }
    @RequestMapping("/admin/course/{course_id}/q" )
    public  Object price(@PathVariable long course_id,double price, double discount, @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")Date createdistime, @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")Date outdistime ){


        Course    course =courseDao.getOne(course_id);
        course.setPrice(price);
       course.setDiscount(discount);
       course.setCreatedistime(createdistime);
        course.setOutdistime(outdistime );
            courseDao.save(course);
        return "redirect:/course/{course_id}";
    }

    @GetMapping("/admin/coupon/save")
    public  Object coupon(ModelAndView view){
          List<Course> course = courseDao.findAll();
        view.addObject("course",course);
       view.setViewName("coupon");
       return view;
    }
    @PostMapping("/admin/coupon/save")
    public  Object coupon(Coupon coupon ){
        couponService.save(coupon);
       return "redirect:/admin/coupon/save";
    }
}
