package com.kosta.jupjup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.MateVO;
import com.kosta.jupjup.vo.ReviewVO;

@Mapper
@Repository
public interface ReviewDAO {
	public List<ReviewVO> getlistWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);

	public void insert(ReviewVO vo);
	public ReviewVO read(Long no);
	
	public int update(ReviewVO vo);
	public int delete(Long no);
	public void hit(Long no);
	
}
