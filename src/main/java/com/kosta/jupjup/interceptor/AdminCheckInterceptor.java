package com.kosta.jupjup.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.kosta.jupjup.vo.ManagerVO;

public class AdminCheckInterceptor  implements HandlerInterceptor {
	

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		

		String requestURI = request.getRequestURI();
		System.out.println("requestURI = " + requestURI);

		// 세션 가져옴
		HttpSession session = request.getSession();
		
		ManagerVO admin = (ManagerVO) session.getAttribute(SessionConst.LOGIN_MANAGER);
		System.out.println("관리자 정보있음?");
		System.out.println(admin);
		
		// 세션에 로그인 정보가 있는지 확인
		if (session.getAttribute(SessionConst.LOGIN_MANAGER)==null) {	
			session.setAttribute("redirectURL", requestURI);
			response.sendRedirect("/admin/main/list");
			return false;
		} else {
			session.setAttribute("redirectURL", requestURI);
			response.sendRedirect("/admin/main/list");
			return true;
		}
		
	
	
	}

}
