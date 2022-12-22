package com.kosta.jupjup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.AdminSearchDAO;
import com.kosta.jupjup.paging.Criteria;
import com.kosta.jupjup.vo.UserVO;

@Service
public class AdminSearchServiceImpl implements AdminSearchService {

	
	@Autowired
	AdminSearchDAO adminSearchDAO;
	
	// 00. 조회 결과수 
	@Override
	public int countTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return adminSearchDAO.userTotalCount(cri);
	}
	
	// 01. 전체 회원 조회 / 페이징 O, 검색용
	@Override
	public List<UserVO> SearchList(Criteria cri) {
		// TODO Auto-generated method stub
		return adminSearchDAO.selectSearchMemberPaging(cri);
	}
	

	// 02. 회원 추가
	@Override
	public void insertUser(UserVO userVO) {
		// TODO Auto-generated method stub
		adminSearchDAO.insertUser(userVO);
		
	}

	// 03. 회원 삭제
	@Override
	public void deleteUser(List<String> userIdxArray) {
		// TODO Auto-generated method stub
		for(int i=0; i<userIdxArray.size(); i++) {
			adminSearchDAO.deleteUser(userIdxArray.get(i));
		}
	}

	// 04. 회원 수정
	@Override
	public void updateUser(UserVO userVO) {
		// TODO Auto-generated method stub
		adminSearchDAO.updateUser(userVO);
	}	
}
