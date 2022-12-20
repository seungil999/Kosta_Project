package com.kosta.jupjup.service;

import org.springframework.stereotype.Service;

import com.kosta.jupjup.vo.ManagerVO;

@Service
public interface AdminLoginService {

	ManagerVO login(ManagerVO mvo);
}
