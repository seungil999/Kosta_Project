package com.kosta.jupjup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.RecommendDAO;
import com.kosta.jupjup.vo.RecommendVO;



@Service
public class RecommendServiceImpl implements RecommendService{

	
	@Autowired
	RecommendDAO recommendDAO;
	
	@Override
	public void recommendInsert(RecommendVO rvo) {
		// TODO Auto-generated method stub
		recommendDAO.recommendInsert(rvo);
	}

}
