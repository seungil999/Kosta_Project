package com.kosta.jupjup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.MateJoinDAO;
import com.kosta.jupjup.vo.MateJoinVO;

@Service
public class MateJoinServiceImpl implements MateJoinService {

	@Autowired
	MateJoinDAO dao;

	@Override
	public Integer joinCount(MateJoinVO vo) {
		
		return dao.joinCount(vo);
	}

	@Override
	public Integer joinGetInfo(MateJoinVO vo) {
		
		return dao.joinGetInfo(vo);
	}

	@Override
	public void joinInsert(MateJoinVO vo) {
		dao.joinInsert(vo);
	}

	@Override
	public void joinUpdate(MateJoinVO vo) {
		dao.joinUpdate(vo);
	}
	
	@Override
	public void joinCntUpdate(MateJoinVO vo) {
		dao.joinCntUpdate(vo);
	
	}

	@Override
	public MateJoinVO userCheck(MateJoinVO vo) {

		return dao.userCheck(vo);
	}
	
}
