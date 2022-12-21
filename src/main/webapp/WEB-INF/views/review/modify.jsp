<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<html>
<script src="/resources/ckeditor/ckeditor.js"></script>

<link href="${pageContext.request.contextPath}/resources/css/review.css" rel="stylesheet">	
<link href="${pageContext.request.contextPath}/resources/css/mate-find.css" rel="stylesheet">


<form name="sub" action="/review/modify" method="post" onsubmit="Chk();" >
	<div style="width:60%; margin:0 auto;">
		<div class="review-write">후기</div>
			<textarea class="form-control title" id="title" name="title" style="width:912px;">${review.title}</textarea>
		<div>
            <textarea class="editor" id = "content" name = "content">${review.content}</textarea>
        </div>
		
		<span class="submit"><button type="button">수정</button></span>
		<span class="cancel"><button type="button">목록</button></span>
	</div>
	
	
	  <input type='hidden' id='rev_no' name='rev_no' value='<c:out value="${review.rev_no}"/>'>
	  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
	  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
	  <input type='hidden' name='filter' value='<c:out value="${cri.filter}"/>'>  
	
</form>		

	<form id='operForm' action="/review/list" method="get">
	  <input type='hidden' id='rev_no' name='rev_no' value='<c:out value="${review.rev_no}"/>'>
	  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
	  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
	  <input type='hidden' name='filter' value='<c:out value="${cri.filter}"/>'>  
	</form>
	
	
<script>
CKEDITOR.replace('content',{filebrowserUploadUrl:'/review/imageUpload', height:'300px'}
);

</script>
<script type="text/javascript">
$(document).ready(function() {

	  var operForm = $("#operForm"); 
		
	  $(".cancel").on("click", function(e){
	    operForm.find("#rev_no").remove();
	    operForm.attr("action","/review/list")
	    operForm.submit();
	  });
		
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
