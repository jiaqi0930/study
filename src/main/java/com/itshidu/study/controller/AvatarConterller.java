package com.itshidu.study.controller;

import com.itshidu.study.dao.CourseDao;
import com.itshidu.study.entity.Course;
import com.itshidu.study.service.CourseService;
import com.itshidu.study.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AvatarConterller {

    @Autowired
    CourseDao courseDao;
    @Autowired
    CourseService courseService;

    @ResponseBody
    @RequestMapping("/avatar/{id}")
    public Object saveavatar(ModelAndView v, @PathVariable long id) {


        List<Course> list = courseDao.findpriceById(id);
//        Course course = courseDao.findAllById(id);

      /*  HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        session.setAttribute("Courseinfo", course);*/

        v.setViewName("couavatar");
        v.addObject("list", list);
        return v;

    }
    @ResponseBody
    @RequestMapping("/course/ava")
    public Object Uploda(MultipartFile image, HttpSession session     ) {
return   courseService.uploda(image, session);
    }
}