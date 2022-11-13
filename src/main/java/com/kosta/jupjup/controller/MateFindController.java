package com.kosta.jupjup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosta.jupjup.service.MateFindService;
import com.kosta.jupjup.vo.Criteria; 
import com.kosta.jupjup.vo.PageVO;

@Controller
@RequestMapping("/matefind/*") 
public class MateFindController {

	  @Autowired 
	  MateFindService service;
	  
	  @GetMapping("/list")  
	  public String list(Criteria cri, Model model) {
	   
	  model.addAttribute("list", service.getlist(cri)); 
	  
	  int total = service.getTotal(cri);
	  model.addAttribute("pageMaker", new PageVO(cri, total));
	  
	  return "/mateFind/list";  
	  }
	  
	  @GetMapping({ "/get", "/modify" })
	  public String get(@RequestParam("no") Long no, @ModelAttribute("cri") Criteria cri, Model model) {

	  model.addAttribute("mate", service.get(no));
	  
	  return "/mateFind/get";
	}
	
}
