package com.kosta.jupjup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.ReplyDAO;
import com.kosta.jupjup.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	 ReplyDAO dao;

	@Override
	public List<ReplyVO> readReply(int bno) {
	
		return dao.readReply(bno);
	}

	@Override
	public void writeReply(ReplyVO vo) {
		 dao.writeReply(vo);
		
	}

	@Override
	public void updateReply(ReplyVO vo) {
		dao.updateReply(vo);
		
	}

	@Override
	public void deleteReply(ReplyVO vo)  {
	     dao.deleteReply(vo);
		
	}

	@Override
	public ReplyVO selectReply(int rno)  {
		
		return dao.selectReply(rno);
	}

}
