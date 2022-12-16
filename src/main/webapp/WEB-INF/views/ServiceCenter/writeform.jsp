<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<html>
<script src="/resources/ckeditor/ckeditor.js"></script>

<link href="${pageContext.request.contextPath}/resources/css/review.css" rel="stylesheet">	
<link href="${pageContext.request.contextPath}/resources/css/mate-find.css" rel="stylesheet">


<form name="sub" action="/ServiceCenter/notice/write" method="post" onsubmit="Chk();" >
	<div style="width:60%; margin:0 auto;">
		<div class="review-write">공지사항 테스트</div>
			<textarea class="form-control title" id="name" name="name" placeholder="제목을 입력해주세요." style="width:912px;"></textarea>
		<div>
            <textarea class="editor" id = "content" name = "content"></textarea>
        </div>
		
		<span class="submit"><button type="button">등록</button></span>
		<span class="cancel"><button type="button">목록</button></span>
	</div>	
</form>		
	
	
	
	
	
<script>
CKEDITOR.replace('content',{
	filebrowserUploadUrl:'/review/imageUpload', height:'300px', width:'912px'}
);
</script>
<script type="text/javascript">
$(document).ready(function() {
	$(".submit").on("click",function(e){
			var content = $(".content");
			var formData = new FormData($("form")[0]);
			
			if (CKEDITOR.instances.content.getData().length < 1) {
			       alert("내용을 입력해주세요.");
				   return false;
			  }else{
			   document.sub.submit();
			};
		});
		
		
});
</script>
	

</html>





<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
