package com.itshidu.study.service.impl;

import com.itshidu.study.dao.VideoDao;
import com.itshidu.study.entity.Course;
import com.itshidu.study.entity.Hour;
import com.itshidu.study.entity.Video;
import com.itshidu.study.service.VideoService;
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
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.UUID;

@Service
public class VideoServiceImpl implements VideoService {
    @Value("${STORE_ROOT_PATH}")
    String StoreRootPath;
    @Autowired
    VideoDao videoDao;


    @Override
    public Object save(String  url, String name, Hour hour  ) {
        String names = UUID.randomUUID().toString() + ".mp4";
        System.out.println(url);
        try {
            String real =  "/store/assets/vidoe/"+names;
            File file = new File(StoreRootPath,real );


         File f2 = file.getParentFile();

            System.out.println(f2);
            if (!f2.exists()) {
                f2.mkdirs();

            }
if (url!=null) {
    FileOutputStream out = new FileOutputStream(file);
    Video video = new Video();
    video.setName(name);
    video.setHour(hour);
    video.setUrl("/store/assets/vidoe/" + url);
    videoDao.save(video);
    return Result.of(200);

}
   return  Result.of(300);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.of(100);


        }
    }
}