package com.kosta.jupjup.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosta.jupjup.service.RecommendService;
import com.kosta.jupjup.vo.RecommendVO;
import com.kosta.jupjup.vo.UserVO;

@Controller
public class RecommendController {

	@Autowired
	RecommendService recommendService;
	
	// 메인 페이지 호출
	@GetMapping("/recommend")
	public String main() {
		return "recommend/recommend_main";
	}


	// 추천 목록 등록
	@PostMapping("/recommend/register")
	public String join(@RequestParam("recname") String recname, @RequestParam("simpledesc") String simpledesc,
	         @RequestParam("address") String address, @RequestParam("user_id") String user_id, HttpServletRequest request) {

		HttpSession session = request.getSession();
		UserVO userVo = (UserVO) session.getAttribute("userVO");
		
		System.out.println(userVo.getId());
	
	      RecommendVO rvo = new RecommendVO();
	      rvo.setRecname(recname);
	      rvo.setSimpledesc(simpledesc);
	      rvo.setAddress(address);
	      rvo.setUser_id(user_id);

		recommendService.recommendInsert(rvo);
		return "redirect:/recommend";

	}
	
		

}
