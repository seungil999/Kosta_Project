package com.kosta.jupjup.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosta.jupjup.service.MateFindService;
import com.kosta.jupjup.service.MateJoinService;
import com.kosta.jupjup.service.MateLikeService;
import com.kosta.jupjup.service.TimeService;
import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.MateJoinVO;
import com.kosta.jupjup.vo.MateLikeVO;
import com.kosta.jupjup.vo.MateVO;
import com.kosta.jupjup.vo.PageVO;

@Controller 
public class MainController {
 
	 @Autowired 
	  MateFindService service;
	  @Autowired
	  MateLikeService LikeService;
	  @Autowired
	  MateJoinService JoinService;
	  @Autowired
	  ServletContext servletcontext;
	  @Autowired
	  TimeService timeService;
	  
	  @GetMapping("/")  
	  public String main(Criteria cri, Model model) {
	  LocalTime now = LocalTime.now();
	  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HHmm");
	  String formatedNow = now.format(formatter);
	  int getTime = Integer.parseInt(formatedNow);
	  cri.setCurrenttime(getTime);
		  
	  model.addAttribute("list", service.getBestlist(cri)); 
	  
	  
	  int total = service.getTotal(cri);
	  model.addAttribute("pageMaker", new PageVO(cri, total));
	  
	 
//	  /** 전체 회원 총 활동시간 **/
//	  SimpleDateFormat format = new SimpleDateFormat("HHmm");  
//
//	  List<MateVO> starttime = timeService.getStime(); 
//	  List<MateVO> endtime = timeService.getEtime();
	  /** 전체 회원 이번달 활동시간 **/
	  SimpleDateFormat format = new SimpleDateFormat("HHmm");  
	  LocalDate nowDate = LocalDate.now();
	  int Imonth = nowDate.getMonthValue();
	  int Iyear = nowDate.getYear();
	  String year = Integer.toString(Iyear);
	  String month = Integer.toString(Imonth);
	  
	  System.out.println(year+month);
	  List<MateVO> starttime = timeService.getStime(year+month); 
	  List<MateVO> endtime = timeService.getEtime(year+month);
	  
	  int totalMinute = 0;
	  for(int i=0; i<starttime.size(); i++) {
		  
		  Date d1 = null;
		  Date d2 = null;
		  try {
			 String pStime =  Integer.toString(starttime.get(i).getStarttime()); //string으로 변환
			 String pEtime =  Integer.toString(endtime.get(i).getEndtime());
		
			 
			 if(pStime.length() ==3) {
				 pStime = "0"+pStime;
			 }else if(pStime.length() ==2) {
				 pStime = "00"+pStime;
			 }else if(pStime.length() ==1) {
				 pStime = "000"+pStime;
			 } 
			 if(pEtime.length() ==3) {
				 pEtime = "0"+pEtime;
			 }else if(pEtime.length() ==2) {
				 pEtime = "00"+pEtime;
			 }else if(pEtime.length() ==1) {
				 pEtime = "000"+pEtime;
			 }
			 
			 
			  d1 = format.parse(pStime);  //날짜형식으로
			  d2 = format.parse(pEtime);
		  }catch(ParseException e) {
			  e.printStackTrace();
		  }
		  long diff = d2.getTime() - d1.getTime();
		  long diffMinutes = diff / (60 * 1000);
		  
		  totalMinute+=diffMinutes;
		  
		  }
	  System.out.println("총 "+totalMinute+"분");
	  
	  int totalH = totalMinute/60;
	  int totalM = totalMinute%60;
	  Map<String, Integer> map = new HashMap<String, Integer>();
	  map.put("HH", totalH);
	  map.put("MM", totalM);
	  System.out.println(map.get("HH"));
	  System.out.println(map.get("MM"));
	  
	  
	  
	  int flash = timeService.getFlash(year+month);
	  int regular = timeService.getRegular(year+month);
	  
	  map.put("flash", flash);
	  map.put("regular", regular);
	  
	  model.addAttribute("time",map);
	  
	  return "/main";  
	  }
	  
	  @GetMapping("/get")
	  public String get(@RequestParam("no") Long no, @ModelAttribute("cri") Criteria cri, Model model) {

	  model.addAttribute("mate", service.get(no));
	  
	  MateLikeVO likeVO = new MateLikeVO();
	  likeVO.setNo(no);
	  // like.setUserno(0);
	
	  int like = 0;
	  int check = LikeService.likeCount(likeVO);
	
	  if(check==0) {
		  LikeService.likeInsert(likeVO);
	  }else if(check==1) {
		  like = LikeService.likeGetInfo(likeVO);
	  }
	  model.addAttribute("like", like);
	  
	  
	  MateJoinVO joinVO = new MateJoinVO();
	  joinVO.setNo(no);
	  
	  int join = 0;
	  int joincheck = JoinService.joinCount(joinVO);
	  
	  if(joincheck==0) {
		  JoinService.joinInsert(joinVO);
	  }else if(joincheck==1) {
		  join = JoinService.joinGetInfo(joinVO);
	  }
	  model.addAttribute("join", join);
	  
	  return "/mateFind/get";
	}
	
	 @GetMapping("/MainDetail")
	 private String MainDetail() {
		 
		 return "/MainDetail";
	 }
}
