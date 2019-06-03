package com.itshidu.study.controller;

import com.itshidu.study.entity.User;
import com.itshidu.study.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/public")
public class UpdateController {

    @Autowired
    UserService  UserService;

    @RequestMapping("/update")
    public Object update(User user ,String oldpassword){
        return UserService.update(user,oldpassword);
    }
}
