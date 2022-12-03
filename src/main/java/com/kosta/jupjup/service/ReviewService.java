package com.kosta.jupjup.service;


import java.util.List;


import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.ReviewVO;

public interface ReviewService {
	public List<ReviewVO> getlist(Criteria cri);
	public int getTotal(Criteria cri);

	public ReviewVO get(Long no);

	public boolean modify(ReviewVO vo);

	public boolean remove(Long no);
	
	public void write(ReviewVO vo);

	public void hit(Long no);
	
	public String getActivityName(Long no);
}
