package com.kosta.jupjup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.ServiceCenterDAO;
import com.kosta.jupjup.vo.NoticeVO;
import com.kosta.jupjup.vo.ServiceCenterVO;

@Service
public class ServiceCenterServiceImpl implements ServiceCenterService {
	
	@Autowired
	ServiceCenterDAO servicecenterDAO;
	
	@Override
	public List<ServiceCenterVO> getallList(String fil) {
		return servicecenterDAO.getallList(fil);
	}

	@Override
	public List<ServiceCenterVO> getnoticeList() {
		return servicecenterDAO.getnoticelist();
	}

	@Override
	public NoticeVO getnoticedetail(Long no) {
		return servicecenterDAO.getnoticedetail(no);
	}

	@Override
	public void write(NoticeVO noticeVO) {
		servicecenterDAO.write(noticeVO);
	}

	

}
