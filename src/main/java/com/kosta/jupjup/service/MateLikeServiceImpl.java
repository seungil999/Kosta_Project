package com.kosta.jupjup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.MateLikeDAO;
import com.kosta.jupjup.vo.MateLikeVO;

@Service
public class MateLikeServiceImpl implements MateLikeService {

	@Autowired
	private MateLikeDAO likedao;
	
	@Override
	public int likeCount(MateLikeVO vo) {

		return likedao.likeCount(vo);
	}

	@Override
	public int likeGetInfo(MateLikeVO vo) {

		return likedao.likeGetInfo(vo);
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
