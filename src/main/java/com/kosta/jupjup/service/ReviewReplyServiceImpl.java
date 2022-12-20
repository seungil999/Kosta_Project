package com.kosta.jupjup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.ReviewReplyDAO;
import com.kosta.jupjup.paging.Criteria;
import com.kosta.jupjup.vo.MateReplyVO;

@Service
public class ReviewReplyServiceImpl implements ReviewReplyService {

	@Autowired
	private ReviewReplyDAO dao;
	
	
	@Override
	public int register(MateReplyVO vo) {

		return dao.insert(vo);
	}

	@Override
	public MateReplyVO get(Long rno) {
		
		return dao.read(rno);
	}

	@Override
	public int modify(MateReplyVO vo) {

		return dao.update(vo);
	}

	@Override
	public int remove(Long rno) {
		
		return dao.delete(rno);
	}

	@Override
	public List<MateReplyVO> getList(Criteria cri, Long no) {

		return dao.getListWithPaging(cri, no);
	}

	@Override
	public void updateRepCnt(MateReplyVO vo) {

		dao.updateRepCnt(vo);
	}
	
	@Override
	public void minusRepCnt(Long rno) {

		dao.minusRepCnt(rno);
	}

}
