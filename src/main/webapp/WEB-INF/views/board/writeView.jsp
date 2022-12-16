<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<link href="${pageContext.request.contextPath}/resources/css/review.css" rel="stylesheet">	
<link href="${pageContext.request.contextPath}/resources/css/mate-find.css" rel="stylesheet">
<html>
	<head>
	<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>자유게시판</title>
	</head>
	
	<body>
		<form name="writeForm" method="post" action="/board/write" enctype="multipart/form-data">
			<div style="width:60%; margin:0 auto;">
				<div class="review-write">자유게시판</div>
					<textarea class="form-control title" id="title" name="title" placeholder="제목을 입력해주세요." style="width:912px;"></textarea>
					<input type="hidden" id="writer" name="writer" value="${userVO.nickname}">
					<input type="hidden" id="user_id" name="user_id" value="${userVO.id}">
				<div>
		                <textarea class="editor" id = "content" name = "content"></textarea>
		        </div>
				<span class="submit"><button type="button">등록</button></span>
				<span class="cancel"><button type="button">목록</button></span>
			</div>		
		</form>
	
	</body>
<script>
CKEDITOR.replace('content',{
	filebrowserUploadUrl:'/review/imageUpload', height:'300px', width:'912px'}
);

</script>
	
		<script type="text/javascript">
	/* 	$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				
				formObj.submit();
			});
			fn_addFile();
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
		function fn_addFile(){
			var fileIndex = 1;
			//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
		} */
	</script>
	
	

<script type="text/javascript">
$(document).ready(function() {

		$(".cancel").on("click",function(e){
			location.href="/board/list";
		})
	
		
	$(".submit").on("click",function(e){
			var content = $(".content");
			var formData = new FormData($("form")[0]);
			var title = $(".title");
			if (CKEDITOR.instances.content.getData().length < 1) {
			       alert("내용을 입력해주세요.");
				   return false;
			  }else if(title.val()==""){
					alert("제목을 입력해주세요.");
					   return false;
			  }else{
			   document.writeForm.submit();
			};
		});
		
		
});
</script>
</html>