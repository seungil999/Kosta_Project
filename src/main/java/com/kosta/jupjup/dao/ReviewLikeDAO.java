package com.kosta.jupjup.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.vo.MateLikeVO;

@Mapper
@Repository
public interface ReviewLikeDAO {
	
	public int likeCount(MateLikeVO vo);
	
	public Integer likeGetInfo(MateLikeVO vo);
	
	public void likeInsert(MateLikeVO vo);
	
	public void likeUpdate(MateLikeVO vo);
	
	public void likeCntUpdate(MateLikeVO vo);

}
