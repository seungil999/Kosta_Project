package com.kosta.jupjup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.ReviewDAO;
import com.kosta.jupjup.paging.Criteria;
import com.kosta.jupjup.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	ReviewDAO dao;
	
	@Override
	public void write(ReviewVO vo) {
	
		dao.insert(vo);
	}

	@Override
	public ReviewVO get(Long no) {
		// TODO Auto-generated method stub
		return dao.read(no);
	}

	@Override
	public List<ReviewVO> getlist(Criteria cri) {

		return dao.getlistWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return dao.getTotalCount(cri);

	}

	@Override
	public boolean modify(ReviewVO vo) {
		
		return dao.update(vo)==1;
	}

	@Override
	public boolean remove(Long no) {

		return dao.delete(no)==1;
	}

	@Override
	public void hit(Long no) {
		
		dao.hit(no);
	}

	@Override
	public String getActivityName(Long no) {

		return dao.getActivityName(no);
	}


}
