package com.itshidu.study.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itshidu.study.util.FileDownload;
import com.itshidu.study.util.Result;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import net.coobird.thumbnailator.Thumbnails;
@Controller
public class UploadController {
	@Value("${STORE_ROOT_PATH}")
	String StoreRootPath;
	
/* 	@ResponseBody
	@RequestMapping("/post/upload")
	public Object uploadpost(int size, MultipartFile file ,HttpServletRequest request) {
 		System.out.println(StoreRootPath);
 		System.out.println(file.getSize());
 		System.out.println();
 		
		try {
			BufferedImage bi = ImageIO.read(file.getInputStream());
		int w=bi.getWidth();
		int h=bi.getHeight();
		int max=Math.max(w, h);
		int tow=w;
		int toh=h;
		if(max>size) {
			if(w>h) {
				tow=size;
				toh=h*size/w;
			}else {
				tow=w*size/h;
				toh=size;
			}
		}
		String  filename= "/stro/temp/"+UUID.randomUUID().toString()+".jpg";
	File temp = new File(StoreRootPath,filename);

	File Stor = temp.getParentFile();
		if(!Stor.exists()) {
			Stor.mkdirs();
		}
		Thumbnails.of(file.getInputStream()).size(tow,toh).outputFormat("jpg").toFile( temp );
				
		return Result.of(1, "上传成功", filename);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Result.of(100, "上传失败");
	}
	@ResponseBody
	@RequestMapping("/stro/temp/{filename:.+}")
	public Object upload(@PathVariable String filename , HttpServletRequest request,HttpServletResponse response) {
		File file = new File(StoreRootPath,"stro/temp/"+filename);
		
		try {
			FileDownload.forward(request, response, file);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return  null;  
	}    */
	
	@ResponseBody
	@RequestMapping("/store/**")
	public Object avatar(HttpServletRequest request,HttpServletResponse response) {
		File file =new File(StoreRootPath,request.getServletPath());		
		try {
			
			FileDownload.forward(request,response,file);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}   
		return null;
		
		
		
		
		
		
		
		
		
	}
  
	
}
