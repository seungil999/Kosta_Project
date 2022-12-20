package com.kosta.jupjup.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.jupjup.service.AdminQuestService;
import com.kosta.jupjup.vo.NoticeVO;
import com.kosta.jupjup.vo.QuestionVO;

@Controller
@RequestMapping("/admin/*")
public class AdminQuestController {

	@Autowired
	HttpServletRequest request;
	
	@Autowired
	AdminQuestService adminQuestService;
	
	// 01. 관리자 공지사항 작성
		@GetMapping("/question/main")
		public String manager() {
			HttpSession session = request.getSession();
			session.getAttribute("ManagerVO");
			
			return "/manager/manager_question";
		}
		
		@PostMapping("/question")
		public String write(QuestionVO qvo) {
			HttpSession session = request.getSession();
			session.getAttribute("ManagerVO");
			
			System.out.println(qvo);
			
			adminQuestService.write(qvo);
			
		return "/manager/manager_question";
		}
}
