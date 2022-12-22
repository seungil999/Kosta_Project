package com.kosta.jupjup.service;


import com.kosta.jupjup.vo.MateLikeVO;

public interface ReviewLikeService {
	
	public int likeCount(MateLikeVO vo);
	
	public Integer likeGetInfo(Long rev_no,String user_id);
	
	public void likeInsert(MateLikeVO vo);
	
	public void likeUpdate(MateLikeVO vo);
	
	public void likeCntUpdate(MateLikeVO vo);

	}
