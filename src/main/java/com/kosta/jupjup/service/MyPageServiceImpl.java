package com.kosta.jupjup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.MyPageDAO;
import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.MateJoinVO;
import com.kosta.jupjup.vo.MateVO;
import com.kosta.jupjup.vo.ReviewVO;

@Service
public class MyPageServiceImpl implements MyPageService{
	@Autowired
	private MyPageDAO dao;
	
	
	@Override
	public List<MateJoinVO> getNo(String id) {

		return dao.getNo(id);
	}


	@Override
	public int getRegular(Long no) {

		return dao.getRegular(no);
	}


	@Override
	public MateVO getMate(Long no) {

		return dao.getMate(no);
	}


	@Override
	public MateVO endMate(Long no) {

		return dao.endMate(no);
	}


	@Override
	public List<MateVO> getlist(Criteria cri, String id) {

		return dao.getlist(cri,id);
	}


	@Override
	public int getMateTotal(String id) {

		return dao.getMateTotal(id);
	}


	@Override
	public List<MateVO> getMateList(Criteria cri, String id) {
		return dao.getMateList(cri,id);
	}


	@Override
	public int getReviewTotal(String id) {

		return dao.getReviewTotal(id);
	}


	@Override
	public List<ReviewVO> getReviewList(Criteria cri, String id) {
		
		return dao.getReviewList(cri,id);
	}


	@Override
	public int getLikeReviewTotal(String id) {

		return dao.getLikeReviewTotal(id);
	}


	@Override
	public List<ReviewVO> getLikeReivew(Criteria cri, String id) {

		return dao.getLikeReview(cri,id);
	}


	@Override
	public int getLikeActivityTotal(String id) {

		return dao.getLikeActivityTotal(id);
	}


	@Override
	public List<MateVO> getLikeActivity(Criteria cri, String id) {
		
		return  dao.getLikeActivity(cri,id);
	}

}
