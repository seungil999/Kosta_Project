package com.kosta.jupjup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.jupjup.dao.MateFindDAO;
import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.MateVO;


@Service
public class MateFindServiceImpl implements MateFindService {

	
	  @Autowired
	  MateFindDAO matefindDAO;
	  
	  
	  
//	  @Override public List<RegularMateVO> getRlist(Criteria cri) {
//	  
//	  return matefindDAO.getRlistWithPaging(cri);
//	  
//	  }
	  
	  @Override 
	  public List<MateVO> getlist(Criteria cri) {
	  
	  return matefindDAO.getFlistWithPaging(cri); 
	  }
	 

	@Override
	public int getTotal(Criteria cri) {
		
		return matefindDAO.getTotalCount(cri);
	}

}
