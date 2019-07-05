package com.itshidu.study.service.impl;

import com.fasterxml.jackson.databind.JsonNode;
import com.itshidu.study.dao.UserDao;
import com.itshidu.study.entity.User;
import com.itshidu.study.service.LoginService;
import com.itshidu.study.util.DigestHelper;
import com.itshidu.study.util.LoginUtil;
import com.itshidu.study.util.QQUtil;
import com.itshidu.study.util.Result;
import org.hibernate.event.spi.SaveOrUpdateEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.UUID;

import static com.itshidu.study.util.DigestHelper.md5;
import static com.itshidu.study.util.DigestHelper.sha512;

@Service
public class LoginServiceImpl implements LoginService {
  @Autowired
    UserDao userDao;
    @Override
    public void qqlogin(ModelAndView view, String code, String state) throws Exception {

        String token = QQUtil.getAccessToKen(code);
        String  openid = QQUtil.getOpenID(token);
       JsonNode node = QQUtil.getUserInfo(openid,token);
        System.out.println(node);
       User user = userDao.findByQqOpenid(openid);
       if (user==null){//新用户
           LoginUtil.set("openId",openid);
           LoginUtil.set("qqInfo",node);
           view.setViewName("redirect:/bind");
           return;
       }else {//老用户
           LoginUtil.set("loginInfo",user);
           view.setViewName("redirect:/index");
           return;
       }








//        System.out.println(openid);
//        JsonNode user = QQUtil.getUserInfo(openid,token);
    }

    @Override
    public Result binduser(String username, String password) {
        HttpSession session = LoginUtil.getsession();
        JsonNode qqInfo = (JsonNode) session.getAttribute("qqInfo");
        String openid = (String) session.getAttribute("openId");
         if (qqInfo == null){
             return Result.of(0,"QQ登录信息不存在");
         }
          if (username == ""){
              return Result.of(4, "账号为空");

          }
        User user  = userDao.findByUsername(username);

        if(user==null) {
            return Result.of(1, "账号不存在");
        }
        if(password ==""){
            return Result.of(5, "密码为空");
        }
        String s = user.getSalt();
        String md5 =md5(sha521(password)+md5(s)+sha521(password+s));

        if(md5.equals(user.getPassword())) {

            user.setQqOpenid(openid);
            userDao.save(user);

           LoginUtil.set("loginInfo",user);

            return Result.of(2, "成功绑定QQ");
        }

        return Result.of(3,"绑定失败，密码不正确");
    }

    @Override
    public Result bindcreate(String username, String password) {
        HttpSession session = LoginUtil.getsession();
        JsonNode qqInfo = (JsonNode) session.getAttribute("qqInfo");

        String openid = (String) session.getAttribute("openId");

        if (qqInfo == null){
            return Result.of(0,"QQ登录信息不存在");
        }
        User t  = userDao.findByUsername(username);
        if (t != null){
            return Result.of(1, "用户名已存在 ，");
        }
        User user = new User();

        user.setAvatar(qqInfo.get("figureurl_qq_1").asText());
        user.setNickname(qqInfo.get("nickname").asText());
        user.setUsername(username);
        user.setQqOpenid(openid);
        user.setSalt(UUID.randomUUID().toString());
        String m1=password;
        String s1=user.getSalt();
        String r1=md5(sha512(m1)+md5(s1)+sha512(m1+s1));
        user.setPassword(r1);
        userDao.save(user);
        LoginUtil.set("loginInfo",user);

        return Result.of(200, "创建成功 ");
    }

    private String md5(String test) {
        return  DigestHelper.md5(test);
    }
    private String sha521(String test) {
        return  sha512(test);

    }
}
