package com.itshidu.study.controller;

import com.itshidu.study.dao.ChoiceDao;
import com.itshidu.study.dao.CourseDao;
import com.itshidu.study.dao.UserDao;
import com.itshidu.study.entity.Choice;
import com.itshidu.study.entity.Course;
import com.itshidu.study.entity.User;
import com.itshidu.study.service.UserService;
import com.itshidu.study.util.LoginUtil;
import com.itshidu.study.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Controller
public class UserController {
	@Autowired
	UserService userservice;
	@Autowired
	ChoiceDao choiceDao;
	@Autowired
	UserDao userDao;
	@Autowired
	CourseDao courseDao;
	
	@RequestMapping("/login")
	  public Object login( ) {
		     ModelAndView m = new ModelAndView("login");
		return m;
	}
	@RequestMapping("/register")
	  public Object register( ) {
		     ModelAndView m = new ModelAndView("register");
		return m;
	}

	   @ResponseBody
		 @RequestMapping("/public/register")
		public Object register(User user) {
			 System.out.println( user.getUsername());
			 System.out.println( user.getEmail());
			 System.out.println( user.getPassword());
			Result res = userservice.register(user);
			return res;
			
		}
	
    @ResponseBody
 	 @RequestMapping("/public/login")
 	public Object login(String username ,String password) {
 		return  userservice.login(username,password);
 	}

	@RequestMapping("/public/logout")
	public Object login(HttpServletRequest request ) {
		request.getSession().invalidate();

		return  "redirect:/login";

	}
	@RequestMapping("/user/choice/{course_id}")
	public  Object save (@PathVariable long course_id ){
		Date date = new Date();
//		SimpleDateFormat si  = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
         long a =   date.getTime()/1000;

		User  logUser =	  (User) LoginUtil.get("loginInfo");
		User user=userDao.findById(logUser.getId()).get();
		Course course =courseDao.findById(course_id).get();
		BigDecimal b1 =  new BigDecimal(user.getBalance());

		if(course.getCreatedistime()!=null) {
			long b = course.getCreatedistime().getTime() / 1000;
			long c = course.getOutdistime().getTime() / 1000;
			if (a<b && a >c) {
				BigDecimal b2 = new BigDecimal(course.getPrice());
				user.setBalance(b1.subtract(b2).doubleValue());
			} else {
				BigDecimal b2 = new BigDecimal(course.getDiscount());
				user.setBalance(b1.subtract(b2).doubleValue());
			}
		}else{
			BigDecimal b2 = new BigDecimal(course.getPrice());
			user.setBalance(b1.subtract(b2).doubleValue());
		}

		userDao.save(user);

		Choice choice = new Choice();
		choice.setUser(user);
		choice.setCourse(course);
		choice.setCreated(new Date());
		choiceDao.save(choice);
		return "redirect:/course/{course_id}";
	}
	@ResponseBody
	@RequestMapping("/user/course")
	public Object Course(ModelAndView view) {
	    User user  =(User) 	LoginUtil.get("loginInfo");
		List<Choice> choice = choiceDao.findByUser(user.getId());
		view.setViewName("mycourse");
		view.addObject("choice",choice);
		return  view ;

	}
	@RequestMapping("/mypage")
	public Object mypage( ) {
		ModelAndView m = new ModelAndView("mypage");
		User user =(User) LoginUtil.get("loginInfo");
		User user1 =userDao.findById(user.getId()).get();
		m.addObject("user",user1);
		return m;
	}
	@RequestMapping("/user/course/rights")
	public Object updateRight() {
           User loginUser = (User) LoginUtil.get("loginInfo");
	    User user = userDao.findById(loginUser.getId()).get();
	    user.setRights(true);
	    userDao.save(user);
       LoginUtil.set("loginInfo",user);
		return "redirect:/mypage";
	}
}