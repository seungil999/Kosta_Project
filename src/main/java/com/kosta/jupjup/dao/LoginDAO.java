package com.kosta.jupjup.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.vo.UserVO;

@Mapper
@Repository
public interface LoginDAO {

	// 받아온 카카오 정보 저장
	void kakaoInsert(HashMap<String, Object> userInfo);
	
	// 확인
	UserVO findKakao(HashMap<String, Object> userInfo);
	
}
