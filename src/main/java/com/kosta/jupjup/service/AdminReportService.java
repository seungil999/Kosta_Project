package com.kosta.jupjup.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kosta.jupjup.paging.Criteria;
import com.kosta.jupjup.vo.ReportVO;

@Service
public interface AdminReportService {

	// 01. 조회 결과수
	int reportTotalCount(Criteria cri);
	
	List<ReportVO> reportList( );
}
