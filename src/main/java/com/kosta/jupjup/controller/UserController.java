package com.kosta.jupjup.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.jupjup.service.UserService;
import com.kosta.jupjup.vo.MateLikeVO;
import com.kosta.jupjup.vo.UserVO;

@Controller
@RequestMapping("user/*")
public class UserController {
	@Autowired
	private UserService userService;

	//가입화면
	@RequestMapping("/joinPage")
	public void userjoin(){
	}
	
	//중복처리메서드
	@ResponseBody
	@PostMapping(value = "/idCheck")
	public int idCheck(@RequestBody String id) {
		System.out.println(id);

	//중복체크 함수
	int result = userService.idCheck(id);
	System.out.println(result);
	return result;
	}
	
   //가입요청
	@RequestMapping(value = "/joinPage",method = RequestMethod.POST)
    public String JoinForm (UserVO vo, RedirectAttributes RA) {
		System.out.println(vo.toString());
		int result = userService.join(vo);
		if(result == 1){ //가입성공
			RA.addFlashAttribute("msg","가입을 축하합니다.");
		}else {//가입실패
			RA.addFlashAttribute("msg","가입실패. 다시 시도하세요");
			
		}
	   return "redirect:/user/loginPage";
	}
    //로그인화면 
	@RequestMapping(value = "/loginPage")
	 public void userLogin() {

	} 
	
	//로그인 요청 
	@RequestMapping (value = "/loginPage", method = RequestMethod.POST)
	public String loginForm(UserVO vo , HttpSession session, Model model) {
		
		//로그인처리
		UserVO userVO = userService.login(vo);
		System.out.println(userVO);
		
		if (userVO != null) { //로그인성공
			session.setAttribute("userVO", userVO); //회원정보저장
			return "redirect:/"; //홈
		}else { //로그인실패
			model.addAttribute("msg", "로그인실패,아이디 비밀번호를 확인하세요");
			
			return "user/loginPage"; //다시 로그인페이지
		}
	}
		//로그아웃
		@RequestMapping("/logout")
		public String logout(HttpSession session) {
			session.invalidate();
			return "redirect:/";
		}
		
	
	
}