package com.kosta.jupjup.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kosta.jupjup.interceptor.AdminCheckInterceptor;
import com.kosta.jupjup.interceptor.LoginCheckInterceptor;

	@Configuration
	public class WebConfig implements WebMvcConfigurer {

	// 로그인 여부에 따른 접속 가능 페이지 구분
		@Override
		public void addInterceptors(InterceptorRegistry registry) {
			registry.addInterceptor(new LoginCheckInterceptor()) //  LoginCheckInterceptor 클래스 내용을 넘김
				.order(1)
			// order : 해당 인터셉터가 적용되는 순서, 1이면 첫번째로 실행
				.addPathPatterns("/**")
				.excludePathPatterns("/","/main", 
						"/matefind/list", "/user/loginPage","/user/joinPage" ,"/user/finduserId" , "/user/findPassword"
						,"/review/list","/matefind/**","/review/**","/reviewReplies/**","/Mate/**","/replies/**","/reviewLike/**","/like/**"
						,"/board/**","/matejoin/**"
						,"/resources/**","/user/css/**","/user/kakao"
						,"/ServiceCenter/" ,"/admin/main/**","/admin/search/**","/admin/report/**","/admin/write/**","/admin/question/**");
			
		}

	
	}

