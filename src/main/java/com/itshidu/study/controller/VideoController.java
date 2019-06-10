package com.itshidu.study.controller;

import com.itshidu.study.dao.HourDao;
import com.itshidu.study.entity.Hour;
import com.itshidu.study.entity.Video;
import com.itshidu.study.service.VideoService;
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
public class VideoController {
    @Autowired
    VideoService videoService;
    @Autowired
    HourDao hourDao;

    @ResponseBody
    @RequestMapping("/video")
    public  Object vid(  ModelAndView view){
        List<Hour> list= hourDao.findAll();
          view.setViewName("video");
          view.addObject("list",list);
        return view;

    }

    @RequestMapping("/video/save")
    public  Object save(String url, String name, Hour hour, HttpSession session){


        videoService.save(url,name,hour);
        return  "redirect:/video";

    }
}
