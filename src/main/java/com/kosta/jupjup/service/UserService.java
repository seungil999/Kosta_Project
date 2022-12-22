package com.kosta.jupjup.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.kosta.jupjup.vo.UserVO;

@Service
public interface UserService {
	
	public int idCheck(String id); //id중복체크

	public int join(UserVO vo);//가입

	public UserVO login(UserVO vo); //로그인

	public int nicknameCheck(String nickname);//닉네임 중복체크 
	
	public String selectByEmail(String email); // 이메일중복쳌

	public String selectFindId(String email); // 아이디찾기

	public String selectFindPwd(String id, String email);// 비밀번호찾기


		

	



}
