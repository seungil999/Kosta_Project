package com.kosta.jupjup.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.jupjup.service.MyPageService;
import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.MateJoinVO;
import com.kosta.jupjup.vo.MateVO;
import com.kosta.jupjup.vo.PageVO;
import com.kosta.jupjup.vo.UserVO;

@Controller
@RequestMapping("/mypage/*")
public class MyPageController {
	@Autowired
	HttpServletRequest request;
	@Autowired
	MyPageService service;
	
	@GetMapping("/activity")
	public String activity(Model model) { 
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("userVO");
		
		model.addAttribute("mate",service.getMate(vo.getId()));
		model.addAttribute("emate",service.endMate(vo.getId()));
		System.out.println(service.getMate(vo.getId()));
		return "/mypage/activity";
	}
	@GetMapping("/schedule")
	public String schedule(Model model,Criteria cri) {
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("userVO");
		
		
		  model.addAttribute("list", service.getMateList(cri,vo.getId())); 
		
		return "/mypage/schedule";
	}
	
	
	@GetMapping("/finish")
	public String finish(Model model,Criteria cri) { 
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("userVO");
		int total = service.getEndActivityTotal(vo.getId());
		model.addAttribute("list", service.getlist(cri,vo.getId())); 
		model.addAttribute("pageMaker", new PageVO(cri, total));
		  
		
		
		return "/mypage/finish";
	}
	
	
	@GetMapping("/likeActivity")
	public String likeActivity(Model model,Criteria cri) { 
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("userVO");
		
		model.addAttribute("list", service.getLikeActivity(cri,vo.getId())); 
		
		int total = service.getLikeActivityTotal(vo.getId());
		model.addAttribute("pageMaker", new PageVO(cri, total));
		return "/mypage/likeActivity";
	}
	@GetMapping("/likeReview")
	public String likeReview(Model model,Criteria cri) { 
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("userVO");
		  
		model.addAttribute("list", service.getLikeReivew(cri,vo.getId())); 
		  
		  
		int total = service.getLikeReviewTotal(vo.getId());
		model.addAttribute("pageMaker", new PageVO(cri, total));
		
		return "/mypage/likeReview";
	}
	@GetMapping("/likeRecom")
	public String likeRecom() { 
		
		return "/mypage/likeRecom";
	}
	
	@GetMapping("/mate")
	public String mate(Criteria cri, Model model) {
	      HttpSession session = request.getSession();
		  UserVO vo = (UserVO) session.getAttribute("userVO");
		  
		  model.addAttribute("list", service.getMateList(cri,vo.getId())); 
		  
		  
		  int total = service.getMateTotal(vo.getId());
		  model.addAttribute("pageMaker", new PageVO(cri, total));
		  
		  return "/mypage/mate";  
		  }
	@GetMapping("/free")
	public String free() { 
		
		return "/mypage/free";
	}
	@GetMapping("/review")
	public String review(Criteria cri, Model model) {
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("userVO");
		  
		model.addAttribute("list", service.getReviewList(cri,vo.getId())); 
		  
		  
		int total = service.getReviewTotal(vo.getId());
		model.addAttribute("pageMaker", new PageVO(cri, total));
		return "/mypage/review";
	}
	@GetMapping("/withdraw")
	public String withdraw() { 
		
		return "/mypage/withdraw";
	}
	@PostMapping("/withdraw")
	public String UserWithdraw() {
	HttpSession session = request.getSession();
	UserVO vo = (UserVO) session.getAttribute("userVO");
	
	service.withdraw(vo.getId());
	service.deleteMate(vo.getId());
	service.deleteReview(vo.getId());
	session.invalidate();
	return "redirect:/";
	}
	@GetMapping("/profile")
	public String profile() { 
		
		return "/mypage/profile";
	}
	
	@PostMapping("/profileUpdate")
	public String profileUpdate(@ModelAttribute UserVO vo, HttpSession session) {
		System.out.println(vo);
		
		int update = service.userUpdate(vo);
		System.out.println(update);
		session.setAttribute("userVO", vo);
		return "/mypage/profile";
	}
	
	@GetMapping("/getProfile")
	public String getProfile(String id,Model model) {
		model.addAttribute("user",service.getProfile(id));
		
		return "/mypage/getProfile";
	}
	
	@GetMapping("/info")
	public String diaryList(Model model) { 
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("userVO");
		
		  SimpleDateFormat format = new SimpleDateFormat("HHmm");  
		  
		  List<MateVO> time = service.getTime(vo.getId()); 
		  
		  
		  int totalMinute = 0;
		  for(int i=0; i<time.size(); i++) {
			  
			  Date d1 = null;
			  Date d2 = null;
			  try {
				 String pStime =  Integer.toString(time.get(i).getStarttime()); //string으로 변환
				 String pEtime =  Integer.toString(time.get(i).getEndtime());
			
				 
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
		  
		  int total = service.getEndActivityTotal(vo.getId());
		  
		  map.put("count", total);
		  
		  
		  
		  LocalDate nowDate = LocalDate.now();
		  int Iyear = nowDate.getYear();
		  String year = Integer.toString(Iyear).substring(2,4)+"/";
		  List<MateVO> totalActivity = service.getTotalActivity(year,vo.getId());
		  List<String> jan = new ArrayList<String>();
		  List<String> feb = new ArrayList<String>();
		  List<String> mar = new ArrayList<String>();
		  List<String> apr = new ArrayList<String>();
		  List<String> may = new ArrayList<String>();
		  List<String> june = new ArrayList<String>();
		  List<String> july = new ArrayList<String>();
		  List<String> aug = new ArrayList<String>();
		  List<String> sept = new ArrayList<String>();
		  List<String> oct = new ArrayList<String>();
		  List<String> nov = new ArrayList<String>();
		  List<String> dec = new ArrayList<String>();
		  
		  for(int i=0; i<totalActivity.size(); i++) {
			  String date = totalActivity.get(i).getMeetingdate().toString();
			  System.out.println(date);
			  if(date.contains("-01-")) {
				  jan.add(date);
			  }else if(date.contains("-02-")) {
				  feb.add(date);
			  }else if(date.contains("-03-")) {
				  mar.add(date);
			  }else if(date.contains("-04-")) {
				  apr.add(date);
			  }else if(date.contains("-05-")) {
				  may.add(date);
			  }else if(date.contains("-06-")) {
				  june.add(date);
			  }else if(date.contains("-07-")) {
				  july.add(date);
			  }else if(date.contains("-08-")) {
				  aug.add(date);
			  }else if(date.contains("-09-")) {
				  sept.add(date);
			  }else if(date.contains("-10-")) {
				  oct.add(date);
			  }else if(date.contains("-11-")) {
				  nov.add(date);
			  }else if(date.contains("-12-")) {
				  dec.add(date);
			  }
		  }
		  map.put("jan", jan.size());
		  map.put("feb", feb.size());
		  map.put("mar", mar.size());
		  map.put("apr", apr.size());
		  map.put("may", may.size());
		  map.put("june", june.size());
		  map.put("july", july.size());
		  map.put("aug", aug.size());
		  map.put("sept", sept.size());
		  map.put("oct", oct.size());
		  map.put("nov", nov.size());
		  map.put("dec", dec.size());
		  
		  int regular=0;
		  int flash=0;
		  List<MateVO> regularList = service.getRegular(vo.getId());
		  for(int i=0; i<regularList.size(); i++) {
			  if(regularList.get(i).getRegular()==1) {
				  regular+=1;
			  }else {
				  flash+=1;
			  }
		  }
		  map.put("regular", regular);
		  map.put("flash", flash);
		  map.put("year", Iyear);
		  int grade=1;
		  if(total/10 >=3) {
			  grade=3;
		  }else if(total/10 ==2) {
			  grade=2;
		  }else {
			  grade=1;
		  }
		  map.put("grade", grade);
		  
		  model.addAttribute("time",map);
		return "/mypage/info";
	}
	
}
