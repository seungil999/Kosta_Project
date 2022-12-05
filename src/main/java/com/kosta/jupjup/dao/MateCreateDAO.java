package com.kosta.jupjup.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.vo.MateCreateVO;

@Repository
@Mapper
public interface MateCreateDAO {
	
	 void insertmate(MateCreateVO matecreatevo);
	 
	 Long getThisNo(String id);
}
