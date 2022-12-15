package com.kosta.jupjup.service;

import java.util.List;

import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.MateJoinVO;
import com.kosta.jupjup.vo.MateVO;
import com.kosta.jupjup.vo.ReviewVO;
import com.kosta.jupjup.vo.UserVO;

public interface MyPageService {

	List<MateJoinVO> getNo(String id);
	
	List<MateVO> getRegular(String id);
	
	List<MateVO> getMate(String id);
	
	List<MateVO> endMate(String id);
	
	public List<MateVO> getlist(Criteria cri,String id);
	
	int getMateTotal(String id);
	
	public List<MateVO> getMateList(Criteria cri, String id);
	
	int getReviewTotal(String id);
	
	public List<ReviewVO> getReviewList(Criteria cri, String id);
	
	int getLikeReviewTotal(String id);
	
	public List<ReviewVO> getLikeReivew(Criteria cri, String id);
	
	int getLikeActivityTotal(String id);
	
	public List<MateVO> getLikeActivity(Criteria cri, String id);

	int userUpdate(UserVO vo);
	
	void withdraw(String id);
	
	void deleteMate(String id);
	
	void deleteReview(String id);
	
	int getEndActivityTotal(String id);
	
	UserVO getProfile(String id);
	
	public List<MateVO> getTime(String id);
	
	List<MateVO> getTotalActivity(String year,String id);
	
	void updateGrade(String id, int grade);
	
	List<MateVO> getWriteMateList(Criteria cri, String id);
	}
