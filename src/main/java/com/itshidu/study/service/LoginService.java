package com.itshidu.study.service;

import com.itshidu.study.util.Result;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

public interface LoginService {
    void qqlogin(ModelAndView view, String code, String state) throws Exception;

    Result binduser(String username, String password);

    Result bindcreate(String username, String password);
}
