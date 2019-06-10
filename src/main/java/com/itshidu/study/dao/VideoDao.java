package com.itshidu.study.dao;

import com.itshidu.study.entity.Video;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VideoDao extends JpaRepository<Video,Long> {
}
