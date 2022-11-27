package com.kosta.jupjup.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kosta.jupjup.service.ReviewLikeService;
import com.kosta.jupjup.vo.MateLikeVO;

@RestController
@RequestMapping("/reviewLike/")
public class ReviewLikeController {
	
	@Autowired
	ReviewLikeService service;
	
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
