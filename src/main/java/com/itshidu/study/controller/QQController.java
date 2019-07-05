package com.itshidu.study.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.itshidu.study.service.LoginService;
import com.itshidu.study.util.QQUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller
public class QQController {
  @Autowired
    LoginService loginService;

    @RequestMapping("/login/bind/qq/callback")
    public Object qqCallBakc(ModelAndView view, String code, String  state) {
        try {
            loginService.qqlogin(view,code,state);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return  view;
    }
    @RequestMapping("/bind")
    public  Object bind(ModelAndView view){
        view.setViewName("bind");
        return view;
    }
    @ResponseBody
    @RequestMapping("/bind/qq/user")
    public  Object qqbind(String username,String password){
        return   loginService.binduser(username,password);
    }
    @ResponseBody
    @RequestMapping("/bind/qq/create")
    public  Object bindCreate(String username,String password){
        return   loginService.bindcreate(username,password);
    }
}
