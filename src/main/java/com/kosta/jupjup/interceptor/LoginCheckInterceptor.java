package com.kosta.jupjup.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.jupjup.vo.ManagerVO;


//인터셉터 클래스는 HandlerInterceptor 를 속한 메서드를 쓰기 위해 implements 해야합니다.
public class LoginCheckInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {

		
		String requestURI = request.getRequestURI();
		System.out.println("requestURI = " + requestURI);

		// 세션 가져옴
		HttpSession session = request.getSession();
		
		ManagerVO admin = (ManagerVO) session.getAttribute(SessionConst.LOGIN_MANAGER);
		
		// 세션에 로그인 정보가 있는지 확인
		if (session.getAttribute(SessionConst.LOGIN_USER)==null) {	
			session.setAttribute("redirectURL", requestURI);
			response.sendRedirect("/user/loginPage");
			return false;
		} else {
			// 로그인 상태
			
			return true;
		}
}}
