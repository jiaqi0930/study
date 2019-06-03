package com.itshidu.study.dao;

import java.awt.print.Pageable;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.itshidu.study.entity.Course;

public interface CourseDao extends JpaRepository<Course, Long>{
	@Query("from Course c where c.category.id=?1")
	List<Course> findAllByCategoryid(Long id);
	
	@Query("from Course c where c.id=?1")
	List<Course> findpriceById(Long id);


}
