package com.kosta.jupjup.service;

import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.MateCreateDAO;
import com.kosta.jupjup.vo.MateCreateVO;

@Service
public class MateCreateServiceImpl implements MateCreateService {

	@Override
	public void MateCraete(MateCreateVO matecreate) {
		MateCreateDAO.createMate(matecreate);
	}

}
