package com.kosta.jupjup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.ServiceCenterDAO;
import com.kosta.jupjup.vo.ServiceCenterVO;

@Service
public class ServiceCenterServiceImpl implements ServiceCenterService {
	
	@Autowired
	ServiceCenterDAO servicecenterDAO;
	
	@Override
	public List<ServiceCenterVO> getallList() {
		return servicecenterDAO.getallList();
	}

}
