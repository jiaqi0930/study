package com.itshidu.study.service.impl;

import java.util.List;

import com.itshidu.study.dao.CourseDao;
import com.itshidu.study.entity.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itshidu.study.dao.ChapterDao;
import com.itshidu.study.entity.Chapter;
import com.itshidu.study.service.ChapterService;
@Service
public class ChapterServiceImpl implements ChapterService{
@Autowired ChapterDao chapterDao;
@Autowired
	CourseDao courseDao;
//根据id查询出章节列表里的章节和id
@Override
public List<Chapter> findChapterById(Long id) {

	return  /*chapterDao.findByCourseid(id)*/ null;
}

	@Override
	public Object save(String name, long course_id) {
	 Course course = courseDao.getOne(course_id);
	 Chapter chapter = new Chapter();
	 chapter.setCourse(course);
	 chapter.setChapname(name);
     chapterDao.save(chapter);
		return null;
	}


}
