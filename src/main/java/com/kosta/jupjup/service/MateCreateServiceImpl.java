package com.kosta.jupjup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.MateCreateDAO;
import com.kosta.jupjup.vo.MateCreateVO;

@Service
public class MateCreateServiceImpl implements MateCreateService {

	@Autowired
	MateCreateDAO matecreatedao;
	
	@Override
	public void matecreate(MateCreateVO matecreatevo) {
		matecreatedao.insertmate(matecreatevo);
	}

}
