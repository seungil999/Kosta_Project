package com.kosta.jupjup.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		public String kakaoLogin(@RequestParam(value = "code", required = false) String code,HttpSession session,Model model) throws Exception {
			System.out.println("LoginApiController");
			
			String access_Token = loginService.getAccessToken(code);
			UserVO userInfo = loginService.getUserInfo(access_Token);
			
			System.out.println("###access_Token#### : " + access_Token);
			System.out.println(userInfo);
			
			// 아래 코드가 추가되는 내용
		
		
	
			if (userInfo != null) { // 로그인성공
				System.out.println(userInfo.getId());
				session.setAttribute("userVO", userInfo);
				model.addAttribute("userVO",userInfo);
				System.out.println(userInfo);
				return "redirect:/"; // 홈
			} else { // 로그인실패

				return "user/loginPage"; // 다시 로그인페이지
			
			}
		
		}


	@RequestMapping(value="/kakaologout")
	public String logout(HttpSession session) {
		System.out.println("로그아웃");
		loginService.logout((String)session.getAttribute("userVO"));
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value="/kakaounlink")
	public String unlink(HttpSession session) {
		loginService.unlink((String)session.getAttribute("userVO"));
		session.invalidate();
		return "redirect:/";
	}
}
