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

	/*
	 * @Autowired MateFindService service;
	 */
	
	
	/*
	 * @GetMapping("/list") public void list(Criteria cri, Model model) {
	 * 
	 * model.addAttribute("list", service.getList(cri)); //
	 * model.addAttribute("pageMaker", new PageDTO(cri, 123));
	 * 
	 * int total = service.getTotal(cri);
	 * 
	 * 
	 * model.addAttribute("pageMaker", new PageDTO(cri, total));
	 * 
	 * }
	 */
}
