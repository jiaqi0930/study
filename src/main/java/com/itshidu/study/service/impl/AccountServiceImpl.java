package com.itshidu.study.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.itshidu.study.dao.UserDao;
import com.itshidu.study.entity.User;
import com.itshidu.study.service.AccouneService;
import com.itshidu.study.util.DigestHelper;
import com.itshidu.study.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;


import net.coobird.thumbnailator.Thumbnails;
@Service
public class AccountServiceImpl implements AccouneService {
	@Value("${STORE_ROOT_PATH}")
	String StoreRootPath;
   @Autowired
   UserDao userDao ;
	public Result updatePassword(String oldPassword, String  Password) {
		  HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();		
			HttpSession session=request.getSession();
		User logUser =	  (User) session.getAttribute("loginInfo");
		User user=userDao.getOne(logUser.getId());
		String m=oldPassword;	
		String s=user.getSalt();
		String r=md5(sha512(m)+md5(s)+sha512(m+s));
		if(r.equals(user.getPassword())) {
			user.setSalt(UUID.randomUUID().toString());
			String m1=Password;	
			String s1=user.getSalt();
			String r1=md5(sha512(m1)+md5(s1)+sha512(m1+s1));
			user.setPassword(r1);
			userDao.save(user);
	          request.getSession().invalidate();
			return Result.of(200);
			
		}else {
			return Result.of(300);
		}
		
		
	}
	private String md5(String text) {
		return DigestHelper.md5(text);
	}
	private String sha512(String text) {
		return DigestHelper.sha512(text);
	}
//	@Override
	public Result updateprofile(String nickname , String  phone ,int age ) {
		
		  HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();		
			HttpSession session=request.getSession();
		User  logUser =	  (User) session.getAttribute("loginInfo");
		User user=userDao.getOne(logUser.getId());
	       
		user.setNickname(nickname);
		user.setPhone(phone);
        user.setAge(age);
		userDao.save(user);
		session.setAttribute("loginInfo",user);
		return null;
	}
	@Override
	public Result updateAvatar(int x, int y, int width, int height, String path, HttpServletRequest request) {
		Date date = new Date();
		 String data = "/avatar/"+new SimpleDateFormat("yyyy").format(date)+File.separator
				     +new SimpleDateFormat("MM").format(date)+"/"
				     +new SimpleDateFormat("dd").format(date)+"/"
				     +UUID.randomUUID().toString()+".jpg";

		File temp = new File(StoreRootPath,data);
		File dir = temp.getParentFile();
		if(dir.exists()) {
			dir.mkdirs();
		}

		File file = new File(StoreRootPath,path);

      try {
		Thumbnails.of( file).sourceRegion(x, y, width, height).size(width, height).outputFormat("jpg").toFile(temp);
		  User loginuser =  (User) request.getSession().getAttribute("loginInfo");
		  if(loginuser==null) {
			   return Result.of(1);
		  }
		  User user = userDao.getOne(loginuser.getId());
		  user.setAvatar(data);
		  userDao.save(user);
		  request.getSession().setAttribute("loginInfo",user);
		  System.out.println(request.getSession().getAttribute("loginInfo").toString());
		  return Result.of(2);
	} catch (Exception e) {
		// TODO Auto-generated catch block

		e.printStackTrace();
		return Result.of(3, "异常" );
	}


 		
	}

	
	
	
}
