package com.kosta.jupjup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.MateFindDAO;
import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.MateVO;

@Service
public class MateFindServiceImpl implements MateFindService {

	@Autowired
	MateFindDAO matefindDAO;

	@Override
	public List<MateVO> getlist(Criteria cri) {

		return matefindDAO.getlistWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {

		return matefindDAO.getTotalCount(cri);
	}

	@Override
	public MateVO get(Long no) {

		return matefindDAO.read(no);
	}

	// 메인 좋아요 순 리스트용
	@Override
	public List<MateVO> getBestlist(Criteria cri) {
		// TODO Auto-generated method stub
		return matefindDAO.getBestlist(cri);
	}

}
