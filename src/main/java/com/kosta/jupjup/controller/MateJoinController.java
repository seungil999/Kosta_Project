package com.kosta.jupjup.controller;

import java.lang.ProcessBuilder.Redirect;
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
		MateVO matevo= new MateVO();
		
		try {	
			System.out.println(vo);
			
			Integer peopleNum = service.joinCount(vo); // 해당 모임에 몇명이 있는지
			matevo = findservice.get(vo.getNo());  //해당 모임 최대 인원 수
			MateJoinVO userCheck = service.userCheck(vo); // 해당 모임에 참여했던적이 있는지(jno,userid)
			Integer count = service.mateCount(vo.getUserid());
			System.out.println(peopleNum);
			System.out.println(matevo.getPeoplemaxnum());
			if(userCheck==null) {
				service.joinInsert(vo);
			}
			MateJoinVO realUserChk = service.userCheck(vo);
			
			if(vo.getUserid()==null ||vo.getUserid().equals("")) { //로그인 안되어있으면
				map.put("result", "login");
				return map;
			}else if(peopleNum < matevo.getPeoplemaxnum() && realUserChk.getJno()==0 && count<3) {
				service.joinUpdate(vo);
				service.joinCntUpdate(vo);
				map.put("result", "success");
			}else if(peopleNum == matevo.getPeoplemaxnum() && realUserChk.getJno()==0) {
				map.put("result", "full");
			}else if(realUserChk.getJno()==1) {
				service.joinUpdate(vo);
				service.joinCntUpdate(vo);
				map.put("result", "success");
			}else if(count>=3) {
				map.put("result", "mateFull");
			}
			
			

		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		return map;
	}
}
