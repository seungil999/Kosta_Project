package com.kosta.jupjup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.MateVO;

@Mapper
@Repository
public interface MateFindDAO {
	public List<MateVO> getlistWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
	public MateVO read(Long no);

}
