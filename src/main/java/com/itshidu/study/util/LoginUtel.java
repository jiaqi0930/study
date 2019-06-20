package com.itshidu.study.util;

import com.itshidu.study.dao.UserDao;
import com.itshidu.study.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginUtel {


    /**
     * 把数据存储到session中
     * @param name  存储到session中的对象的变量名
     * @param o 存储的任意数据
     */
    public static void set(String name, Object o) {
        HttpServletRequest request =
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        request.getSession().setAttribute(name, o);
    }

    /**
     * 从session中获取数据
     * @param name 存储到session中的对象的变量名
     */
    public static Object get(String name) {
        HttpServletRequest request =
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request.getSession().getAttribute(name);
    }

}
