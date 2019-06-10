package com.itshidu.study.service;

import com.itshidu.study.entity.Hour;
import com.itshidu.study.entity.Video;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

public interface VideoService {

    Object save(String url, String name , Hour hour);

}
