package com.kosta.jupjup.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.vo.MateLikeVO;

@Mapper
@Repository
public interface ReviewLikeDAO {
	
	public int likeCount(MateLikeVO vo);
	
	public Integer likeGetInfo(@Param("rev_no")Long rev_no,@Param("user_id")String user_id);
	
	public void likeInsert(MateLikeVO vo);
	
	public void likeUpdate(MateLikeVO vo);
	
	public void likeCntUpdate(MateLikeVO vo);

}
