package com.kosta.jupjup.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.kosta.jupjup.service.BoardService;
import com.kosta.jupjup.service.ReplyService;
import com.kosta.jupjup.vo.BoardVO;
import com.kosta.jupjup.vo.PageMaker;
import com.kosta.jupjup.vo.ReplyVO;
import com.kosta.jupjup.vo.SearchCriteria;


@Controller
@RequestMapping("/board/*")
public class BoardController {
	
private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardService service;
	@Autowired
	ReplyService replyService;
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/board/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("writeView");
		
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/board/write", method = RequestMethod.POST)
	public String write(BoardVO boardVO) throws Exception{
		logger.info("write");
		
		service.write(boardVO);
		
		return "redirect:/board/list";
	}
	
	//미사용
	// ck 에디터에서 파일 업로드
 	@PostMapping("/resources/ckUpload")
 	public void postCKEditorImgUpload(HttpServletRequest req, HttpServletResponse res, @RequestParam MultipartFile upload) throws Exception {
 	 logger.info("post CKEditor img upload");
 	 
 	 String uploadPath = req.getSession().getServletContext().getRealPath("/").concat("resources");
 	 System.out.println("uploadPath  : "+uploadPath);
 	 // 랜덤 문자 생성
 	 UUID uid = UUID.randomUUID();
 	 
 	 OutputStream out = null;
 	 PrintWriter printWriter = null;
 	   
 	 // 인코딩
 	 res.setCharacterEncoding("utf-8");
 	 res.setContentType("application/json");
 	 
 	 try {
 	  
 	  String fileName =  upload.getOriginalFilename(); // 파일 이름 가져오기
 	  byte[] bytes = upload.getBytes();
 	  
 	  // 업로드 경로
 	  String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" +fileName;
 	  
 	  out = new FileOutputStream(new File(ckUploadPath));
 	  out.write(bytes);
 	  out.flush(); // out에 저장된 데이터를 전송하고 초기화
 	  
 	  //String callback = req.getParameter("CKEditorFuncNum");
 	  printWriter = res.getWriter();
 	  String fileUrl = "/ckUpload/" + uid + "_" +fileName; // 작성화면
 	  // 업로드시 메시지 출력
 	  JsonObject json = new JsonObject();
 	  json.addProperty("uploaded", 1);
 	  json.addProperty("fileName", fileName);
 	  json.addProperty("url", fileUrl);
 	  printWriter.println(json);
 	  
 	  printWriter.flush();
 	  System.out.println("test url : "+req.getSession().getServletContext().getRealPath("resouces/ckUpload"));
 	  System.out.println("url : "+fileUrl);
 	  System.out.println("ckUploadPath : "+ckUploadPath);
 	 } catch (IOException e) { e.printStackTrace();
 	 } finally {
 	  try {
 	   if(out != null) { out.close(); }
 	   if(printWriter != null) { printWriter.close(); }
 	  } catch(IOException e) { e.printStackTrace(); }
 	 }
 	 
 	 return; 
 	}
	
	// 게시판 목록 조회
		@RequestMapping(value = "/board/list", method = RequestMethod.GET)
		public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
			logger.info("list");
			
			model.addAttribute("list", service.listPage(scri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(service.listCount(scri));
			
			model.addAttribute("pageMaker", pageMaker);
			
			return "board/list";
			
		}
		// 게시판 조회
		@RequestMapping(value = "/readView", method = RequestMethod.GET)
		public String read(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
			logger.info("read");
			
			model.addAttribute("read", service.read(boardVO.getFno()));
			model.addAttribute("scri", scri);
			
			List<ReplyVO> replyList = replyService.readReply(boardVO.getFno());
			model.addAttribute("replyList",replyList);
			
			
			
			return "board/readView";
		}
		// 게시판 수정뷰
		@RequestMapping(value = "/updateView", method = RequestMethod.GET)
		public String updateView(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
			logger.info("updateView");
			
			model.addAttribute("update", service.read(boardVO.getFno()));
			model.addAttribute("scri", scri);
			
			return "board/updateView";
		}
		
		// 게시판 수정
		@RequestMapping(value = "/update", method = RequestMethod.POST)
		public String update(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
			logger.info("update");
			
			service.update(boardVO);
			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/board/list";
		}

		// 게시판 삭제
		@RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String delete(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
			logger.info("delete");
			
			service.delete(boardVO.getFno());
			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/board/list";
		}
		
		//댓글 작성
		@RequestMapping(value="/replyWrite", method = RequestMethod.POST)
		public String replyWrite(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");
			System.out.println(vo);
			replyService.writeReply(vo);
			
			rttr.addAttribute("fno", vo.getFno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/board/readView";
		}
		
		
		//댓글 수정 GET
		@RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
		public String replyUpdateView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
			logger.info("reply Write");
			
			model.addAttribute("replyUpdate", replyService.selectReply(vo.getFrno()));
			model.addAttribute("scri", scri);
			
			return "board/replyUpdateView";
		}
		
		//댓글 수정 POST
		@RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
		public String replyUpdate(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");
			
			replyService.updateReply(vo);
			
			rttr.addAttribute("fno", vo.getFno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/board/readView";
		}
		
		
		//댓글 삭제 GET
		@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
		public String replyDeleteView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
			logger.info("reply Write");
			
			model.addAttribute("replyDelete", replyService.selectReply(vo.getFrno()));
			model.addAttribute("scri", scri);
			

			return "board/replyDeleteView";
		}
		
		//댓글 삭제
		@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
		public String replyDelete(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");
			
			replyService.deleteReply(vo);
			
			rttr.addAttribute("fno", vo.getFno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/board/readView";
		}

}