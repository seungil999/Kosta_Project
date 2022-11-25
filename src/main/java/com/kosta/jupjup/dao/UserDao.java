package com.kosta.jupjup.dao;

import java.util.Map;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.vo.User;

@Repository
@Mapper
public interface UserDao {

	void Join(Map<String, Object> param);

	User getUserByLoginId(@Param("loginId") String loginId);



}
