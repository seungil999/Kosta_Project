package com.kosta.jupjup.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosta.jupjup.service.UserService;

@Controller

public class UserController {
	@Autowired
	private UserService userService;

	// 회원가입폼
	@RequestMapping("user/joinPage")
	String showJoin() {
		return "/user/joinPage";
	}
	// 로그인폼
	@RequestMapping("user/loginPage")
	String showlogin() {
		return "/user/loginPage";
	}

	@RequestMapping("user/doJoin")
	String doJoin(Model model, @RequestParam Map<String, Object> param) {
		Map<String, Object> rs = userService.Join(param);

		String resultCode = (String) rs.get("resultCode");
		System.out.println(resultCode);
		
		if (resultCode.startsWith("S-")) {
			String redirectUrl = "/user/loginPage";
			
			String rmsg = (String) rs.get("msg");
			System.out.println(rmsg);
			
			model.addAttribute("jsAlertMsg", rs.get("msg"));
			model.addAttribute("jsLocationReplaceUrl", redirectUrl);
			return "redirect";

		} else {
			String rmsg = (String) rs.get("msg");
			System.out.println(rmsg);
			
			model.addAttribute("jsAlertMsg", (String) rs.get("msg"));
			model.addAttribute("jsHistoryBack", true);
			return "redirect";
		}

		

	}
	
	@RequestMapping("user/doLogin")
	String doLogin(HttpSession session, Model model, @RequestParam Map<String, Object> param) {
		Map<String, Object> rs = userService.checkgetLoginAvailable(param);

		String resultCode = (String) rs.get("resultCode");
		String msg = (String) rs.get("msg");
		 if (resultCode.startsWith("S-")) {
			
			 String loginedUserId = (String) rs.get("log");
			 session.setAttribute("loginedUserId", loginedUserId);
			 
			 msg = "로그인 되었습니다.";
			 String redirectUrl = "main";
			 
			 model.addAttribute("jsAlertMsg", msg);
			 model.addAttribute("jsLocationReplaceUrl", redirectUrl);
		 
		 
		 }else {
			 model.addAttribute("jsAlertMsg", msg);
			 model.addAttribute("jsHistoryBack", true);
		 }
		 
		
		return "redirect";

	}

	
}
