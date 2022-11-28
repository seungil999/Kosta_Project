package com.kosta.jupjup.controller;

import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

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
import com.kosta.jupjup.vo.MateCreateVO;




@Controller
@RequestMapping("/Mate/*")
public class MateCreateController {
	
	@Autowired
	ServletContext servletontext;
	@Autowired
	MateCreateService matecreateservice;
	
	@GetMapping("/MateCreateMain")
	
	public String MateCreateMaingmain () {
//      로그인 후 메이트 모집 메인화며으로 이동할 수 있는 작업 sessionScope? 
//		if(id==null) {
//			alert("로그인/회원가입 후 메이트 모집을 해주세요.");
//			retrun "로그인/회원가입 화면으로 이동";
//		} else {
		return "/MateCreate/MateCreateMain";
//		}
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
		model.addAttribute("matecreate", matecreatevo);
		if(matecreatevo.getImage().isEmpty() ) {
			matecreatevo.setImage("기본이미지.jpg");
		}
		System.out.println(matecreatevo);
		matecreateservice.matecreate(matecreatevo);
		
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
