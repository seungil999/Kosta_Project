package com.kosta.jupjup.service;

import java.util.List;

import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.MateVO;
import com.kosta.jupjup.vo.ReportVO;
import com.kosta.jupjup.vo.UserVO;

public interface MateFindService {

	public List<MateVO> getlist(Criteria cri);

	public List<MateVO> getBestlist(Criteria cri);

	public int getTotal(Criteria cri);

	public MateVO get(Long no);
	
	public boolean modify(MateVO vo);
	
	public boolean remove(Long no);
	
	public List<UserVO> mateInUsers(Long no);
	
	public int report(ReportVO vo);
	
	public Integer reportChk(String id,Long no);
	
	public void reportUpdate(int no);

}
