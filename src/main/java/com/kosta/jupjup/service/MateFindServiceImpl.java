package com.kosta.jupjup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.MateFindDAO;
import com.kosta.jupjup.paging.Criteria;
import com.kosta.jupjup.vo.MateVO;
import com.kosta.jupjup.vo.ReportVO;
import com.kosta.jupjup.vo.UserVO;

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
		return matefindDAO.getBestlist(cri);
	}

	@Override
	public boolean modify(MateVO vo) {
		
		return matefindDAO.update(vo)==1;
	}

	@Override
	public boolean remove(Long no) {

		return matefindDAO.delete(no)==1;
	}

	@Override
	public List<UserVO> mateInUsers(Long no) {

		return matefindDAO.mateInUsers(no);
	}

	@Override
	public int report(ReportVO vo) {

		return matefindDAO.report(vo);
	}

	@Override
	public Integer reportChk(String id, Long no) {

		return matefindDAO.reportChk(id,no);
	}

	@Override
	public void reportUpdate(Long no) {

		matefindDAO.reportUpdate(no);
	}

	@Override
	public Integer repReportChk(ReportVO vo) {

		return matefindDAO.repReportChk(vo);
	}

	@Override
	public int repReport(ReportVO vo) {

		return matefindDAO.repReport(vo);
	}

	

}
