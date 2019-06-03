package com.itshidu.study.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.itshidu.study.entity.User;
import com.itshidu.study.service.AccouneService;
import com.itshidu.study.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/account")
public class AccountController {
	@Value("${STORE_ROOT_PATH}")
	String StoreRootPath;
	@Autowired
	AccouneService accountService;

	@RequestMapping(value="/{name}",method=RequestMethod.GET )
	public Object index(@PathVariable String name,HttpServletRequest request) {
		
		
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("loginInfo");
		if(user==null) {
			return "redirect:/login";
		}
		ModelAndView mv= new ModelAndView("account/"+name);
		return mv;
	}
	@ResponseBody
	@RequestMapping(value="/password/change")
	public Object changePassword(String oldPassword,String password) {
		return accountService.updatePassword(oldPassword, password);
	}

	@RequestMapping("/profile/change")
	public Object changeProfile(String nickname , String  phone ,int age  ) {
		 accountService.updateprofile(nickname,phone,age );
		 return "redirect:/account/profile";
	}
	
	@RequestMapping(value="/avatar",method=RequestMethod.POST )
	public Object Updateavatar(int x ,int y ,int width ,int height,String path,HttpServletRequest request) throws IOException {
	   Result r =  accountService.updateAvatar(x, y, width, height, path, request);
		int code=(int) r.get("code");
		if(code==1) {
			 return "redirect:/login";
		}
		if(code==2) {
			 return "redirect:/account/avatar";
		}

		 return "redirect:/1231.html";
	}
      
}
