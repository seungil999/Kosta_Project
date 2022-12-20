package com.kosta.jupjup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.paging.Criteria;
import com.kosta.jupjup.vo.UserVO;

@Mapper
@Repository
public interface AdminMainDAO {
	
	// 01. 검색 결과 개수 / 페이징 처리용 
	int userTotalCount(Criteria cri);
		
	// 02. 전체 회원 조회 / 페이징 O, 검색용
	List<UserVO> selectAllUserPaging(Criteria cri);
	
	int deleteUser(String userIdxArray);
	
	int insertUser(UserVO userVO);
	
	int updateUser(UserVO userVO);
}
