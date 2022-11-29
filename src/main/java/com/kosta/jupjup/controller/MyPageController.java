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
	@GetMapping("/schedule")
	public String schedule() { 
		
		return "/mypage/schedule";
	}
	@GetMapping("/finish")
	public String finish() { 
		
		return "/mypage/finish";
	}
	@GetMapping("/diaryList")
	public String diaryList() { 
		
		return "/mypage/diaryList";
	}
	@GetMapping("/likeActivity")
	public String likeActivity() { 
		
		return "/mypage/likeActivity";
	}
	@GetMapping("/likeRecom")
	public String likeRecom() { 
		
		return "/mypage/likeRecom";
	}
	@GetMapping("/mate")
	public String mate() { 
		
		return "/mypage/mate";
	}
	@GetMapping("/free")
	public String free() { 
		
		return "/mypage/free";
	}
	@GetMapping("/review")
	public String review() { 
		
		return "/mypage/likeRecom";
	}
	@GetMapping("/withdraw")
	public String withdraw() { 
		
		return "/mypage/withdraw";
	}
	@GetMapping("/profile")
	public String profile() { 
		
		return "/mypage/profile";
	}
	
}
