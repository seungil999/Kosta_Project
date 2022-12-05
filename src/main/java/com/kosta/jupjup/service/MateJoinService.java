package com.kosta.jupjup.service;


import com.kosta.jupjup.vo.MateJoinVO;

public interface MateJoinService {
	
	public Integer joinCount(MateJoinVO vo);
	
	public Integer joinGetInfo(MateJoinVO vo);
	
	public void joinInsert(MateJoinVO vo);
	
	public void joinUpdate(MateJoinVO vo);
	
	public void joinCntUpdate(MateJoinVO vo);
	
	public MateJoinVO userCheck(MateJoinVO vo);
	
	}
