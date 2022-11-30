package com.kosta.jupjup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.TimeDAO;
import com.kosta.jupjup.vo.MateVO;


@Service
public class TimeServiceImpl implements TimeService{
	
	@Autowired
	TimeDAO dao;

	@Override
	public List<MateVO> getStime(String yymm) {

		return dao.getStime(yymm);
	}

	@Override
	public List<MateVO> getEtime(String yymm) {
		
		return dao.getEtime(yymm);
	}

	@Override
	public int getRegular(String yymm) {
		 
		return dao.getRegular(yymm);
	}

	@Override
	public int getFlash(String yymm) {
		
		return dao.getFlash(yymm);
	}

	
	

	

}
