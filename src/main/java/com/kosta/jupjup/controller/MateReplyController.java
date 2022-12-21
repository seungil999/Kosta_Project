package com.kosta.jupjup.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kosta.jupjup.paging.Criteria;
import com.kosta.jupjup.service.MateReplyService;
import com.kosta.jupjup.vo.MateReplyVO;

import lombok.extern.log4j.Log4j2;

@RequestMapping("/replies/")
@RestController
@Log4j2
public class MateReplyController {

	@Autowired
	private MateReplyService service;
	
	//작성
	@PostMapping(value ="/new",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody MateReplyVO vo){
		
		System.out.println("MateReplyVO:"+vo);
		
		int insertCount = service.register(vo);
		service.updateRepCnt(vo);
		
		log.info("count:"+insertCount);
		
		return insertCount ==1 
				? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/pages/{no}/{page}", 
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<MateReplyVO>> getList(
			@PathVariable("page") Integer page, @PathVariable("no") Long no){
		Criteria cri = new Criteria(page,10);
		
		log.info(cri);
		return new ResponseEntity<>(service.getList(cri, no), HttpStatus.OK);
	}
	
	@GetMapping(value ="/{mate_reply_no}",
			produces= {MediaType.APPLICATION_XML_VALUE,    //return값 xml/json
					   MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<MateReplyVO> get(@PathVariable("mate_reply_no")Long mate_reply_no){
		
		log.info("get:"+mate_reply_no);
		System.out.println(service.get(mate_reply_no));
		return new ResponseEntity<>(service.get(mate_reply_no),HttpStatus.OK);
	}
	
	@DeleteMapping(value="/{mate_reply_no}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("mate_reply_no") Long mate_reply_no){
		
		service.minusRepCnt(mate_reply_no);
		
		return service.remove(mate_reply_no)==1
				?new ResponseEntity<>("success", HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value="/{mate_reply_no}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody MateReplyVO vo,
			@PathVariable("mate_reply_no") Long mate_reply_no){
		
		vo.setMate_reply_no(mate_reply_no);
		
		log.info("mate_reply_no:" + mate_reply_no);
		log.info("MODIFY:" + vo);
		
		return service.modify(vo)==1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	

	
	@PutMapping("/repCntUpdate")
	public void repUpdate(@RequestBody Long noValue){
		System.out.println(noValue);
		service.minusRepCnt(noValue); 
	}
	
}
