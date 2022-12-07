package com.kosta.jupjup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.jupjup.vo.NoticeVO;
import com.kosta.jupjup.vo.ServiceCenterVO;

@Repository
@Mapper
public interface ServiceCenterDAO {

	public List<ServiceCenterVO> getallList(String fil);

	public List<ServiceCenterVO> getnoticelist();

	public NoticeVO getnoticedetail(Long no);

	public NoticeVO writeNotice();

	public void write(NoticeVO noticeVO);
}
