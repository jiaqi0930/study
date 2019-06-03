package com.itshidu.study.service;

import java.util.List;

import com.itshidu.study.entity.Chapter;

public interface ChapterService {

	List<Chapter> findChapterById(Long id);

}
