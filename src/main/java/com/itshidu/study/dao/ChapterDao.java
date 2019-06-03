package com.itshidu.study.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.itshidu.study.entity.Chapter;

public interface ChapterDao extends JpaRepository<Chapter, Long>{
//	//根据课程id查询出所有的章节和章节id
	@Query("from Chapter c where c.course.id=?1")
	List<Chapter> findByCourseid(Long id);


}
