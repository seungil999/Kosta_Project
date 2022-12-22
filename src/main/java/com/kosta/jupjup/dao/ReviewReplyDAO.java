package com.kosta.jupjup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.paging.Criteria;
import com.kosta.jupjup.vo.ReviewReplyVO;

@Repository
@Mapper
public interface ReviewReplyDAO {

	public int insert(ReviewReplyVO vo);
	
	public ReviewReplyVO read(Long rno);
	
	public int delete(Long rno);
	
	public int update(ReviewReplyVO reply);
	
	public List<ReviewReplyVO> getListWithPaging(@Param("cri")Criteria cri, @Param("rev_no")Long rev_no);
	
	public void updateRepCnt(ReviewReplyVO vo);
	
	public void minusRepCnt(Long rno);

}
