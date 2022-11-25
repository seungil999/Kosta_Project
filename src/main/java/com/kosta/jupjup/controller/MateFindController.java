package com.kosta.jupjup.controller;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosta.jupjup.service.MateFindService;
import com.kosta.jupjup.service.MateJoinService;
import com.kosta.jupjup.service.MateLikeService;
import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.MateJoinVO;
import com.kosta.jupjup.vo.MateLikeVO;
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
	   
	  @GetMapping({ "/get", "/modify" })
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
	  
//	  @GetMapping("/img/{filename}")
//		public void viewImage(@PathVariable String filename, HttpServletResponse response) {
//			String path = servletcontext.getRealPath("/resources/img/");
//			FileInputStream fis = null;
//			
//			File file = new File(path, filename);
//		    
//			try {
//				Thumbnails
//		        .of(new File(path, filename))
//		        .forceSize(40, 40)
//		        .toFile(new File(path, "s_"+filename));
//				
//				fis = new FileInputStream(path+ "s_"+filename);
//				OutputStream out = response.getOutputStream();
//				FileCopyUtils.copy(fis, out);
//			}catch(Exception e) {
//				e.printStackTrace();
//			}finally {
//				if(fis!=null) {
//					try {
//						fis.close();
//					}catch(Exception e) {}
//				} 
//			}
//		}
//	  
//	  @GetMapping("/getimg/{filename}")
//		public void getviewImage(@PathVariable String filename, HttpServletResponse response) {
//			String path = servletcontext.getRealPath("/resources/img/");
//			FileInputStream fis = null;
//			
//			File file = new File(path, filename);
//		    
//			try {
//				Thumbnails
//		        .of(new File(path, filename))
//		        .forceSize(130, 130)
//		        .toFile(new File(path, "g_s_"+filename));
//				
//				fis = new FileInputStream(path+ "g_s_"+filename);
//				OutputStream out = response.getOutputStream();
//				FileCopyUtils.copy(fis, out);
//			}catch(Exception e) {
//				e.printStackTrace();
//			}finally {
//				if(fis!=null) {
//					try {
//						fis.close();
//					}catch(Exception e) {}
//				} 
//			}
//		}
	
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
