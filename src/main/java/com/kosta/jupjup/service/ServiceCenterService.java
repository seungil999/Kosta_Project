package com.kosta.jupjup.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kosta.jupjup.vo.NoticeVO;
import com.kosta.jupjup.vo.ServiceCenterVO;

@Service
public interface ServiceCenterService {
	
	public List<ServiceCenterVO> getallList(String string);

	public List<ServiceCenterVO> getnoticeList();

	public NoticeVO getnoticedetail(Long no);

	public void write(NoticeVO noticeVO);



}
