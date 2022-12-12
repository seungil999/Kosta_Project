package com.kosta.jupjup.controller;

import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.http.HttpRequest;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.jupjup.service.MateCreateService;
import com.kosta.jupjup.service.MateJoinService;
import com.kosta.jupjup.vo.MateCreateVO;
import com.kosta.jupjup.vo.MateJoinVO;
import com.kosta.jupjup.vo.UserVO;

import lombok.extern.log4j.Log4j2;



@Log4j2
@Controller
@RequestMapping("/Mate/*")
public class MateCreateController {
	@Autowired
	HttpServletRequest request;
	@Autowired
	ServletContext servletontext;
	@Autowired
	MateCreateService matecreateservice;
	@Autowired
	MateJoinService matejoinservice;
	@GetMapping("/MateCreateMain")
	
	public String MateCreateMaingmain (HttpServletRequest request) {
		 
		return "/MateCreate/MateCreateMain";
		
	}
	
	@GetMapping("/Flashgathering")
	public String Flashgatheringmain () {
		return "/MateCreate/FlashgatheringMain";
	}
	
	@GetMapping("/Flashgathering1")
	public String Flashgatheringmain1 () {
		return "/MateCreate/FlashgatheringMain1";
	}
	
	@GetMapping("/Regularmeeting")
	public String Regularmeetingmain () {
		return "/MateCreate/RegularmeetingMain";
	}
	
	
	@PostMapping("/matecreate")
	public String matecreate(Model model, @ModelAttribute MateCreateVO matecreatevo) {
		 HttpSession session = request.getSession();
		 UserVO uservo = (UserVO) session.getAttribute("userVO");
		
		
		model.addAttribute("matecreate", matecreatevo);
		if(matecreatevo.getImage().isEmpty() ) {
			matecreatevo.setImage("기본이미지.jpg");
		}
		System.out.println(matecreatevo);
		if(matecreatevo.getRegular()==1) {
		SimpleDateFormat meetingDateFormat = new SimpleDateFormat("yyyyMMdd");
		String date = meetingDateFormat.format(matecreatevo.getMeetingdate());
		String time = Integer.toString(matecreatevo.getMeetingtime());
		if(time.length()==1) {
			time="000"+time;
		}else if(time.length()==2) {
			time="00"+time;
		}else if(time.length()==3) {
			time="0"+time;
		}
		String yymm = date+time;
		
		System.out.println(yymm);

		matecreatevo.setTimestamp(yymm);
		}else {
			LocalDate now = LocalDate.now();
			
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
			String date = now.format(formatter);
			String time = Integer.toString(matecreatevo.getMeetingtime());
			if(time.length()==1) {
				time="000"+time;
			}else if(time.length()==2) {
				time="00"+time;
			}else if(time.length()==3) {
				time="0"+time;
			}
			
			
			String yymm = date+time;
			System.out.println(yymm);

			matecreatevo.setTimestamp(yymm);
		}
		
		matecreateservice.matecreate(matecreatevo);
		MateJoinVO mjv = new MateJoinVO();
		Long no = matecreateservice.getThisNo(uservo.getId());
		mjv.setNo(no);
		mjv.setUserid(uservo.getId());
		matejoinservice.joinInsert(mjv);
		matejoinservice.joinUpdate(mjv);
		return "redirect:/matefind/list";
	}
	 
	@GetMapping("/images/{filename}")
	public void viewImages(@PathVariable String filename, HttpServletResponse response) {
		String path = servletontext.getRealPath("/images/");
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(path+filename);
			OutputStream out = response.getOutputStream();
			FileCopyUtils.copy(fis, out);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(fis!=null) {
				try {
					fis.close();
				} catch(Exception e) {
					
		
				}
			}
		}
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
