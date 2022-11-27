package com.kosta.jupjup.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosta.jupjup.service.ReviewLikeService;
import com.kosta.jupjup.service.ReviewReplyService;
import com.kosta.jupjup.service.ReviewService;
import com.kosta.jupjup.vo.Criteria;
import com.kosta.jupjup.vo.MateLikeVO;
import com.kosta.jupjup.vo.PageVO;
import com.kosta.jupjup.vo.ReviewVO;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	
	
	@Autowired
	ReviewService reviewService;
	@Autowired
	ReviewLikeService LikeService;
	@Autowired
	ReviewReplyService replyService;
	
	 
	@GetMapping("/list")  
	  public String list(Criteria cri, Model model) {
    
	  model.addAttribute("list", reviewService.getlist(cri)); 
	  
	  int total = reviewService.getTotal(cri);
	  model.addAttribute("pageMaker", new PageVO(cri, total));
	  
	  return "/review/list";  
	  }
	
	@GetMapping("/writeForm")
	public String writeForm() {
		
		return "/review/writeForm";
	} 
	
	@PostMapping("/imageUpload")
	public void imageUpload(HttpServletRequest request,
            HttpServletResponse response, MultipartHttpServletRequest multiFile
            , @RequestParam MultipartFile upload) {
		UUID uid = UUID.randomUUID();
        
        OutputStream out = null;
        PrintWriter printWriter = null;
        
        //인코딩
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        
        try{
            
            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();
           
            //이미지 경로 생성
            String path = "C:\\upload\\ck";
            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
            
            //해당 디렉토리 확인
            if(!folder.exists()){
                try{
                    folder.mkdirs(); // 폴더 생성
                }catch(Exception e){
                    e.getStackTrace();
                }
            }
            
            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화
            
            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = "/review/ckImgSubmit?uid=" + uid + "&fileName=" + fileName;  // 작성화면
            
        // 업로드시 메시지 출력
          printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
          printWriter.flush();
            
        }catch(IOException e){
            e.printStackTrace();
        } finally {
          try {
           if(out != null) { out.close(); }
           if(printWriter != null) { printWriter.close(); }
          } catch(IOException e) { e.printStackTrace(); }
         }
        
        return;
    }
	
	@RequestMapping(value="/ckImgSubmit")
	public void ckSubmit(@RequestParam(value="uid") String uid,@RequestParam(value="fileName") String fileName
            , HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException{
		
		String path = "C:\\upload\\ck";
		String sDirPath = path + uid + "_" + fileName;
		File imgFile = new File(sDirPath);
		
		if(imgFile.isFile()) {
			byte[] buf = new byte[1024];
			int readByte = 0;
			int length = 0;
			byte[] imgBuf = null;
			
			FileInputStream fileInputStream = null;
			ByteArrayOutputStream outputStream = null;
			ServletOutputStream out = null;
			
			try {
				fileInputStream = new FileInputStream(imgFile);
				outputStream = new ByteArrayOutputStream();
                out = response.getOutputStream();
                
                while((readByte = fileInputStream.read(buf)) != -1){
                    outputStream.write(buf, 0, readByte);
                }
                
                imgBuf = outputStream.toByteArray();
                length = imgBuf.length;
                out.write(imgBuf, 0, length);
                out.flush();
			}catch(IOException e) {
				e.printStackTrace();
			}finally {
				outputStream.close();
				fileInputStream.close();
				out.close();
			}
		}
	
	}
	


	@GetMapping({ "/get", "/modify" })
	  public void get(@RequestParam("no") Long no, @ModelAttribute("cri") Criteria cri,Model model) {
		
		model.addAttribute("review", reviewService.get(no));
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
	}
	
	@PostMapping("/write")
	public String write(Model model,@ModelAttribute ReviewVO rvo) {
		System.out.println(rvo.toString());
		
		reviewService.write(rvo);
		
		return "/review/list";
	}
	
}
