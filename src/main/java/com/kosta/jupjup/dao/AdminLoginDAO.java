package com.kosta.jupjup.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.vo.ManagerVO;

@Repository
@Mapper
public interface AdminLoginDAO {

	ManagerVO login(ManagerVO mvo); // 로그인 
}
