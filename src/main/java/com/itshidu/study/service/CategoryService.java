package com.itshidu.study.service;

import com.itshidu.study.entity.Category;
import com.itshidu.study.entity.Course;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CategoryService {


//    Result save(long parentid ,String name);
	
    List<Category> findall();

    List<Course> findAllByCategoryid(long id);

    List<Course> findpriceById(long id);
    //添加课程
    Object save(Course course);
}











