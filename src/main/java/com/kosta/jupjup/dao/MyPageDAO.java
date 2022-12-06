package com.kosta.jupjup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.MateJoinVO;
import com.kosta.jupjup.vo.MateVO;
import com.kosta.jupjup.vo.ReviewVO;
import com.kosta.jupjup.vo.UserVO;

@Mapper
@Repository
public interface MyPageDAO {
	public List<MateJoinVO> getNo(String id);
	
	public int getRegular(Long no);
	
	public List<MateVO> getMate(String id);
	
	public List<MateVO> endMate(String id);
	
	public List<MateVO> getlist(@Param("cri")Criteria cri,@Param("id")String id);
	
	public Integer getMateTotal(String id);
	
	public List<MateVO> getMateList(@Param("cri")Criteria cri,@Param("id") String id);
	
	public Integer getReviewTotal(String id);
	
	public List<ReviewVO> getReviewList(@Param("cri")Criteria cri,@Param("id") String id);
	
	public Integer getLikeReviewTotal(String id);
	
	public List<ReviewVO> getLikeReview(@Param("cri")Criteria cri,@Param("id") String id);
	
	public Integer getLikeActivityTotal(String id);
	
	public List<MateVO> getLikeActivity(@Param("cri")Criteria cri,@Param("id") String id);
	
	public int userUpdate(UserVO vo);
	
	public void withdraw(String id);
	
	public void deleteMate(String id);
	
	public void deleteReview(String id);
	
	public int getEndActivityTotal(String id);
	
	public UserVO getProfile(String id);
}
