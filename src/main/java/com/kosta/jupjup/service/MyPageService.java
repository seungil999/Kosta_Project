package com.kosta.jupjup.service;

import java.util.List;

import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.MateJoinVO;
import com.kosta.jupjup.vo.MateVO;
import com.kosta.jupjup.vo.ReviewVO;

public interface MyPageService {

	List<MateJoinVO> getNo(String id);
	
	int getRegular(Long no);
	
	MateVO getMate(Long no);
	
	MateVO endMate(Long no);
	
	public List<MateVO> getlist(Criteria cri,String id);
	
	int getMateTotal(String id);
	
	public List<MateVO> getMateList(Criteria cri, String id);
	
	int getReviewTotal(String id);
	
	public List<ReviewVO> getReviewList(Criteria cri, String id);
	
	int getLikeReviewTotal(String id);
	
	public List<ReviewVO> getLikeReivew(Criteria cri, String id);
	
	int getLikeActivityTotal(String id);
	
	public List<MateVO> getLikeActivity(Criteria cri, String id);

}
