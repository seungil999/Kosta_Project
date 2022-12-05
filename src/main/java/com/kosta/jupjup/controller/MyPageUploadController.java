package com.kosta.jupjup.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kosta.jupjup.dto.UploadResultDTO;

import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnailator;

@Log4j2
@Controller
@RequestMapping("/mypage/*")
public class MyPageUploadController {

	@Value("C:\\upload")
	private String uploadPath;
	
	@PostMapping("/uploadAjax")
	public ResponseEntity<List<UploadResultDTO>> uploadFile(MultipartFile[] uploadFiles) {
		System.out.println(uploadPath);
		List<UploadResultDTO> resultDTOList = new ArrayList<>();
		
		for (MultipartFile uploadFile: uploadFiles) {
			
			if(uploadFile.getContentType().startsWith("image") == false) {
				log.warn("이미지 파일을 업로드 해주세요.");
				return new ResponseEntity<>(HttpStatus.FORBIDDEN);
			}
			String originalName = uploadFile.getOriginalFilename();
			String fileName = originalName.substring(originalName.lastIndexOf("\\")+1);
			
			log.info("fileName: " + fileName);
			
			String folderPath = makeFolder();
			
			String uuid = UUID.randomUUID().toString();
			
			String saveName = uploadPath + File.separator + folderPath + File.separator + uuid + "_" + fileName;
			
			Path savePath = Paths.get(saveName);
			
			try {
				uploadFile.transferTo(savePath);
				
				String thumbnailSaveName =uploadPath + File.separator + folderPath + File.separator+"s_"+uuid+"_" +fileName;
				File thumbnailFile = new File(thumbnailSaveName);
				Thumbnailator.createThumbnail(savePath.toFile(), thumbnailFile,200,200);//픽셀단위 int width=,int height=
				resultDTOList.add(new UploadResultDTO(fileName,uuid,folderPath));
			} catch(IOException e) {
				e.printStackTrace();
			}
			
		}
		return new ResponseEntity<>(resultDTOList, HttpStatus.OK);
	}


	private String makeFolder() {
		
		String str = LocalDate.now().format(DateTimeFormatter.ofPattern("YYYYMMdd"));
		
		String folderPath = str.replace("/", File.separator);
		
		File uploadPathFolder = new File(uploadPath, folderPath);
		
		if(uploadPathFolder.exists() == false ) {
			uploadPathFolder.mkdir();
		}
		return folderPath;
	}
	
	
	
}
