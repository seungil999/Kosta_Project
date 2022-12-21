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
import com.kosta.jupjup.service.ReviewReplyService;
import com.kosta.jupjup.vo.ReviewReplyVO;
import com.kosta.jupjup.vo.ReviewReplyVO;

import lombok.extern.log4j.Log4j2;

@RequestMapping("/reviewReplies/")
@RestController
@Log4j2
public class ReviewReplyController {
 
	@Autowired
	private ReviewReplyService service;
	
	//작성
	@PostMapping(value ="/new",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReviewReplyVO vo){
		
		log.info("ReviewReplyVO:"+vo);
		
		int insertCount = service.register(vo);
		service.updateRepCnt(vo);
		
		log.info("count:"+insertCount);
		
		return insertCount ==1 
				? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/pages/{rev_no}/{page}", 
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<ReviewReplyVO>> getList(
			@PathVariable("page") Integer page, @PathVariable("rev_no") Long rev_no){
		Criteria cri = new Criteria(page,10);
		
		log.info(cri);
		System.out.println(service.getList(cri, rev_no));
		return new ResponseEntity<>(service.getList(cri, rev_no), HttpStatus.OK);
	}
	
	@GetMapping(value ="/{rev_rno}",
			produces= {MediaType.APPLICATION_XML_VALUE,    //return값 xml/json
					   MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReviewReplyVO> get(@PathVariable("rev_rno")Long rev_rno){
		
		log.info("get:"+rev_rno);
		System.out.println(service.get(rev_rno));
		return new ResponseEntity<>(service.get(rev_rno),HttpStatus.OK);
	}
	
	@DeleteMapping(value="/{rev_rno}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rev_rno") Long rev_rno){
		
		log.info("remove:"+rev_rno);
		service.minusRepCnt(rev_rno);
		return service.remove(rev_rno)==1
				?new ResponseEntity<>("success", HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value="/{rev_rno}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReviewReplyVO vo,
			@PathVariable("rev_rno") Long rev_rno){
		
		vo.setRev_rno(rev_rno);
		
		log.info("rev_rno:" + rev_rno);
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
