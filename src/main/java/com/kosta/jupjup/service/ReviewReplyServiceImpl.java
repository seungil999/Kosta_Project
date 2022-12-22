package com.kosta.jupjup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.ReviewReplyDAO;
import com.kosta.jupjup.paging.Criteria;
import com.kosta.jupjup.vo.ReviewReplyVO;

@Service
public class ReviewReplyServiceImpl implements ReviewReplyService {

	@Autowired
	private ReviewReplyDAO dao;
	
	
	@Override
	public int register(ReviewReplyVO vo) {

		return dao.insert(vo);
	}

	@Override
	public ReviewReplyVO get(Long rno) {
		
		return dao.read(rno);
	}

	@Override
	public int modify(ReviewReplyVO vo) {

		return dao.update(vo);
	}

	@Override
	public int remove(Long rno) {
		
		return dao.delete(rno);
	}

	@Override
	public List<ReviewReplyVO> getList(Criteria cri, Long rev_no) {

		return dao.getListWithPaging(cri, rev_no);
	}

	@Override
	public void updateRepCnt(ReviewReplyVO vo) {

		dao.updateRepCnt(vo);
	}
	
	@Override
	public void minusRepCnt(Long rno) {

		dao.minusRepCnt(rno);
	}

}
