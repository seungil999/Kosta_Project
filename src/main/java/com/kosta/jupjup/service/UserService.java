package com.kosta.jupjup.service;

import org.springframework.stereotype.Service;

import com.kosta.jupjup.vo.UserVO;

@Service
public interface UserService {

	public int idCheck(String id); //중복체크

	public int join(UserVO vo);//가입

	public UserVO login(UserVO vo); //로그인
	

	
		

	



}
