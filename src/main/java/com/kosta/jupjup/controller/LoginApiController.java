package com.kosta.jupjup.controller;


import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosta.jupjup.service.LoginService;
import com.kosta.jupjup.vo.UserVO;

@Controller
@RequestMapping("/user/*")
public class LoginApiController {

	@Autowired
	private LoginService loginService;
	
		// login 페이지에서 code값 받아옴
		@RequestMapping(value="/kakao", method=RequestMethod.GET)
		public String kakaoLogin(HttpSession session,@RequestParam(value = "code", required = false) String code) throws Exception {
			
			String access_Token = loginService.getAccessToken(code);
			UserVO userInfo = loginService.getUserInfo(access_Token);
			
			System.out.println("###access_Token#### : " + access_Token);
			
			// 아래 코드가 추가되는 내용
			session.invalidate();
			
			System.out.println(userInfo.getEmail());
			session.setAttribute("kakaoN", userInfo.getEmail());
			
			return "main";
	    	}
    	}


