package com.kosta.jupjup.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kosta.jupjup.service.MateFindService;
import com.kosta.jupjup.service.MateJoinService;
import com.kosta.jupjup.vo.MateJoinVO;
import com.kosta.jupjup.vo.MateVO;

@RestController
@RequestMapping("/matejoin/")
public class MateJoinController {
	
	@Autowired
	MateJoinService service;
	@Autowired
	MateFindService findservice;
	
	@PutMapping("/joinUpdate")
	public Map<String,String> joinupdate(@RequestBody MateJoinVO vo){
		
		
		Map<String,String> map = new HashMap<String, String>();
		
		try {
			MateVO matevo= new MateVO();
			Long no = vo.getNo();
			matevo = findservice.get(no);
			if(matevo.getPeoplenum()>=matevo.getPeoplemaxnum()&& vo.getJno()<1) {
				map.put("result", "fail");
				
			}else {
			
			service.joinUpdate(vo);
			service.joinCntUpdate(vo);
			map.put("result", "success");
		}
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		return map;
	}
}
