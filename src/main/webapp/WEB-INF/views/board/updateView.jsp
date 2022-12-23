<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<link href="${pageContext.request.contextPath}/resources/css/review.css" rel="stylesheet">	
<link href="${pageContext.request.contextPath}/resources/css/mate-find.css" rel="stylesheet">
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	 		<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
	</head>

	<body>
	
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/board/update">
				<div style="width:60%; margin:0 auto;">
				<div class="review-write">자유게시판</div>
					<input type="hidden" name="fno" value="${update.fno}" readonly="readonly"/>
					<textarea class="form-control title" id="title" name="title"  placeholder="제목을 입력해주세요." style="width:912px;"><c:out value="${update.title}" /></textarea>
								
								
									<label for="content"></label><textarea id="content" name="content"class="chk" title="내용을 입력하세요"><c:out value="${update.content}" /></textarea>
							
									<label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${update.writer}" readonly="readonly"/>
							
									<label for="regdate">작성날짜</label>
									<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd"/>					
						
					<div>
						<button type="submit" class="update_btn">수정하기</button>
						<button type="submit" class="cancel_btn">취소</button>
					</div>
					</div>
				</form>
			</section>
			<hr />
	
		<script>
CKEDITOR.replace('content',{
	filebrowserUploadUrl:'/review/imageUpload', height:'300px', width:'912px'}
);

</script>


  <script type="text/javascript">
      $(document).ready(function(){
         
         $(".cancel_btn").on("click", function(){
            event.preventDefault();
            location.href = "/board/list";
         })
      })
   
   </script>
   <script type="text/javascript">
      $(document).ready(function(){
         var formObj = $("form[name='updateForm']");
         
         $(".cancel_btn").on("click", function(){
            event.preventDefault();
            location.href = "/board/list";
         })
         
         $(".update_btn").on("click", function(){
            if(fn_valiChk()){
               return false;
            }
            formObj.attr("action", "/board/update");
            formObj.attr("method", "post");
            formObj.submit();
         })
      })
         
      function fn_valiChk(){
         var updateForm = $("form[name='updateForm'] .chk").length;
         for(var i = 0; i<updateForm; i++){
            if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
               alert($(".chk").eq(i).attr("title"));
               return true;
            }
         }
      }
      
      
      $(".cancel_btn").on("click", function(){
         event.preventDefault();
         location.href = "/board/readView?fno=${update.fno}"
               + "&page=${scri.page}"
               + "&perPageNum=${scri.perPageNum}"
               + "&searchType=${scri.searchType}"
               + "&keyword=${scri.keyword}";
      })
   </script>
	</body>
</html>