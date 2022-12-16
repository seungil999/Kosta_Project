package com.kosta.jupjup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.vo.ReplyVO;

@Repository
@Mapper
public interface ReplyDAO {
	
	//댓글조회
	public List<ReplyVO> readReply(int bno);
	//댓글작성 
	public void writeReply(ReplyVO vo);
	//댓글수정 
	public void updateReply(ReplyVO vo);
		
	//댓글삭제
	public void deleteReply(ReplyVO vo);
	
	//선택된 댓글 조회
	public ReplyVO selectReply(int rno);
}
