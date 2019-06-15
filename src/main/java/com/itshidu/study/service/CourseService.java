package com.itshidu.study.service;

import com.itshidu.study.util.Result;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

public interface CourseService {

    Result uploda(MultipartFile image, HttpSession session,long course_id);
}
