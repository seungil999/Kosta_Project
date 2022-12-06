package com.kosta.jupjup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.jupjup.service.ServiceCenterService;
import com.kosta.jupjup.vo.Filter;

@Controller
@RequestMapping("/ServiceCenter/*")
public class ServiceCenterControlloer {
	
	@Autowired
	ServiceCenterService SCservice;
	
	@GetMapping("/")
	public String main(Model model,Filter filter) {
	System.out.println(filter);
	model.addAttribute("list", SCservice.getallList(filter.getFilter()));
		  
	return "/ServiceCenter/SCmain";
	
	}
	
	
	
	
	
	@GetMapping("/notice")
	public String notice(Model model) {
		model.addAttribute("list", SCservice.getnoticeList());
	return "/ServiceCenter/notice";
	}
	
	
}
