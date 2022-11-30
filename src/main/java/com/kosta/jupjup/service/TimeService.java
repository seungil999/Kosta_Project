package com.kosta.jupjup.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kosta.jupjup.vo.MateVO;


@Service
public interface TimeService {
	
	  List<MateVO> getStime(String yymm); 
	  List<MateVO> getEtime(String yymm);
	  
	  int getRegular(String yymm);
	  int getFlash(String yymm);
	 
}	
