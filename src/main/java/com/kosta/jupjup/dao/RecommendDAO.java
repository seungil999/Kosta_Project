package com.kosta.jupjup.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.vo.RecommendVO;

@Mapper
@Repository
public interface RecommendDAO {
	
	void recommendInsert(RecommendVO rvo);
	
	
}
