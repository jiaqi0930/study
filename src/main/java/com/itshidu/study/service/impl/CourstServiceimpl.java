package com.itshidu.study.service.impl;

import com.itshidu.study.dao.CourseDao;
import com.itshidu.study.entity.Course;
import com.itshidu.study.service.CourseService;
import com.itshidu.study.util.Result;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

@Service
public class CourstServiceimpl implements CourseService {
    @Value("${STORE_ROOT_PATH}")
    String StoreRootPath;
    @Autowired
    CourseDao courseDao;
    @Override
    public Result uploda(MultipartFile image, HttpSession session) {
        String name = UUID.randomUUID().toString()+".jpg";
        System.out.println(name);
        try {
            String real ="/store/assets/upload/"+name;
            File file = new File(StoreRootPath,real);
            File f2 = file.getParentFile();
            if (!f2.exists()){
                f2.mkdirs();
            }
            FileOutputStream out = new FileOutputStream(file);
            IOUtils.copy(image.getInputStream(), out);

            Course loginUser=(Course) session.getAttribute("Courseinfo");
            Course course = courseDao.findById(loginUser.getId()).get();


            course.setAvatar("/store/assets/upload/"+name);
            courseDao.save(course);
            return Result.of(0, "图片上传成功");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.of(1, "上传失败");
    }
}
