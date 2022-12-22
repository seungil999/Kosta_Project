package com.kosta.jupjup.controller;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.jupjup.paging.Criteria;
import com.kosta.jupjup.paging.PageVO;
import com.kosta.jupjup.service.MateFindService;
import com.kosta.jupjup.service.MateJoinService;
import com.kosta.jupjup.service.MateLikeService;
import com.kosta.jupjup.vo.MateJoinVO;
import com.kosta.jupjup.vo.MateLikeVO;
import com.kosta.jupjup.vo.MateVO;
import com.kosta.jupjup.vo.ReportVO;
import com.kosta.jupjup.vo.UserVO;

@Controller
@RequestMapping("/matefind/*")
public class MateFindController {

	@Autowired
	MateFindService MateFindService;

	@Autowired
	MateLikeService LikeService;

	@Autowired
	MateJoinService JoinService;

	@Autowired
	ServletContext servletcontext;

	// 1. 메이트 찾기 메인
	@GetMapping("/list")
	public String list(Criteria cri, Model model) {
		
		LocalTime now = LocalTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HHmm");
		String formatedNow = now.format(formatter);
		
		int getTime = Integer.parseInt(formatedNow);
		cri.setCurrenttime(getTime);


		if ("".equals(cri.getMeeting()) || cri.getMeeting() == null) {
			model.addAttribute("active", "all");
		} else if (cri.getMeeting().equals("0")) {
			model.addAttribute("active", "flash");
		} else if (cri.getMeeting().equals("1")) {
			model.addAttribute("active", "regular");
		}

		int total = MateFindService.getTotal(cri);
		model.addAttribute("pageMaker", new PageVO(cri, total));
		model.addAttribute("list", MateFindService.getlist(cri));
		
		return "/mateFind/list";
	}

	
	 @GetMapping("/get")
	  public String get(@RequestParam("no") Long no, @ModelAttribute("cri") Criteria cri, Model model,
			  HttpServletRequest request) {
	  HttpSession session = request.getSession();
	  UserVO uservo = (UserVO) session.getAttribute("userVO");
	  model.addAttribute("mate", MateFindService.get(no));
	  
	  MateLikeVO likeVO = new MateLikeVO();
	  likeVO.setMate_no(no);
	  
	  
	  Integer like = null;
	  if(uservo!=null) {
		  likeVO.setUser_id(uservo.getId());
		  like = LikeService.likeGetInfo(likeVO);
	  }
	  model.addAttribute("like", like);
	  
	  
	  MateJoinVO joinVO = new MateJoinVO();
	  joinVO.setMate_no(no);
	  
	  Integer join = null;
	  
	  if(uservo!=null) { //로그인이 되어있으면
		joinVO.setUser_id(uservo.getId());  
		join = JoinService.joinGetInfo(joinVO);	//모임 참여여부를 확인하기위함 
	  }
	  model.addAttribute("join", join);
	  
	  List<UserVO> inUsers = MateFindService.mateInUsers(no);
	  model.addAttribute("users", inUsers);
	  
	  Integer reportChk=null;
	  if(uservo != null) {
	  reportChk = MateFindService.reportChk(uservo.getId(), no);
	  }
	  model.addAttribute("reportChk", reportChk);
	  
	  return "/mateFind/get";
	}

	@GetMapping("/modify")
	public String modify(@RequestParam("no") Long no, @ModelAttribute("cri") Criteria cri, Model model) {

		model.addAttribute("mate", MateFindService.get(no));

		return "/mateFind/modify";
	}

	@PostMapping("/modify")
	public String modify(MateVO vo, Criteria cri, RedirectAttributes rttr) {

		if (MateFindService.modify(vo)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/matefind/list" + cri.getListLink();
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("no") Long no, Criteria cri, RedirectAttributes rttr) {

		if (MateFindService.remove(no)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/matefind/list" + cri.getListLink();
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

	@PostMapping("/report")
	public String report(ReportVO vo, Criteria cri, Model model) {
		System.out.println(vo.toString());
		Integer reportChk = null;

		reportChk = MateFindService.reportChk(vo.getReport_writer(), vo.getMate_no());

		if (reportChk != 1) {
			int count = MateFindService.report(vo);
			MateFindService.reportUpdate(vo.getMate_no());
		}
		model.addAttribute("reportChk", reportChk);
		return "redirect:/matefind/get?no=" + vo.getMate_no();
	}

	@ResponseBody
	@PostMapping("/repReportChk")
	public ResponseEntity<String> replyReport(@RequestBody ReportVO vo) {
		System.out.println(vo.toString());
		Integer insertCount = MateFindService.repReportChk(vo);

		return insertCount == 0 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@PostMapping("/repReport")
	public String repReport(ReportVO vo, Model model) {

		int count = MateFindService.repReport(vo);

		return "redirect:/matefind/get?no=" + vo.getMate_no();
	}

}
