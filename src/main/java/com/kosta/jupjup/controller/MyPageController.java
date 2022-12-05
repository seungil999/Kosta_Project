package com.kosta.jupjup.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.jupjup.service.MyPageService;
import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.MateJoinVO;
import com.kosta.jupjup.vo.MateVO;
import com.kosta.jupjup.vo.PageVO;
import com.kosta.jupjup.vo.UserVO;

@Controller
@RequestMapping("/mypage/*")
public class MyPageController {
	@Autowired
	HttpServletRequest request;
	@Autowired
	MyPageService service;
	
	@GetMapping("/activity")
	public String activity(Model model) { 
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("userVO");

		model.addAttribute("mate",service.getMate(vo.getId()));
		model.addAttribute("emate",service.endMate(vo.getId()));
		
		return "/mypage/activity";
	}
	@GetMapping("/schedule")
	public String schedule(Model model,Criteria cri) {
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("userVO");
		
		
		  model.addAttribute("list", service.getMateList(cri,vo.getId())); 
		
		return "/mypage/schedule";
	}
	
	
	@GetMapping("/finish")
	public String finish(Model model,Criteria cri) { 
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("userVO");
		int total = service.getEndActivityTotal(vo.getId());
		model.addAttribute("list", service.getlist(cri,vo.getId())); 
		model.addAttribute("pageMaker", new PageVO(cri, total));
		  
		
		
		return "/mypage/finish";
	}
	@GetMapping("/diaryList")
	public String diaryList() { 
		
		return "/mypage/diaryList";
	}
	@GetMapping("/likeActivity")
	public String likeActivity(Model model,Criteria cri) { 
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("userVO");
		
		model.addAttribute("list", service.getLikeActivity(cri,vo.getId())); 
		
		int total = service.getLikeActivityTotal(vo.getId());
		model.addAttribute("pageMaker", new PageVO(cri, total));
		return "/mypage/likeActivity";
	}
	@GetMapping("/likeReview")
	public String likeReview(Model model,Criteria cri) { 
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("userVO");
		  
		model.addAttribute("list", service.getLikeReivew(cri,vo.getId())); 
		  
		  
		int total = service.getLikeReviewTotal(vo.getId());
		model.addAttribute("pageMaker", new PageVO(cri, total));
		
		return "/mypage/likeReview";
	}
	@GetMapping("/likeRecom")
	public String likeRecom() { 
		
		return "/mypage/likeRecom";
	}
	
	@GetMapping("/mate")
	public String mate(Criteria cri, Model model) {
	      HttpSession session = request.getSession();
		  UserVO vo = (UserVO) session.getAttribute("userVO");
		  
		  model.addAttribute("list", service.getMateList(cri,vo.getId())); 
		  
		  
		  int total = service.getMateTotal(vo.getId());
		  model.addAttribute("pageMaker", new PageVO(cri, total));
		  
		  return "/mypage/mate";  
		  }
	@GetMapping("/free")
	public String free() { 
		
		return "/mypage/free";
	}
	@GetMapping("/review")
	public String review(Criteria cri, Model model) {
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("userVO");
		  
		model.addAttribute("list", service.getReviewList(cri,vo.getId())); 
		  
		  
		int total = service.getReviewTotal(vo.getId());
		model.addAttribute("pageMaker", new PageVO(cri, total));
		return "/mypage/review";
	}
	@GetMapping("/withdraw")
	public String withdraw() { 
		
		return "/mypage/withdraw";
	}
	@PostMapping("/withdraw")
	public String UserWithdraw() {
	HttpSession session = request.getSession();
	UserVO vo = (UserVO) session.getAttribute("userVO");
	
	service.withdraw(vo.getId());
	service.deleteMate(vo.getId());
	service.deleteReview(vo.getId());
	session.invalidate();
	return "redirect:/";
	}
	@GetMapping("/profile")
	public String profile() { 
		
		return "/mypage/profile";
	}
	
	@PostMapping("/profileUpdate")
	public String profileUpdate(@ModelAttribute UserVO vo, HttpSession session) {
		System.out.println(vo);
		
		int update = service.userUpdate(vo);
		System.out.println(update);
		session.setAttribute("userVO", vo);
		return "/mypage/profile";
	}
	
	@GetMapping("/getProfile")
	public String getProfile(String id,Model model) {
		model.addAttribute("user",service.getProfile(id));
		
		return "/mypage/getProfile";
	}
	
}
