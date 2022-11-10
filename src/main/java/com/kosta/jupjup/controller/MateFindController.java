package com.kosta.jupjup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kosta.jupjup.service.MateFindService;
import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.PageVO;

@Controller
public class MateFindController {

	  @Autowired 
	  MateFindService service;
	  
	 
	  @GetMapping("/list") 
	  public String list(Criteria cri, Model model) {
	  model.addAttribute("list", service.getFlist(cri)); 
	  
	  int total = service.getTotal(cri);
	  model.addAttribute("pageMaker", new PageVO(cri, total));
	  
	  return "/mateFind/list";
	  }
}
