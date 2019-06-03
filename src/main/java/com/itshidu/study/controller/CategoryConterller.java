package com.itshidu.study.controller;
import com.itshidu.study.entity.Category;
import com.itshidu.study.entity.Chapter;
import com.itshidu.study.entity.Course;
import com.itshidu.study.entity.Hour;
import com.itshidu.study.service.CategoryService;
import com.itshidu.study.service.ChapterService;
import com.itshidu.study.service.HourService;
import com.itshidu.study.util.Result;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CategoryConterller {
    @Autowired CategoryService categorySetvice;
    @Autowired ChapterService chapterSetvice;
    @Autowired HourService hourService;
    
//    @RequestMapping("")
//    public    Object save(Category category){
//        return  categorySetvice.save(category);
//    }
// 查询出所有的类别
    @ResponseBody
    @RequestMapping("/category/list")
   public  Object  findallcategory(ModelAndView v){
    	List<Category>  list=  categorySetvice.findall();
        v.setViewName("category");
        v.addObject("list",list);

        return v;
   }
    //根据类别id查询出所有的课程
    @ResponseBody
    @RequestMapping("/course/list")
    public Object findallcourse(ModelAndView v,Long id) {
    	List<Course> list=categorySetvice.findAllByCategoryid(id);
    	v.setViewName("video");
    	v.addObject("list", list);
		return v;
    }
    //根据id查询出课程的简介之类的东西
    @ResponseBody
    @RequestMapping("/course/price")
    public Object findPriceById(ModelAndView v,Long id) {
        List<Course> list=categorySetvice.findpriceById(id);
    	v.setViewName("price");
    	v.addObject("list", list);
		return v;
    }
    //根据课程的id查出章节以及课时
    @ResponseBody
    @RequestMapping("/Chapter/courseid/{id}")
    public Object chaptejkhbsdfjk(ModelAndView  v, @PathVariable Long id) {
        //根据课程名称id查出章节列表，但是每个章节缺少课时列表的属性
    	List<Chapter> list=chapterSetvice.findChapterById(id);
        //循环遍历出每一个章节的id
   	list.forEach(c->{
   	    //根据章节id查询出每个章节下的课时
    	 List<Hour>  hours=	hourService.fandByChapterid(c.getId());
    	 //把查出来的课时都设置到的每个课时都设置到各自的章节里
    	 	c.setHour(hours);
    	});
        v.setViewName("detail");
        v.addObject("list",list);
		return v;
    }
    
}
