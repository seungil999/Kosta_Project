package com.kosta.jupjup.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kosta.jupjup.service.MateFindService;
import com.kosta.jupjup.service.MateJoinService;
import com.kosta.jupjup.vo.MateJoinVO;
import com.kosta.jupjup.vo.MateVO;
import com.kosta.jupjup.vo.UserVO;

@RestController
@RequestMapping("/matejoin/")
public class MateJoinController {
	@Autowired
	HttpServletRequest request;
	@Autowired
	MateJoinService service;
	@Autowired
	MateFindService findservice;
	
	@PutMapping("/joinUpdate")
	public Map<String,String> joinupdate(@RequestBody MateJoinVO vo){
		HttpSession session = request.getSession();
		UserVO uservo = (UserVO) session.getAttribute("userVO");
		
		Map<String,String> map = new HashMap<String, String>();
		MateVO matevo= new MateVO();
		
		try {	
			System.out.println(vo);
			
			Integer peopleNum = service.joinCount(vo); // 해당 모임에 몇명이 있는지
			matevo = findservice.get(vo.getMate_no());  //해당 모임 최대 인원 수
			MateJoinVO userCheck = service.userCheck(vo); // 해당 모임에 참여했던적이 있는지(jno,userid)
			Integer count = service.mateCount(vo.getUser_id());
			System.out.println(peopleNum);
			System.out.println(matevo.getPeoplemaxnum());
			if(userCheck==null && uservo!=null) {
				service.joinInsert(vo);
			}
			MateJoinVO realUserChk = service.userCheck(vo);
			//로그인 안되어있으면
			if(uservo==null) { 
				map.put("result", "login");
			//인원이 가득찼거나,활동에 참여중이아니거나, 세 모임 이상 참여한것이 아니라면	
			}else if(peopleNum < matevo.getPeoplemaxnum() && realUserChk.getJno()==0 && count<3) {
				service.joinUpdate(vo);       
				service.joinCntUpdate(vo);
				map.put("result", "success");
			//인원이 가득찼고, 해당 모임에 참여중이 아니라면
			}else if(peopleNum == matevo.getPeoplemaxnum() && realUserChk.getJno()==0) {
				map.put("result", "full");	
			// 해당 모임에 참여중이라면	
			}else if(realUserChk.getJno()==1) {
				service.joinUpdate(vo);		
				service.joinCntUpdate(vo);
				map.put("result", "success");
			// 예약중인 활동이 3개가 초과된다면
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
