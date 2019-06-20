package com.itshidu.study.controller;

import com.itshidu.study.dao.ChapterDao;
import com.itshidu.study.dao.CourseDao;
import com.itshidu.study.dao.HourDao;
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
        System.out.println("徐长亮-1 高做到高做到高做到高做到高做到高做到 高做到 高做到  ");
           Hour hour =hourDao.findById(hour_id).get();
        System.out.println("夏增月 高做到高做到高做到高做到高做到高做到 高做到 高做到  ");
           Chapter chapter = chapterDao.getOne(hour.getChapter().getId());
        System.out.println("张达 高做到高做到高做到高做到高做到高做到 高做到 高做到  ");
            Course course =courseDao.findById(chapter.getCourse().getId()).get();
        System.out.println("好靓 高做到高做到高做到高做到高做到高做到 高做到 高做到  ");
        System.out.println("qweqweqwe"+course.getId());
         hourDao.deleteById(hour_id);
        System.out.println("高做到3 高做到高做到高做到高做到高做到高做到 高做到 高做到  ");
       return  "redirect:/admin/course/plan/"+course.getId();
    }



}
