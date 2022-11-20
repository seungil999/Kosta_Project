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
			MateJoinVO mjv = new MateJoinVO();
			
			Long no = vo.getNo();
			mjv.setNo(no);
			int jno = service.joinGetInfo(mjv);  //해당 모임에 참여 되어있는지 확인
			matevo = findservice.get(no);  //모임 인원 확인용도
			if(matevo.getPeoplenum()==matevo.getPeoplemaxnum()&& jno==0) {
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
