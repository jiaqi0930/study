package com.itshidu.study.service;

import com.itshidu.study.entity.User;
import com.itshidu.study.util.Result;


public interface UserService {

	Result register(User user);

	Result login(String username, String password);

    Result update(User user, String oldpassword);
}
