package com.kosta.jupjup.service;


import com.kosta.jupjup.vo.MateLikeVO;

public interface MateLikeService {
	
	public int likeCount(MateLikeVO vo);
	
	public int likeGetInfo(MateLikeVO vo);
	
	public void likeInsert(MateLikeVO vo);
	
	public void likeUpdate(MateLikeVO vo);

	}
