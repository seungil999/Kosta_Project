package com.kosta.jupjup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.AdminMainDAO;
import com.kosta.jupjup.paging.Criteria;
import com.kosta.jupjup.vo.UserVO;

@Service
public class AdminMainServiceImpl implements AdminMainService {

	@Autowired
	AdminMainDAO adminMainDAO;
	
	// 전체 결과수
	@Override
	public int countTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return adminMainDAO.userTotalCount(cri);
	}

	// 전체 회원 조회
	@Override
	public List<UserVO> allUserList(Criteria Cri) {
		// TODO Auto-generated method stub
		return adminMainDAO.selectAllUserPaging(Cri);
	}

	@Override
	public void deleteUser(List<String> userIdxArray) {
		// TODO Auto-generated method stub
		for(int i=0; i<userIdxArray.size(); i++) {
			adminMainDAO.deleteUser(userIdxArray.get(i));
			System.out.println(userIdxArray.get(i));
		}
	}

	@Override
	public void insertUser(UserVO userVO) {
		// TODO Auto-generated method stub
		adminMainDAO.insertUser(userVO);
	}

	@Override
	public int updateUser(UserVO userVO) {
		// TODO Auto-generated method stub
		int result = adminMainDAO.updateUser(userVO);
		return result;
	}

}
