package com.kosta.jupjup.controller;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kosta.jupjup.service.MateFindService;
import com.kosta.jupjup.service.MateJoinService;
import com.kosta.jupjup.service.MateLikeService;
import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.PageVO;

@Controller 
public class MainController {
 
	 @Autowired 
	  MateFindService service;
	  @Autowired
	  MateLikeService LikeService;
	  @Autowired
	  MateJoinService JoinService;
	  @Autowired
	  ServletContext servletcontext;
	  
	  @GetMapping("/")  
	  public String list(Criteria cri, Model model) {
	  LocalTime now = LocalTime.now();
	  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HHmm");
	  String formatedNow = now.format(formatter);
	  int getTime = Integer.parseInt(formatedNow);
	  cri.setCurrenttime(getTime);
		  
	  Criteria criteria = new Criteria();
	  
	  model.addAttribute("list", service.getBestlist(cri)); 
	  
	  if("".equals(cri.getMeeting())||cri.getMeeting()==null){
		  model.addAttribute("active", "all");  
	  }else if(cri.getMeeting().equals("0")){
		  model.addAttribute("active", "flash");
	  }else if(cri.getMeeting().equals("1")) {
		  model.addAttribute("active", "regular");
	  }
	  
	  int total = service.getTotal(cri);
	  model.addAttribute("pageMaker", new PageVO(cri, total));
	  
	  return "/main";  
	  }
	
	  
}
