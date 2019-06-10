package com.itshidu.study.service.impl;

import java.util.List;

import com.itshidu.study.entity.Chapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itshidu.study.dao.HourDao;
import com.itshidu.study.entity.Hour;
import com.itshidu.study.service.HourService;
@Service
public class HourServiceImpl implements HourService{
	@Autowired HourDao hourDao;
	@Override
	public List<Hour> fandByChapterid(Long id) {
		
		return /*hourDao.fandByChapterid(id)*/ null;
	}

}
