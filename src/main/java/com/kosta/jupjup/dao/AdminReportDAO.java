package com.kosta.jupjup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.paging.Criteria;
import com.kosta.jupjup.vo.ReportVO;
@Repository
@Mapper
public interface AdminReportDAO {
	
	List<ReportVO> selectReport( );
	
	int userTotalCount(Criteria cri);
	
	
}
