package com.kosta.jupjup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.MateVO;
import com.kosta.jupjup.vo.ReportVO;
import com.kosta.jupjup.vo.UserVO;

@Mapper
@Repository
public interface MateFindDAO {
	public List<MateVO> getlistWithPaging(Criteria cri);

	public List<MateVO> getBestlist(Criteria cri);

	public int getTotalCount(Criteria cri);

	public MateVO read(Long no);

	public int update(MateVO vo);
	
	public int delete(Long no);
	
	public List<UserVO> mateInUsers(Long no);
	
	public int report(ReportVO vo);
	
	public Integer reportChk(@Param("id")String id,@Param("no") Long no);
	
	public void reportUpdate(Long no);
	
}
