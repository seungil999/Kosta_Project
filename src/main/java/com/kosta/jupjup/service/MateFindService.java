package com.kosta.jupjup.service;

import java.util.List;

import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.FlashMateVO;
import com.kosta.jupjup.vo.RegularMateVO;

public interface MateFindService {
	
//	  public List<RegularMateVO> getRlist(Criteria cri); 
	  public List<FlashMateVO> getFlist(Criteria cri);
	  
	  public int getTotal(Criteria cri);
	 
	}
