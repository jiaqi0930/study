package com.itshidu.study.service.impl;


import com.itshidu.study.dao.UserDao;
import com.itshidu.study.entity.User;
import com.itshidu.study.service.UserService;
import com.itshidu.study.util.DigestHelper;
import com.itshidu.study.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.UUID;

import static com.itshidu.study.util.DigestHelper.sha512;

@Service
public class UserServiceImpl implements UserService {
     @Autowired
	 UserDao userDao;
 	@Override
	public Result register(User user) {
       Result map = new Result();
       User username =  userDao.findByUsername(user.getUsername());
       User email =  userDao.findByEmail(user.getEmail());
       if(username!=null) {
    	  
    	   return map.of(100, "用户名已存在");
       }
       if(email!=null) {
     	  
    	   return map.of(101, "邮箱已存在");
       }
        user.setSalt(UUID.randomUUID().toString());
       String password= user.getPassword();
       String salt = user.getSalt();
       String  md5= md5(sha521(password)+md5(salt)+sha521(password+salt));
        user.setAvatar("asd.jpg");
       user.setPassword(md5);
       userDao.save(user);	   
		return map.of(200, "注册成功");
	}
	private String md5(String test) {
		return  DigestHelper.md5(test);
	}
	private String sha521(String test) {
		return  sha512(test);
		
	}
	@Override
	public Result login(String username , String password) {
		
     User user  = userDao.findByUsername(username);
		if(username==null) {
			return Result.of(100, "用户名不存在");
		}
		String s = user.getSalt();
		String md5 =md5(sha521(password)+md5(s)+sha521(password+s));
		  if(md5.equals(user.getPassword())) {
			  HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
				HttpSession session=request.getSession();
				  session.setAttribute("loginInfo",user);
			  System.out.println("------------------------------------"+user.getAge());
				return Result.of(200, "登陆成功");
		  }
		
			return Result.of(100, "密码不正确");
	}

	@Override
	public Result update(User user,String oldPassword) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session=request.getSession();
		User  logUser =	  (User) session.getAttribute("loginInfo");
		User user1=userDao.getOne(logUser.getId());
		String m=oldPassword;
		String s=user1.getSalt();
		String r=md5(sha512(m)+md5(s)+sha512(m+s));
		if(r.equals(user1.getPassword())) {
			user1.setSalt(UUID.randomUUID().toString());
			String m1=user.getPassword();
			String s1=user1.getSalt();
			String r1=md5(sha512(m1)+md5(s1)+sha512(m1+s1));
			user1.setPassword(r1);
			userDao.save(user1);
			request.getSession().invalidate();
			return Result.of(200);

		}else {
			return Result.of(300);
		}


	}

	}








