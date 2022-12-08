package com.kosta.jupjup.dao;


import org.apache.ibatis.annotations.Mapper;

import org.springframework.stereotype.Repository;

import com.kosta.jupjup.vo.MateJoinVO;


@Mapper
@Repository
public interface MateJoinDAO {
	
	public int joinCount(MateJoinVO vo);
	
	public Integer joinGetInfo(MateJoinVO vo);
	
	public void joinInsert(MateJoinVO vo);
	
	public void joinUpdate(MateJoinVO vo);
	
	public void joinCntUpdate(MateJoinVO vo);

	public MateJoinVO userCheck(MateJoinVO vo);
	
	public Integer mateCount(String id);
}
