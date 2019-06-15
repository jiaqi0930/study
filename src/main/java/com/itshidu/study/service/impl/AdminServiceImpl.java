package com.itshidu.study.service.impl;

import com.itshidu.study.dao.ChapterDao;
import com.itshidu.study.dao.HourDao;
import com.itshidu.study.entity.Chapter;
import com.itshidu.study.entity.Hour;
import com.itshidu.study.entity.User;
import com.itshidu.study.service.AdminService;
import com.itshidu.study.util.Result;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

@Service
public class AdminServiceImpl implements AdminService {
    @Value("${STORE_ROOT_PATH}")
    String StoreRootPath;

    @Autowired
    HourDao hourDao;

    @Autowired
    ChapterDao chapterDao;
    @Override
    public Object update(  String name, MultipartFile video,long hour_id,long chapter_id) {
        String names = UUID.randomUUID().toString() + ".mp4";
        Chapter chapter = chapterDao.getOne(chapter_id);
        Hour   hour  = new Hour();

        try {
            String real =  "/store/assets/vidoe/"+names;
            File file = new File(StoreRootPath,real );
            File f2 = file.getParentFile();

            if (!f2.exists()) {

                f2.mkdirs();

            }


            FileOutputStream out = new FileOutputStream(file);
            IOUtils.copy(video.getInputStream(), out);
            if (video.isEmpty()){
                hour.setId(hour_id);
                hour.setChapter(chapter);
                hour.setName(name);
                hour.setVideo(null);
                hourDao.save(hour);
                return null;
            }

            hour.setId(hour_id);
            hour.setChapter(chapter);
            hour.setName(name);
            hour.setVideo("/store/assets/vidoe/" + names);
            hourDao.save(hour);
        return null;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.of(100);


        }
    }
}