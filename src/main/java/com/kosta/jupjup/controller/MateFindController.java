package com.kosta.jupjup.controller;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.jupjup.service.MateFindService;
import com.kosta.jupjup.service.MateJoinService;
import com.kosta.jupjup.service.MateLikeService;
import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.MateJoinVO;
import com.kosta.jupjup.vo.MateLikeVO;
import com.kosta.jupjup.vo.MateVO;
import com.kosta.jupjup.vo.PageVO;

@Controller
@RequestMapping("/matefind/*")
public class MateFindController {
 
	  @Autowired 
	  MateFindService service;
	  @Autowired
	  MateLikeService LikeService;
	  @Autowired
	  MateJoinService JoinService;
	  @Autowired
	  ServletContext servletcontext;
	  
	  @GetMapping("/list")  
	  public String list(Criteria cri, Model model) {
      LocalTime now = LocalTime.now();
	  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HHmm");
	  String formatedNow = now.format(formatter);
	  int getTime = Integer.parseInt(formatedNow);
	  cri.setCurrenttime(getTime);
		  
	  Criteria criteria = new Criteria();
	  
	  model.addAttribute("list", service.getlist(cri)); 
	  
	  if("".equals(cri.getMeeting())||cri.getMeeting()==null){
		  model.addAttribute("active", "all");  
	  }else if(cri.getMeeting().equals("0")){
		  model.addAttribute("active", "flash");
	  }else if(cri.getMeeting().equals("1")) {
		  model.addAttribute("active", "regular");
	  }
	  
	  
	  
	  
	  int total = service.getTotal(cri);
	  model.addAttribute("pageMaker", new PageVO(cri, total));
	  
	  return "/mateFind/list";  
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
	  
	  @GetMapping("/modify")
	  public String modify(@RequestParam("no") Long no, @ModelAttribute("cri") Criteria cri, Model model) {

	  model.addAttribute("mate", service.get(no));
	  
	  return "/mateFind/modify";
	}
	  
	  @PostMapping("/modify")
		public String modify(MateVO vo, Criteria cri, RedirectAttributes rttr) {

				if (service.modify(vo)) {
				rttr.addFlashAttribute("result", "success");
			}

			return "redirect:/matefind/list" + cri.getListLink();
		}
		
		 @PostMapping("/remove")
			 public String remove(@RequestParam("no") Long no, Criteria cri,
			 RedirectAttributes rttr) {
		
			 if (service.remove(no)) {
			 rttr.addFlashAttribute("result", "success");
			 }
			 
			 return "redirect:/matefind/list"+cri.getListLink();
			 }

	
		 	// 회원가입폼
			@RequestMapping("user/joinPage")
			String showJoin() {
				return "/user/joinPage";
			}
			// 로그인폼
			@RequestMapping("user/loginPage")
			String showlogin() {
				return "/user/loginPage";
			}
}
