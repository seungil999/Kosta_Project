package com.kosta.jupjup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.FlashMateVO;
import com.kosta.jupjup.vo.RegularMateVO;

@Mapper
@Repository
public interface MateFindDAO {
	public List<FlashMateVO> getFlistWithPaging(Criteria cri);
	public List<RegularMateVO> getRlistWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);

}
