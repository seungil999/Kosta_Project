package com.kosta.jupjup.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.vo.UserVO;

@Repository
@Mapper
public interface UserDao {

	public int idCheck(String id); //중복체크

	public int join(UserVO vo);//가입

	public UserVO login(UserVO vo); //로그인
	
	public int nicknameCheck(String nickname); //중복체크

	public String selectByEmail(String email); //이메일중복체크
	
	public String selectFindId(String email); //아이디찾기
    
	public String selectFindPwd(@Param("id") String id,@Param("email") String email);//비밀번호찾기
  

	


}
