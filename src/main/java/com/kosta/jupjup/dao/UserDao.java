package com.kosta.jupjup.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.vo.UserVO;

@Repository
@Mapper
public interface UserDao {

	public int idCheck(String id); //중복체크

	public int join(UserVO vo);//가입

	public UserVO login(UserVO vo); //로그인


	


}
