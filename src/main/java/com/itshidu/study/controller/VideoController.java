package com.itshidu.study.controller;

import com.itshidu.study.dao.ChapterDao;
import com.itshidu.study.dao.CourseDao;
import com.itshidu.study.dao.HourDao;
import com.itshidu.study.entity.Chapter;
import com.itshidu.study.entity.Course;
import com.itshidu.study.entity.Hour;
import com.itshidu.study.service.VideoService;
import com.itshidu.study.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class VideoController {
    @Autowired
    VideoService videoService;
    @Autowired
    HourDao hourDao;
@Autowired
    ChapterDao chapterDao;
@Autowired
CourseDao courseDao;



    @ResponseBody
    @RequestMapping("/video/{id}")
    public  Object vid( ModelAndView view,@PathVariable long id ){
       Hour  list =hourDao.findById(id).get() ;

          view.setViewName("video");
         view.addObject("list",list);
        return view;
    }
    @ResponseBody
    @GetMapping("/hour/{chapter_id}/save")
    public  Object videosave(  ModelAndView view ,@PathVariable long chapter_id ){
        Chapter  ch = chapterDao.getOne(chapter_id);
        view.setViewName("videosave");
        view.addObject("chapter",ch);
        return view;
    }
    @PostMapping("/hour/{chapter_id}/save")
    public  Object save(MultipartFile video, String name,@PathVariable long chapter_id  ,long course_id ){

        System.out.println(video);
        System.out.println(name);
        System.out.println(chapter_id);
        videoService.save(video,name,chapter_id);
       return  "redirect:/admin/course/plan/"+course_id;
    }
}
