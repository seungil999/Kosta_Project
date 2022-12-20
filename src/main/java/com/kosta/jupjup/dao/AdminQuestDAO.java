package com.kosta.jupjup.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.vo.QuestionVO;

@Mapper
@Repository
public interface AdminQuestDAO {

	void insertQuestions(QuestionVO qvo);
}
