package com.itshidu.study.service;

import org.springframework.web.multipart.MultipartFile;

public interface AdminService {
    Object update(  String name , MultipartFile video,long hour_id,long chapter_id);
}
