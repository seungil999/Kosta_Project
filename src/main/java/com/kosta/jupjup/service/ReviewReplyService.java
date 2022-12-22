package com.kosta.jupjup.service;

import java.util.List;

import com.kosta.jupjup.paging.Criteria;
import com.kosta.jupjup.vo.ReviewReplyVO;

public interface ReviewReplyService {

	public int register(ReviewReplyVO vo);
	
	public ReviewReplyVO get(Long rno);
	
	public int modify(ReviewReplyVO vo);
	
	public int remove(Long rno);
	
	public List<ReviewReplyVO>getList(Criteria cri, Long rev_no);
	
	public void updateRepCnt(ReviewReplyVO vo);
	
	public void minusRepCnt(Long rno);

}
