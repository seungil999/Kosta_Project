package com.kosta.jupjup.dao;

import java.util.List;

import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.FlashMateVO;

public interface MateFindDAO {
	public List<FlashMateVO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);

}
