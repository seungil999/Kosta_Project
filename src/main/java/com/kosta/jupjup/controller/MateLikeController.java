package com.kosta.jupjup.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kosta.jupjup.service.MateLikeService;
import com.kosta.jupjup.vo.MateLikeVO;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/like/")
public class MateLikeController {
	
	@Autowired
	MateLikeService service;
	
	@PutMapping("/likeUpdate")
	public Map<String,String> likeupdate(@RequestBody MateLikeVO vo){
		
		
		Map<String,String> map = new HashMap<String, String>();
		
		try {
			service.likeUpdate(vo);
			service.likeCntUpdate(vo);
			map.put("result", "success");
			
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		
		return map;
	}
}
