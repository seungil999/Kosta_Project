package com.kosta.jupjup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.AdminWriteDAO;
import com.kosta.jupjup.vo.NoticeVO;

@Service
public class AdminWriteServiceImpl implements AdminWriteService {

	@Autowired
	AdminWriteDAO adminWriteDAO;
	
	// 공지사항 작성 
	public void write(NoticeVO noticeVO) {
		adminWriteDAO.insertNotice(noticeVO);
	}
	
}
