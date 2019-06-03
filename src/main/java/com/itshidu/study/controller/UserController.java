package com.itshidu.study.controller;

import com.itshidu.study.entity.User;
import com.itshidu.study.service.UserService;
import com.itshidu.study.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;


@Controller
public class UserController {
	@Autowired
	UserService userservice;
	
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
}
