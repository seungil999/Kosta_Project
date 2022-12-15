package com.kosta.jupjup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.MyPageDAO;
import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.MateJoinVO;
import com.kosta.jupjup.vo.MateVO;
import com.kosta.jupjup.vo.ReviewVO;
import com.kosta.jupjup.vo.UserVO;

@Service
public class MyPageServiceImpl implements MyPageService{
	@Autowired
	private MyPageDAO dao;
	
	
	@Override
	public List<MateJoinVO> getNo(String id) {

		return dao.getNo(id);
	}


	@Override
	public List<MateVO> getRegular(String id) {

		return dao.getRegular(id);
	}


	@Override
	public List<MateVO> getMate(String id) {

		return dao.getMate(id);
	}


	@Override
	public List<MateVO> endMate(String id) {

		return dao.endMate(id);
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


	@Override
	public int userUpdate(UserVO vo) {

		return dao.userUpdate(vo);
	}


	@Override
	public void withdraw(String id) {

		dao.withdraw(id);
	}


	@Override
	public void deleteMate(String id) {
		dao.deleteMate(id);
		
	}


	@Override
	public void deleteReview(String id) {
		dao.deleteReview(id);
		
	}


	@Override
	public int getEndActivityTotal(String id) {

		return dao.getEndActivityTotal(id);
	}


	@Override
	public UserVO getProfile(String id) {

		return dao.getProfile(id);
	}


	@Override
	public List<MateVO> getTime(String id) {

		return dao.getTime(id);
	}


	@Override
	public List<MateVO> getTotalActivity(String year, String id) {
		// TODO Auto-generated method stub
		return dao.getTotalActivity(year,id);
	}


	@Override
	public void updateGrade(String id, int grade) {

		dao.updateGrade(id,grade);
	}


	@Override
	public List<MateVO> getWriteMateList(Criteria cri,String id) {

		return dao.getWriteMateList(cri, id);
	}

}
