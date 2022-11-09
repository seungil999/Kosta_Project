package com.kosta.jupjup.dao;

import java.util.List;

import com.kosta.jupjup.domain.Criteria;
import com.kosta.jupjup.domain.MateFindVO;

public interface MateFindDAO {
	public List<MateFindVO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);

}
