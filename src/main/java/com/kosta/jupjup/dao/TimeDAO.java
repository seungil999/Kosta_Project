package com.kosta.jupjup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.vo.MateVO;

@Repository
@Mapper
public interface TimeDAO {
	
	List<MateVO> getStime(String yymm);
	List<MateVO> getEtime(String yymm);      
	int getFlash(String yymm);
	int getRegular(String yymm);
}
