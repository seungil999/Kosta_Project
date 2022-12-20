package com.kosta.jupjup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.AdminQuestDAO;
import com.kosta.jupjup.vo.QuestionVO;

@Service
public class AdminQuestServiceImpl implements AdminQuestService {

	@Autowired
	AdminQuestDAO adminQuestDAO;
	
	@Override
	public void write(QuestionVO qvo) {
		// TODO Auto-generated method stub
		adminQuestDAO.insertQuestions(qvo);
	}

}
