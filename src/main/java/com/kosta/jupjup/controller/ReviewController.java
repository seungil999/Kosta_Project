package com.kosta.jupjup.controller;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.jupjup.service.MateFindService;
import com.kosta.jupjup.service.MateJoinService;
import com.kosta.jupjup.service.MateLikeService;
import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.PageVO;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
 
	@GetMapping("/list")
	public String ReviewList () {
		
		return "/review/list";
	}
	
	  
}
