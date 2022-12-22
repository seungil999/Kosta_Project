package com.kosta.jupjup.service;

import org.springframework.stereotype.Service;

import com.kosta.jupjup.vo.NoticeVO;

@Service
public interface AdminWriteService {

	void write(NoticeVO noticeVO);
}
