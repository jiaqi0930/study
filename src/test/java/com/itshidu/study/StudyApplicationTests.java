package com.itshidu.study;

import com.itshidu.study.dao.CategoryDao;
import com.itshidu.study.dao.CourseDao;
import com.itshidu.study.entity.Category;
import com.itshidu.study.entity.Course;
import com.itshidu.study.util.HttpClientUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import sun.net.www.http.HttpClient;

import java.util.Date;

@RunWith(SpringRunner.class)
@SpringBootTest
public class StudyApplicationTests {

    @Autowired
    CourseDao courseDao;
    @Autowired
    CategoryDao categoryDao;
    @Test
    public void contextLoads() {
        //https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id=101340964&redirect_uri=http://www.shiduketang.com/login/bind/qq/callback&state=1006
        //Authorization Code = D61FED6C7AACD90FA8FE303278A5B869
        //https://graph.qq.com/oauth2.0/token?grant_type
//        String url = "https://graph.qq.com/oauth2.0/token?grant_type=authorization_code&client_id=101340964&client_secret=92c367a3cec734a0cb2c4fa49e421e04&code=B485218282CEEBE6CB495F0F6A234B46&redirect_uri=http://www.shiduketang.com/login/bind/qq/callback";
//        String text = HttpClientUtil.doGet(url);
//        System.out.println("高作栋"+text);
        String Token = "83D993BF32364C874BC832658D149CA8";
        String openid="3068C91AB991DFBF270AE31A54ABD854";
        String a = "https://graph.qq.com/user/get_user_info?access_token=83D993BF32364C874BC832658D149CA8&oauth_consumer_key=101340964&openid=3068C91AB991DFBF270AE31A54ABD854";
        String b  = HttpClientUtil.doGet(a);
        System.out.println(b);
    }
}
