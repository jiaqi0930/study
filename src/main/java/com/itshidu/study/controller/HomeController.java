package com.itshidu.study.controller;

import com.itshidu.study.dao.CourseDao;
import com.itshidu.study.entity.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class HomeController {
 @Autowired
    CourseDao courseDao ;

    @RequestMapping("/index")
    public Object login( ) {

        ModelAndView m = new ModelAndView("index");
      List<Course> list =  courseDao.findAll();
      m.addObject("list",list);
        return m;
    }

}
