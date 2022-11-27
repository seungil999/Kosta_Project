package com.kosta.jupjup.service;


import java.util.List;

import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.MateVO;
import com.kosta.jupjup.vo.ReviewVO;

public interface ReviewService {
	public List<ReviewVO> getlist(Criteria cri);
	public int getTotal(Criteria cri);

	public ReviewVO get(Long no);

	
	public void write(ReviewVO vo);

	
}
