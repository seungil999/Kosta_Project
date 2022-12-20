package com.kosta.jupjup.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.jupjup.service.AdminWriteService;
import com.kosta.jupjup.vo.ManagerVO;
import com.kosta.jupjup.vo.NoticeVO;

@Controller
@RequestMapping("/admin/*")
public class AdminWriteController {

	@Autowired
	HttpServletRequest request;
	
	@Autowired
	AdminWriteService adminWriteService;
	
	// 01. 관리자 공지사항 작성
	@GetMapping("/write/main")
	public String manager() {
		HttpSession session = request.getSession();
		session.getAttribute("ManagerVO");
		
		return "manager/manager_write";
	}
	
	@PostMapping("/write")
	public String write(NoticeVO noticeVO) {
		HttpSession session = request.getSession();
		session.getAttribute("ManagerVO");
		adminWriteService.write(noticeVO);
		
	return "/manager/manager_write";
	}
	
	
}
