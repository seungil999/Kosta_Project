package com.kosta.jupjup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.MateJoinVO;
import com.kosta.jupjup.vo.MateVO;
import com.kosta.jupjup.vo.ReviewVO;

@Mapper
@Repository
public interface MyPageDAO {
	public List<MateJoinVO> getNo(String id);
	
	public int getRegular(Long no);
	
	public MateVO getMate(Long no);
	
	public MateVO endMate(Long no);
	
	public List<MateVO> getlist(@Param("cri")Criteria cri,@Param("id")String id);
	
	public Integer getMateTotal(String id);
	
	public List<MateVO> getMateList(@Param("cri")Criteria cri,@Param("id") String id);
	
	public Integer getReviewTotal(String id);
	
	public List<ReviewVO> getReviewList(@Param("cri")Criteria cri,@Param("id") String id);
	
	public Integer getLikeReviewTotal(String id);
	
	public List<ReviewVO> getLikeReview(@Param("cri")Criteria cri,@Param("id") String id);
	
	public Integer getLikeActivityTotal(String id);
	
	public List<MateVO> getLikeActivity(@Param("cri")Criteria cri,@Param("id") String id);
}
