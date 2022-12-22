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
import com.kosta.jupjup.service.AdminSearchService;
import com.kosta.jupjup.vo.ManagerVO;
import com.kosta.jupjup.vo.UserVO;
@Controller
@RequestMapping("/admin/*")
public class AdminSearchController {

	@Autowired
	HttpServletRequest request;
	
	@Autowired
	AdminSearchService adminSearchService;

	// 01. 페이징, 검색 처리된 출력용
	@GetMapping("/search/list")
	public String searchlist(Criteria cri,Model model) {
		System.out.println("*** 관리자 > 회원검색");	
		HttpSession session = request.getSession();
		session.getAttribute("ManagerVO");
		
		
		int total = adminSearchService.countTotal(cri); // 페이징을 위한 검색 후 총 갯수 
		model.addAttribute("total",total); // 검색 카운트용 
		
		model.addAttribute("pageMaker", new PageVO(cri, total));
		model.addAttribute("userlist",adminSearchService.SearchList(cri));
		return "/manager/manager_search";
	}
	
	// 02. 회원 추가
	@PostMapping("/search/list/add")
	public String insertUser(@ModelAttribute UserVO userVO) {
		System.out.println("*** 관리자 > 회원검색 > 회원추가");
		HttpSession session = request.getSession();
		session.getAttribute("ManagerVO");
		
		
		System.out.println(userVO.toString());
		adminSearchService.insertUser(userVO);
		return "redirect:/admin/search/list";

	}
	
	// 03. 회원 삭제 
	@ResponseBody
	@PostMapping("/search/list/delete")
	public List<String> deleteUser(@RequestBody List<String> userIdxArray) {
		System.out.println("*** 관리자 > 회원검색 > 회원삭제");
		HttpSession session = request.getSession();
		session.getAttribute("ManagerVO");
		
		System.out.println(userIdxArray.get(0));
		adminSearchService.deleteUser(userIdxArray);
		return userIdxArray;
	}

	// 04. 회원 정보 수정
	@PostMapping("/search/list/update")
	public String updateUser(@ModelAttribute UserVO userVO) {
		System.out.println("*** 관리자 > 회원검색 > 회원수정");
		HttpSession session = request.getSession();
		session.getAttribute("ManagerVO");
		System.out.println(userVO);
		adminSearchService.updateUser(userVO);
		return "redirect:/admin/search/list";
	}
}
