package com.itshidu.study.controller;

import com.itshidu.study.dao.CategoryDao;
import com.itshidu.study.dao.ChapterDao;
import com.itshidu.study.dao.CourseDao;
import com.itshidu.study.dao.HourDao;
import com.itshidu.study.entity.Category;
import com.itshidu.study.entity.Chapter;
import com.itshidu.study.entity.Course;
import com.itshidu.study.entity.Hour;
import com.itshidu.study.service.AdminService;
import com.itshidu.study.service.ChapterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller

public class AdminCouContrlller {
    @Autowired
    CourseDao courseDao;
    @Autowired
    ChapterDao chapterDao;
    @Autowired
    HourDao hourDao;
    @Autowired
    CategoryDao categoryDao;

    @Autowired
    AdminService adminService;
    @Autowired
    ChapterService chapterService;

            @RequestMapping("/admin/course/plan/{id}")
    public Object pl(ModelAndView view ,@PathVariable long id ){
         Course  co=courseDao.findById(id).get();
        //根据课程名称id查出章节列表，但是每个章节缺少课时列表的属性

        List<Chapter> mulu=chapterDao.findById(id);

        //循环遍历出每一个章节的id
        mulu.forEach(c ->{

            //根据章节id查询出每个章节下的课时
            List<Hour>  hours=	hourDao.fandByChapterid(c.getId());

            //把查出来的课时都设置到的每个课时都设置到各自的章节里
            c.setHour(hours);
        });

        view.setViewName("admin/plan");
        view.addObject("course", co);
        view.addObject("mulu",mulu);

        view.setViewName("admin/plan");
 return  view;
    }
    @ResponseBody//根据课时
    @GetMapping ("/admin/hour/{hour_id}/update")
    public  Object update(ModelAndView view,@PathVariable long  hour_id  ){
       Hour ho= hourDao.getOne(hour_id);
//         Hour  hour= hourDao.findAllById(id);
 /*       HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        session.setAttribute("Hourindex", hour);*/
        System.out.println(ho);
              view.setViewName("admin/updatevideo");

 view.addObject("hour",ho);
        return view;
    }
    @PostMapping("/admin/hour/{hour_id}/update")
    public  Object update(   String name, MultipartFile video ,@PathVariable long hour_id,long chapter_id, long course_id){
        adminService.update(name,video,hour_id,chapter_id);
        return "redirect:/admin/course/plan/"+course_id;
    }

        @ResponseBody
       @GetMapping("/admin/course/{course_id}/chapter/create")
    public  Object  chapter( ModelAndView view ,@PathVariable long course_id){
         Course course =courseDao.getOne(course_id);
        System.out.println(course);
        System.out.println("++++++++"+course_id);
         view.setViewName("chapter");
         view.addObject("course",course);
        return view;
    }

    @PostMapping("/admin/course/{course_id}/chapter/create")
    public  Object savechapter(   String  name ,@PathVariable long course_id){
            if (name.isEmpty()){
                return "redirect:/admin/course/plan/{course_id}";
            }
        chapterService.save(name,course_id);
        return "redirect:/admin/course/plan/{course_id}";
    }

    @GetMapping("/admin/hour/{hour_id}/del")
    public  Object savechapter(  @PathVariable long hour_id ){
           Hour hour =hourDao.findById(hour_id).get();
           Chapter chapter = chapterDao.getOne(hour.getChapter().getId());
            Course course =courseDao.findById(chapter.getCourse().getId()).get();
         hourDao.deleteById(hour_id);
       return  "redirect:/admin/course/plan/"+course.getId();
    }

    @ResponseBody
    @GetMapping("/admin/course/{course_id}/update")
    public  Object  courseUpdate( ModelAndView view ,@PathVariable long course_id){
       List<Category>  cate  =categoryDao.findAll();
       Course course = courseDao.getOne(course_id);
        view.setViewName("courseUpdate");
        view.addObject("cate",cate);
        view.addObject("course",course);
        return view;
    }

    @PostMapping("/admin/course/{course_id}/update")
    public  Object  courseUpdate( @PathVariable long course_id,long category,Course course ){
        System.out.println(category);
       Category category1 = categoryDao.findById(category).get();

        Course course1 =courseDao.findById(course_id).get();
        course1.setCategory(category1);
        course1.setPrice(course.getPrice());
        course1.setIntro(course.getIntro());
        course1.setName(course.getName());
        course1.setApply(course.getApply());
        course1.setTeacher(course.getTeacher());
        courseDao.save(course1);

        return "redirect:/admin/course/{course_id}/update" ;
    }

}
