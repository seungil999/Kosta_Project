package com.kosta.jupjup.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.jupjup.service.ServiceCenterService;
import com.kosta.jupjup.vo.Filter;
import com.kosta.jupjup.vo.NoticeVO;

@Controller
@RequestMapping("/ServiceCenter/*")
public class ServiceCenterControlloer {
	
	@Autowired
	ServiceCenterService SCservice;
	
	@GetMapping("/")
	public String main(Model model,Filter filter) {
	model.addAttribute("list", SCservice.getallList(filter.getFilter()));
		  
	return "/ServiceCenter/SCmain";
	
	}
	
	@GetMapping("/notice")
	public String notice(Model model) {
		model.addAttribute("list", SCservice.getnoticeList());
	return "/ServiceCenter/notice";
	}
	
	@GetMapping("/notice/detail")
	public ModelAndView noticedetail(@RequestParam("no") Long no, HttpServletResponse response) {
		  ModelAndView mav = new ModelAndView("/ServiceCenter/noticedetail");
		  try {
			  NoticeVO noticeVO = SCservice.getnoticedetail(no);
			  mav.addObject("noticeVO", noticeVO);
		  }catch(Exception e) {
			  e.printStackTrace();
		  }
		  return mav;
	}
	//write 테스트폼
	@GetMapping("/notice/writeform")
	public String writeform() {
	return "/ServiceCenter/writeform";
	}
	
	//write 테스트
	@PostMapping("/notice/write")
	public ModelAndView write(@ModelAttribute NoticeVO noticeVO) {
		ModelAndView mav = new ModelAndView();
		try {
			SCservice.write(noticeVO);
			mav.setViewName("redirecet:/notice");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
}
