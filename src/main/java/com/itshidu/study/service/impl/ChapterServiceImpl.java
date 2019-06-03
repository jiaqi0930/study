package com.itshidu.study.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itshidu.study.dao.ChapterDao;
import com.itshidu.study.entity.Chapter;
import com.itshidu.study.service.ChapterService;
@Service
public class ChapterServiceImpl implements ChapterService{
@Autowired ChapterDao chapterDao;

//根据id查询出章节列表里的章节和id
@Override
public List<Chapter> findChapterById(Long id) {

	return  chapterDao.findByCourseid(id);
}




}
