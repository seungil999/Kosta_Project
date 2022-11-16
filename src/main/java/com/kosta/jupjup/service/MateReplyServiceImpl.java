package com.kosta.jupjup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.MateReplyDAO;
import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.MateReplyVO;

@Service
public class MateReplyServiceImpl implements MateReplyService {

	@Autowired
	private MateReplyDAO dao;
	
	
	@Override
	public int register(MateReplyVO vo) {

		return dao.insert(vo);
	}

	@Override
	public MateReplyVO get(Long rno) {
		
		return dao.read(rno);
	}

	@Override
	public int modify(MateReplyVO vo) {

		return dao.update(vo);
	}

	@Override
	public int remove(Long rno) {
		
		return dao.delete(rno);
	}

	@Override
	public List<MateReplyVO> getList(Criteria cri, Long no) {

		return dao.getListWithPaging(cri, no);
	}

}
