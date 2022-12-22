package com.kosta.jupjup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.paging.Criteria;
import com.kosta.jupjup.vo.MateReplyVO;

@Repository
@Mapper
public interface MateReplyDAO {

	public int insert(MateReplyVO vo);
	
	public MateReplyVO read(Long rno);
	
	public int delete(Long rno);
	
	public int update(MateReplyVO reply);
	
	public List<MateReplyVO> getListWithPaging(@Param("cri")Criteria cri, @Param("mate_no")Long no);
	
	public void updateRepCnt(MateReplyVO vo);
	
	public void minusRepCnt(Long no);
			
}
