package com.kosta.jupjup.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.AdminReportDAO;
import com.kosta.jupjup.paging.Criteria;
import com.kosta.jupjup.vo.ReportVO;
@Service
public class AdminReportServiceImpl implements AdminReportService {

	@Autowired
	AdminReportDAO adminReportDAO;
	
	@Override
	public int reportTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return adminReportDAO.reportTotalCount(cri);
	}

	@Override
	public List<ReportVO> reportList( ) {
		// TODO Auto-generated method stub
		return adminReportDAO.selectReport();
	}
}

	

