package com.kosta.jupjup.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosta.jupjup.service.MateCreateService;
import com.kosta.jupjup.vo.MateCreateVO;


@Controller
@RequestMapping("/Mate/*")
public class MateCreateController {
	
	@Autowired
	ServletContext servletontext;
	@Autowired
	MateCreateService matecreateservice;
	
	@GetMapping("/MateCreateMain")
	
	public String MateCreateMaingmain () {
		return "/MateCreate/MateCreateMain";
	}
	
	@GetMapping("/Flashgathering")
	public String Flashgatheringmain () {
		return "/MateCreate/FlashgatheringMain";
	}
	
	@GetMapping("/Regularmeeting")
	public String Regularmeetingmain () {
		return "/MateCreate/RegularmeetingMain";
	}
	
	
	@PostMapping("/matecreate")
	public String matecreate(Model model, @ModelAttribute MateCreateVO matecreate) {
		System.out.println(matecreate.getPeoplemaxnum());
		model.addAttribute("matecreate", matecreate);
		System.out.println(matecreate);
		if(matecreate.getImage().isEmpty() ) {
			matecreate.setImage("기본이미지");
		}
		return "/MateCreate/MateCreateMain";
	}
}
