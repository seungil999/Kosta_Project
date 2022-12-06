package com.kosta.jupjup.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kosta.jupjup.vo.ServiceCenterVO;

@Service
public interface ServiceCenterService {
	
	public List<ServiceCenterVO> getallList();

	public List<ServiceCenterVO> getnoticelist();

}
