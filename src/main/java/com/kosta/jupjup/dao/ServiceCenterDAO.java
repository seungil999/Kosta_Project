package com.kosta.jupjup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.vo.ServiceCenterVO;

@Repository
@Mapper
public interface ServiceCenterDAO {

	public List<ServiceCenterVO> getallList();

}
