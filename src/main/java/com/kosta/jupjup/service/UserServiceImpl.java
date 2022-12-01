package com.kosta.jupjup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.UserDao;
import com.kosta.jupjup.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public int idCheck(String id) {
	
		return userDao.idCheck(id);
	}

	@Override
	public int join(UserVO vo) {
		
		return userDao.join(vo);
	}

	@Override
	public UserVO login(UserVO vo) {
		
		return userDao.login(vo);
	}

    
}