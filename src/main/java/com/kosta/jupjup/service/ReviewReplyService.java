package com.kosta.jupjup.service;

import java.util.List;

import com.kosta.jupjup.paging.Criteria;
import com.kosta.jupjup.vo.MateReplyVO;

public interface ReviewReplyService {

	public int register(MateReplyVO vo);
	
	public MateReplyVO get(Long rno);
	
	public int modify(MateReplyVO vo);
	
	public int remove(Long rno);
	
	public List<MateReplyVO>getList(Criteria cri, Long no);
	
	public void updateRepCnt(MateReplyVO vo);
	
	public void minusRepCnt(Long rno);

}
