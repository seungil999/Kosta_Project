package com.kosta.jupjup.controller;

import java.lang.module.FindException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.jupjup.service.AdminLoginService;
import com.kosta.jupjup.service.UserService;
import com.kosta.jupjup.vo.ManagerVO;
import com.kosta.jupjup.vo.UserVO;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/user/*")
public class UserController {


   @Autowired
   private UserService userService;
   
   @Autowired
   private AdminLoginService adminLoginService;

   // 가입화면
   @GetMapping("/joinPage")
   public String userjoin() {
      return "/user/joinPage";
   }

   // 중복처리메서드
   @ResponseBody
   @PostMapping(value = "/idCheck")
   public int idCheck(@RequestBody String id) {
      System.out.println("***id :" + id);

      // 중복체크 함수
      int result = userService.idCheck(id);
      System.out.println("***중복 시 1/ 실패시 0" + result);

      return result;
   }

   // 닉네임중복처리메서드
   @ResponseBody
   @PostMapping(value = "/nicknameCheck")
   public int nicknameCheck(@RequestBody String nickname) {
      System.out.println("***닉네임 : " + nickname);

      // 닉네임중복체크 함수
      int result = userService.nicknameCheck(nickname);
      System.out.println("***닉네임 중복시 1 아니명 0: " + result);

      return result;
   }

   // 가입요청
   @ResponseBody
   @RequestMapping(value = "/join", method = RequestMethod.POST)
   public String JoinForm(UserVO vo, RedirectAttributes RA) {
      System.out.println("***가입폼에서 받아온 정보");
      System.out.println(vo.toString());
      System.out.println(vo.getNickname());
      System.out.println(vo.getId());
      
      if(userService.idCheck(vo.getId())== 1 || userService.nicknameCheck(vo.getNickname())== 1) {
         RA.addFlashAttribute("msg", "가입실패. 다시 시도하세요");
         return "N";
      }else{
         userService.join(vo);
         RA.addFlashAttribute("msg", "가입을 축하합니다.");
         return "Y";
      }
      
      /*
      if (userService.join(vo) == 1) { // 가입성공
         userService.join(vo);
         RA.addFlashAttribute("msg", "가입을 축하합니다.");
         return "/user/loginPage";
      } else  {// 가입실패
         RA.addFlashAttribute("msg", "가입실패. 다시 시도하세요");
         return "/user/joinpage";
      }*/
      
   }

   // 로그인화면
   @GetMapping(value = "/loginPage")
   public String userLogin() {
      return "/user/loginPage";
   }

   //로그인 요청 
      @RequestMapping (value = "/loginPage", method = RequestMethod.POST)
      public String loginForm(UserVO vo,ManagerVO mvo, HttpSession session, Model model) {
         
         System.out.println(mvo);
         //로그인처리
         UserVO userVO = userService.login(vo);
         ManagerVO ManagerVO = adminLoginService.login(mvo) ;
         System.out.println(ManagerVO);
         System.out.println("로그인 정보 : "+userVO);
         System.out.println("관리자 정보 : "+ManagerVO);
         
         if (ManagerVO != null) {
            System.out.println("관리자!");
            session.setAttribute("ManagerVO", ManagerVO);
            return "redirect:/admin/main/list";
         } else if(userVO != null) {
            System.out.println("일반유저!");
            session.setAttribute("userVO", userVO);
            return "main";
         } else {
            model.addAttribute("msg","로그인 실패, 아이디 비밀번호를 확인하세요.");
            return "user/loginPage";
         }
      }
      
    // 로그아웃
    
     @RequestMapping("/logout") public String logout(HttpSession session) {
    session.invalidate(); 
    System.out.println("logout");
    return "redirect:/"; }
    

      // 이메일 중복
      @PostMapping("/emaildupchk")
      @ResponseBody
      public Map<String, Integer> emaildupchk(String email) throws Exception{
         Map<String, Integer> map = new HashMap<>();
         
         try {
            userService.selectByEmail(email);
            map.put("status", 1);
         } catch (Exception e) {
            e.printStackTrace();
            map.put("status", -1);
         }
         return map;
      }
      
   // 이메일가입인증
   @Autowired
   JavaMailSender mailSender;

   @ResponseBody
   @RequestMapping(value = "/emailAuth", method = RequestMethod.POST)
   public String emailAuth(String email) {
      System.out.println("여기까지 오는지");
      Random random = new Random();
      String key = ""; // 인증번호
      System.out.println("***이메일:" + email);
      SimpleMailMessage message = new SimpleMailMessage();
      message.setTo(email); // 스크립트에서 보낸 메일을 받을 사용자 이메일 주소
      message.setFrom("hayeriniya@naver.com");
      // 입력 키를 위한 코드
      for (int i = 0; i < 3; i++) {
         int index = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성
         key += (char) index;
      }
      int numIndex = random.nextInt(9999) + 1000; // 4자리 랜덤 정수를 생성
      key += numIndex;
      message.setSubject("인증번호 입력을 위한 메일 전송");
      message.setText("인증 번호 : " + key);
      mailSender.send(message);
      return key;

   }
   // 아이디 찾기
      @RequestMapping("/findId")
      @ResponseBody
      public Map<String, Object> findId(String email) throws FindException{
         Map<String, Object> map = new HashMap<>();
         String id ;

         try {
            id = userService.selectFindId(email);
            
            String from = "hayeriniya@naver.com";
            String to = email;
            String subject = "ZupupZupgo 아이디 찾기";
            String content = 
                  "ZupupZupgo을 방문해주셔서 감사합니다." +
                  "<br><br>" +
                  "회원님의 아이디는  " +id + " 입니다";
            
            map.put("status", 1);
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8"); // true는 멀티파트 메세지를 사용하겠다는 의미
            
            mailHelper.setFrom(from);
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true);
            
            mailSender.send(mail);
         }catch(Exception e){
            e.printStackTrace();
            map.put("status", -1);
         }
         return map;
      }
      
      // 비밀번호 찾기
      @RequestMapping("/findPwd")
      @ResponseBody
      public Map<String, Object> findPwd(String id, String email) throws FindException{
         Map<String, Object> map = new HashMap<>();
         System.out.println("비번 찾기");
         try {
            String pwd = userService.selectFindPwd(id,email);
            System.out.println(pwd);
            String from = "hayeriniya@naver.com";
            String to = email;
            String subject = "ZupupZupgo 비밀번호 찾기";
            String content = 
                  "ZupupZupgo을 방문해주셔서 감사합니다." +
                        "<br><br>" +
                        id + "님의 비밀번호는  " + pwd + " 입니다";
            map.put("status", 1);
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8"); // true는 멀티파트 메세지를 사용하겠다는 의미
            
            mailHelper.setFrom(from);
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true);
            
            mailSender.send(mail);
         }catch(Exception e){
            e.printStackTrace();
            map.put("status", -1);
         }
         return map;

      }
      
      @GetMapping("/findPassword")
      public String findPwdPage() {
         return "/user/findPwd"; 
      }
      
      @GetMapping("/finduserId")
      public String findIdPage() {
         return "/user/findId"; 
      }
}