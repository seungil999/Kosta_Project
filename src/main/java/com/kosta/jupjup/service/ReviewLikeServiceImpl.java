package com.kosta.jupjup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.MateLikeDAO;
import com.kosta.jupjup.dao.ReviewLikeDAO;
import com.kosta.jupjup.vo.MateLikeVO;

@Service
public class ReviewLikeServiceImpl implements ReviewLikeService {

	@Autowired
	private ReviewLikeDAO likedao;
	
	@Override
	public int likeCount(MateLikeVO vo) {

		return likedao.likeCount(vo);
	}

	@Override
	public Integer likeGetInfo(Long rev_no,String user_id) {

		return likedao.likeGetInfo(rev_no,user_id);
	}

	@Override
	public void likeInsert(MateLikeVO vo) {
		System.out.println(vo);
		likedao.likeInsert(vo);
	}

	@Override
	public void likeUpdate(MateLikeVO vo) {
		
		likedao.likeUpdate(vo);
	}
	
	@Override
	public void likeCntUpdate(MateLikeVO vo) {
		
		likedao.likeCntUpdate(vo);
	}

}
