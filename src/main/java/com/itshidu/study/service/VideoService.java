package com.itshidu.study.service;

import com.itshidu.study.entity.Chapter;
import com.itshidu.study.entity.Hour;
import org.springframework.web.multipart.MultipartFile;

public interface VideoService {

    Object save(MultipartFile video, String name , long chapter_id );
}
