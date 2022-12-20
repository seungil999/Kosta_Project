package com.kosta.jupjup.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.vo.NoticeVO;

@Mapper
@Repository
public interface AdminWriteDAO {

	// 작성
	void insertNotice(NoticeVO noticeVO);
	
}
