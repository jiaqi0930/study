package com.itshidu.study.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.itshidu.study.util.Result;
import org.springframework.web.multipart.MultipartFile;


public interface AccouneService {

	Result updatePassword(String oldPassword, String newPassword);

	Result updateprofile(String nickname, String phone, int age);

// 	Result updateAvatar(int x, int y, int width, int height, String path, HttpServletRequest request);
 	Result updateAvatar(MultipartFile image );

	
}
