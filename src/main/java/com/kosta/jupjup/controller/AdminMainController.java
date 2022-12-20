package com.kosta.jupjup.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosta.jupjup.paging.Criteria;
import com.kosta.jupjup.paging.PageVO;
import com.kosta.jupjup.service.AdminMainService;
import com.kosta.jupjup.vo.ManagerVO;
import com.kosta.jupjup.vo.UserVO;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/admin/*")
@Log4j2
public class AdminMainController {

	@Autowired
	HttpServletRequest request;
	
	@Autowired
	AdminMainService adminMainService;
	

	// 02. 관리자 검색 페이지 이동
	@GetMapping("/search/main")
	public String mainSearchPage(Model model) {
		log.info("*** 관리자 회원 검색 페이지 ***");
		HttpSession session = request.getSession();
		session.getAttribute("ManagerVO");
		
		return "/manager/manager_search";
	}
	
	// 03. 전체 회원 보기
	@GetMapping("/main/list")
	public String searchlist(Criteria cri,Model model) {
		log.info("*** 관리자 메인  > 전체 회원 목록***");
		HttpSession session = request.getSession();
		session.getAttribute("ManagerVO");
		
	
		System.out.println(cri.getFilter());
		int total = adminMainService.countTotal(cri);
		model.addAttribute("total",total);  
		model.addAttribute("pageMaker", new PageVO(cri, total));
		model.addAttribute("userlist",adminMainService.allUserList(cri));
		return "/manager/manager_main";
	}
	
	
	// 03. 회원 삭제 
		@ResponseBody
		@PostMapping("/main/list/delete")
		public List<String> deleteUser(@RequestBody List<String> userIdxArray) {
			System.out.println("*** 관리자 메인 > 회원삭제");
			HttpSession session = request.getSession();
			session.getAttribute("ManagerVO");
			
		
			adminMainService.deleteUser(userIdxArray);
			return userIdxArray;
		}
		
		// 04. 회원 추가
		@PostMapping("/main/list/add")
		public String insertUser(@ModelAttribute UserVO userVO) {
			System.out.println("*** 관리자 메인 > 회원추가");
			HttpSession session = request.getSession();
			session.getAttribute("ManagerVO");
			
			adminMainService.insertUser(userVO);
			return "redirect:/admin/main/list";
		}
		
		// 05. 회원 정보 수정
		@PostMapping("/main/list/update")
		public String updateUser(@ModelAttribute UserVO userVO) {
			System.out.println("*** 관리자 메인  > 회원수정");
			HttpSession session = request.getSession();
			session.getAttribute("ManagerVO");
			
		
			adminMainService.updateUser(userVO);
			return "redirect:/admin/main/list";
		}
}
