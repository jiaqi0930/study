package com.itshidu.study.service.impl;

import com.itshidu.study.dao.ChapterDao;
import com.itshidu.study.dao.CourseDao;
import com.itshidu.study.dao.HourDao;
import com.itshidu.study.entity.Chapter;
import com.itshidu.study.entity.Course;
import com.itshidu.study.entity.Hour;
import com.itshidu.study.service.VideoService;
import com.itshidu.study.util.Result;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

@Service
public class VideoServiceImpl implements VideoService {
    @Value("${STORE_ROOT_PATH}")
    String StoreRootPath;
    @Autowired
    HourDao hourDao;
    @Autowired
    ChapterDao chapterDao;

    @Override
    public Object save(MultipartFile  video, String name, long  chapter_id ) {
        String names = UUID.randomUUID().toString() + ".mp4";
        Chapter chapter = chapterDao.getOne(chapter_id);
        Hour hour = new Hour();

        try {
            String real =  "/store/assets/vidoe/"+names;
            File file = new File(StoreRootPath,real );
            File f2 = file.getParentFile();

            System.out.println(f2);
            if (!f2.exists()) {
                f2.mkdirs();

            }
    FileOutputStream out = new FileOutputStream(file);
      IOUtils.copy(video.getInputStream(), out);
            if (video.isEmpty()){
                hour.setVideo(null);
            }else {
                hour.setVideo("/store/assets/vidoe/" + names);
            }
            if ( name.isEmpty()){
                hour.setName("未命名");
            }else {
                hour.setName(name);
            }
   hour.setChapter(chapter);
    hourDao.save(hour);
   return null;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.of(100);


        }
    }
}