package com.kosta.jupjup.service;


import com.kosta.jupjup.vo.MateLikeVO;

public interface MateLikeService {
	
	public Integer likeCount(MateLikeVO vo);
	
	public Integer likeGetInfo(MateLikeVO vo);
	
	public void likeInsert(MateLikeVO vo);
	
	public void likeUpdate(MateLikeVO vo);
	
	public void likeCntUpdate(MateLikeVO vo);

	}
