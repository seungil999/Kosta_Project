package com.kosta.jupjup.service;

import java.util.List;

import com.kosta.jupjup.vo.ReplyVO;

public interface ReplyService {

	public List<ReplyVO> readReply(int fno);

	// 댓글작성
	public void writeReply(ReplyVO vo);

	// 댓글수정
	public void updateReply(ReplyVO vo);

	// 댓글삭제
	public void deleteReply(ReplyVO vo);

	// 선택된 댓글 조회
	public ReplyVO selectReply(int frno);

}
