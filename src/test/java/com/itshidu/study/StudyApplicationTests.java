package com.itshidu.study;

import com.itshidu.study.dao.CategoryDao;
import com.itshidu.study.dao.CourseDao;
import com.itshidu.study.entity.Category;
import com.itshidu.study.entity.Course;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

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
       int a =0 ;
        for (int i = 1; i <= 100; i++) {
                       a += i;
              }
    }
}
