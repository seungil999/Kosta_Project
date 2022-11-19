package com.kosta.jupjup.dto;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class UploadResultDTO implements Serializable {

	
	
	private String fileName; //원래 파일값
	private String uuid; //중복을 피하기 위한 값
	private String folderPath;
	public String getImageURL() {
		try {
			return URLEncoder.
					encode(folderPath+"/"+uuid+"_"+fileName,"UTF-8");
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public String getThumbnailURL() {
		try {
			return URLEncoder.encode(folderPath+"/s_"+uuid+"_"+fileName,"UTF-8");
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "";
	}
}
