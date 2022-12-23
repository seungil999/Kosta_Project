<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 2. 관리자 검색 페이지 --%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>&#128421; 관리자 페이지 &#128421;</title>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<style>
#ContentDiv{
   padding-top: 100px;
}

</style>

<%-- ck editor --%>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(document).ready(function(){
	
 
   
   var sido = $('#sido_code option:selected').text();
   
   
    

  
 
});




</script>
</head>

<body>

<header>
<!-- navbar --> 
   <div class="w3-top">
      <ul class="w3-navbar w3-white w3-wide w3-padding-8 w3-card-2">
          <li><img src="${pageContext.request.contextPath}/resources/img/logo1.png" style="width: 152px; height: 45px;"></li>
         <li>
         <a href="/admin/main/list" class="w3-margin-left"><b>zupGozupUp</b>
              관리자 페이지</a></li>
         
         
         <!-- Float links to the right. Hide them on small screens -->
         <li class="w3-right w3-hide-small"> 
         <a href="/main" class="w3-left">사용자 홈페이지로</a> 
         <a href="/main" class="w3-left w3-margin-right">접속 종료</a></li>
      </ul>
   </div>
<!-- navbar end -->
</header>

<div  id="ContentDiv" class="container mt-3">

<br>

<!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
   <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" ><a href="/admin/main/list" class="btn">&nbsp;전체 회원&nbsp;</a></a>
    </li>
    <li class="nav-item">
      <a class="nav-link " data-bs-toggle="tab" href="/admin/search/main"><a href="/admin/search/main" class="btn">&nbsp;회원 검색&nbsp;</a></a>
    </li>
     <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" ><a href="/admin/report/main" class="btn">&nbsp;신고 내역 확인&nbsp;</a></a>
    </li>
     <li class="nav-item">
      <a class="nav-link active " data-bs-toggle="tab" ><a href="/admin/write/main" class="btn">&nbsp;<b>공지사항</b>&nbsp;</a></a>
    </li>
     <li class="nav-item">
      <a class="nav-link  " data-bs-toggle="tab" ><a href="/admin/question/main" class="btn">&nbsp;자주묻는 질문&nbsp;</a></a>
    </li>
  </ul>
<!-- Nav tabs end -->
	
	<!-- Tab panes -->
  <div class="tab-content">
    <div id="home" class="container tab-pane active"><br>
  	<h3>공지사항</h3>
  	<br>
  	<table>
  	<tr>
  	<td>
  	 <select name='type' id='type' class='form-select form-select' style="width: 200px;">
               <option value="notice"  class="lang-option">공지사항</option>
     </select>
   </td>
   
   
     </tr>
   </table>
    
     <br>
	</div>
</div>






<form name="sub" action="/admin/write" method="post" onsubmit="Chk();" >
	<div style="margin-left: 10px;">
		<div>
			<input type="text" name="name" value="" class="form-control" placeholder="제목을 입력하세요"/>
		</div>
		
		<div>
             <textarea class="editor" id = "content" name = "content"></textarea>
        </div>
		
		<br>
		
       		<span class="submit"><button type="button" style="float: right;" class="btn btn-success btn-sm" onsubmit="Chk();">등록</button> </span>
       		<span class="cancel"><button type="button" style="float: right; margin-right: 10px;" class="btn btn-sm btn-outline-success" >목록</button></span> 
   		
	</div>	
</form>		
	
	
	
	
	

<script type="text/javascript">
CKEDITOR.replace('content',{filebrowserUploadUrl:'/review/imageUpload', height:'300px'});
$(document).ready(function() {
	$(".submit").on("click",function(e){
			var content = $(".content");
			var formData = new FormData($("form")[0]);
			
			if (CKEDITOR.instances.content.getData().length < 1) {
			       alert("내용을 입력해주세요.");
				   return false;
			  }else{
			   document.sub.submit();
			   alert("공지사항이 등록되었습니다.");
			};
		});
		
	
		
});
</script>
</div>

</body>


<footer>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</footer>	

</html>

