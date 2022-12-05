package com.kosta.jupjup.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kosta.jupjup.service.ReviewLikeService;
import com.kosta.jupjup.vo.MateLikeVO;
import com.kosta.jupjup.vo.UserVO;

@RestController
@RequestMapping("/reviewLike/")
public class ReviewLikeController {
	@Autowired
	HttpServletRequest request;
	@Autowired
	ReviewLikeService service;
	
	@PutMapping("/likeUpdate")
	public Map<String,String> likeupdate(@RequestBody MateLikeVO vo){
		HttpSession session = request.getSession();
		UserVO uservo = (UserVO) session.getAttribute("userVO");
		
		Map<String,String> map = new HashMap<String, String>();
		
		try {
			Integer check = service.likeCount(vo);
			if(uservo==null) {
				map.put("result", "login");
				return map;
			}else if(check==0) {
				service.likeInsert(vo);
				service.likeCntUpdate(vo);
				map.put("result", "success");
			}else {
				service.likeUpdate(vo);
				service.likeCntUpdate(vo);
				map.put("result", "success");
			} 
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		
		return map;
	}
}
