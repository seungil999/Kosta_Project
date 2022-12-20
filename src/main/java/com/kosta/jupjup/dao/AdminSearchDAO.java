package com.kosta.jupjup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.paging.Criteria;
import com.kosta.jupjup.vo.UserVO;

@Mapper
@Repository
public interface AdminSearchDAO {
	
	// 01. 검색 결과 개수 / 페이징 처리용 
	int userTotalCount(Criteria cri);
	
	// 02. 회원 조회 / 페이징 O, 검색용
	List<UserVO> selectSearchMemberPaging(Criteria cri);
	
	// 03. 회원 추가 
	int insertUser(UserVO userVO);
	
	// 04. 회원 삭제
	int deleteUser(String userIdxArray);
	
	// 05. 회원 수정
	int updateUser(UserVO userVO);

}


