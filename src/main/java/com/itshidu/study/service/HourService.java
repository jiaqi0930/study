package com.itshidu.study.service;

import java.util.List;

import com.itshidu.study.entity.Chapter;
import com.itshidu.study.entity.Hour;

public interface HourService {

	List<Hour> fandByChapterid(Long id);

}
