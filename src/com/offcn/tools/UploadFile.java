package com.offcn.tools;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.web.multipart.MultipartFile;

public class UploadFile {
	
	public static String saveHP(MultipartFile photo,String tag) {
		
		String filename = photo.getOriginalFilename();
		
		String filesuffix = filename.substring(filename.lastIndexOf("."), filename.length());
		
		String fileprefix =getFilePreFix();
		
		filename = fileprefix + filesuffix;
		
		String filepath = "D:/upload/ssm/"+tag+"/"+ fileprefix + filesuffix;
		
		try {
			
			photo.transferTo(new File(filepath));
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return filename;
	}
	
	public static String getFilePreFix(){
		
		Calendar c = Calendar.getInstance();
		
		return new SimpleDateFormat("yyyyMMddHHmmss").format(c.getTime());
	}
}
