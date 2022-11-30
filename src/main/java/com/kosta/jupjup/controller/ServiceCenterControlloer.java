package com.kosta.jupjup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.jupjup.service.ServiceCenterService;

@Controller
@RequestMapping("/ServiceCenter/*")
public class ServiceCenterControlloer {
	
	@Autowired
	ServiceCenterService SCservice;
	
	@GetMapping("/")
	public String main(Model model) {
		  model.addAttribute("list", SCservice.getallList()); 
		  
	return "/ServiceCenter/SCmain";
	}
	
	@GetMapping("/notice")
	public String notice() {
		
	return "/ServiceCenter/notice";
	}
	
	
}
