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

	@Override
	public int nicknameCheck(String nickname) {
		
		return  userDao.nicknameCheck(nickname);
	}


	@Override
	public String selectFindId(String email) {
		
		return userDao.selectFindId(email);
	}

	@Override
	public String selectFindPwd(String id, String email) {
		
		return userDao.selectFindPwd(id, email);
	}

	@Override
	public String selectByEmail(String email) {
		// TODO Auto-generated method stub
		return userDao.selectByEmail(email);
	}


		
	}

    
