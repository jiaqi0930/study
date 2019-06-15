package com.itshidu.study.controller;
import com.itshidu.study.dao.ChapterDao;
import com.itshidu.study.dao.CourseDao;
import com.itshidu.study.dao.HourDao;
import com.itshidu.study.dao.UserDao;
import com.itshidu.study.entity.*;
import com.itshidu.study.service.CategoryService;
import com.itshidu.study.service.ChapterService;
import com.itshidu.study.service.HourService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CategoryConterller {
    @Value("${STORE_ROOT_PATH}")
    String StoreRootPath;
    @Autowired CategoryService categorySetvice;
    @Autowired ChapterService chapterSetvice;
    @Autowired HourService hourService;
    @Autowired
    ChapterDao chapterDao;
    @Autowired
    CourseDao courseDao;
   @Autowired
    HourDao hourDao;
    @Autowired
    UserDao userDao ;

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
    @RequestMapping("/course/list/{categoryid}")
    public Object findallcourse(ModelAndView v,@PathVariable long categoryid) {
    	List<Course> list=categorySetvice.findAllByCategoryid(categoryid);
        v.setViewName("videolist");
    	v.addObject("list", list);
		return v;
    }
    //根据id查询出课程的简介之类的东西
    @ResponseBody
    @RequestMapping("/course/{course_id}")
    public Object findPriceById(ModelAndView v, @PathVariable long course_id) {

        Course  co=courseDao.findById(course_id).get();
        //根据课程名称id查出章节列表，但是每个章节缺少课时列表的属性
        List<Chapter> mulu=chapterDao.findById(course_id);

        //循环遍历出每一个章节的id
      mulu.forEach(c ->{
            //根据章节id查询出每个章节下的课时
            List<Hour>  hours=	hourDao.fandByChapterid(c.getId());

            //把查出来的课时都设置到的每个课时都设置到各自的章节里
            c.setHour(hours);
        });
        v.setViewName("course");
        v.addObject("course", co);
        v.addObject("mulu",mulu);

      	return v;
    }

}


  /*  //根据课程的id查出章节以及课时
    @ResponseBody
    @RequestMapping("/Chapter/courseid/{id}")
    public Object chaptejkhbsdfjk(ModelAndView  v, @PathVariable Long id) {

        v.setViewName("detail");
        v.addObject("list",mulu);
		return v;
    }*/

