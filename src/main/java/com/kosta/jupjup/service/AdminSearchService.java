package com.kosta.jupjup.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kosta.jupjup.paging.Criteria;
import com.kosta.jupjup.vo.UserVO;

@Service
public interface AdminSearchService {

	// 01. 조회 결과수
	int countTotal(Criteria cri);
	
	// 02. 회원 조회 / 페이징 O, 검색 O
	List<UserVO> SearchList(Criteria cri);

	// 03. 회원 추가 
	void insertUser(UserVO userVO);
	
	// 04. 회원 삭제
	void deleteUser(List<String> userIdxArray);
	
	// 05. 회원 수정
	void updateUser(UserVO userVO);
}
