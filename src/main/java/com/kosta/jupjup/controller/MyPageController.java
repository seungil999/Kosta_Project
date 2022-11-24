package com.kosta.jupjup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/*")
public class MyPageController {
 
	@GetMapping("/activity")
	public String activity() { 
		
		return "/mypage/activity";
	}
	
	
}
