package com.poly.service.impl;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.poly.service.UploadService;

@Service
public class UploadServiceImpl implements UploadService {

	@Autowired
	ServletContext app;

	@Override
	public File save(MultipartFile file, String folder) {
		File dir = new File(app.getRealPath("/assets/" + folder));
		if (!dir.exists()) {
			dir.mkdirs();
		}

		// Tạo một biến đếm để đảm bảo số cộng dồn
		int count = 0;

		// Tạo một tên duy nhất cho tệp
		String name;
		do {
			String timestamp = String.valueOf(System.currentTimeMillis());
			String originalFilename = file.getOriginalFilename();
			String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
			name = timestamp + "_" + count + extension;
			count++;
		} while (new File(dir, name).exists());

		try {
			File savedFile = new File(dir, name);
			file.transferTo(savedFile);
			System.out.println(savedFile.getAbsolutePath());
			return savedFile;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}


}
