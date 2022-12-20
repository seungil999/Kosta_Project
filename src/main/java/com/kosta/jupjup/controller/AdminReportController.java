package com.kosta.jupjup.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.jupjup.paging.Criteria;
import com.kosta.jupjup.service.AdminReportService;
import com.kosta.jupjup.vo.ManagerVO;

@Controller
@RequestMapping("/admin/*")
public class AdminReportController {

	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	AdminReportService adminReportService;
	
	/* 신고 내역 페이지*/
	// 01. 관리자 신고내역 페이지 이동
	@GetMapping("/report/main")
	public String manager() {
		HttpSession session = request.getSession();
		session.getAttribute("ManagerVO");
		
		return "manager/manager_report";
	}
	

	// 01. 페이징, 검색 처리된 출력용
	@GetMapping("/report/list")
	public String searchlist(Criteria cri,Model model) {
		System.out.println("*** 관리자 > 신고 내역 처리 ");
		HttpSession session = request.getSession();
		session.getAttribute("ManagerVO");
		
		int total = adminReportService.countTotal(cri); // 페이징을 위한 검색 후 총 갯수 
		model.addAttribute("total",total); // 검색 카운트용 
		
		model.addAttribute("reportlist",adminReportService.SearchList());
		return "manager/manager_report";

	}
}
