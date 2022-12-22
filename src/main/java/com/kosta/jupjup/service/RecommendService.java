package com.kosta.jupjup.service;

import org.springframework.stereotype.Service;

import com.kosta.jupjup.vo.RecommendVO;


@Service
public interface RecommendService {
	
	// 추천지 입력
	void recommendInsert(RecommendVO rvo);
}
