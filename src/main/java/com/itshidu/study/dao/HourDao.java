package com.itshidu.study.dao;

import java.util.List;

import com.itshidu.study.entity.Chapter;
import com.itshidu.study.entity.Hour;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface HourDao extends JpaRepository<Hour, Long>{
	@Query("from Hour c where c.chapter.id=?1")
	List<Hour> fandByChapterid(long id);
}
