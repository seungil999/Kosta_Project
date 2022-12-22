package com.kosta.jupjup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.AdminLoginDAO;
import com.kosta.jupjup.vo.ManagerVO;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {

	@Autowired
	AdminLoginDAO adminLoginDAO;
	
	@Override
	public ManagerVO login(ManagerVO mvo) {
		
		return adminLoginDAO.login(mvo);
	}

	
}
