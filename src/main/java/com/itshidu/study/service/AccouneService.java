package com.itshidu.study.service;

import javax.servlet.http.HttpServletRequest;

import com.itshidu.study.util.Result;


public interface AccouneService {

	Result updatePassword(String oldPassword, String newPassword);

	Result updateprofile(String nickname, String phone, int age);

 	Result updateAvatar(int x, int y, int width, int height, String path, HttpServletRequest request);

	
}
