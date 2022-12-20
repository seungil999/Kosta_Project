package com.kosta.jupjup.service;

import org.springframework.stereotype.Service;
import com.kosta.jupjup.vo.QuestionVO;

@Service
public interface AdminQuestService {

	void write(QuestionVO qvo);
}
