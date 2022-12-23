<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<html>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/review.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mate-find.css" rel="stylesheet">		
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap" rel="stylesheet">
<style>
body{
	font-family: 'Yeon Sung', cursive;
}
</style>

<body>
<div style="width:1000px;margin: 0 auto;">
	<div class="flashOrRegular">
		<h2 style="margin-left:-70; margin-bottom:50;">자유게시판</h2>
	</div>
</div> 
	
	<div class="review_main" style="width:1150px; margin-top: 10px;">
		<br><br>
		<input type="hidden" id="fno" value="${read.fno}">
		
		<div class="title-bold">제목</div>
		<div class="get-title">${read.title}</div>
		<div class="get-top">
			<div class="get-act" >${read.hit}</div><div class="act-bold">조회</div>
			<div class="get-writer">${read.writer}</div><div class="wri-bold">작성자</div>
		</div>
		<br>
		<hr style="background:#ccc; border:0; height:1px; ">
		<div class="get-writer"><fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" /></div><div class="act-bold">작성일</div>
		<br>
	<div>
		<div class="title-bold"	>내용</div>
		<div class="content" style="min-height:300px;">${read.content}</div>
		<button type="button" class="list_btn uploadbtn">목록</button>	
		<hr style="background:#ccc; border:0; height:1px; ">
				
	</div>
	<c:if test="${userVO.id eq read.user_id}">
	<button id='remove' type="button" class="delete_btn modrem">삭제</button>		
	<button id='modify' type="button" class="update_btn modrem">수정</button>
	</c:if>
	
     <br><br>  
      
	<img id="reply" src="/resources/img/말풍선.png" alt="" width="30px" height="30px">
	댓글&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<hr style="background:#ccc; border:0; height:1px; ">
<!-- 댓글 -->
	<div id="reply">
		<ol class="replyList">
		
				
				
				
			<c:forEach items="${replyList}" var="replyList">
				<li  class='replyList' style="list-style: none">
					<div>
					<c:if test="${userVO.id eq replyList.writer}">
						<button type="button" id="rembtn" class="replyDeleteBtn" data-frno="${replyList.frno}">삭제</button>
						<button type="button" id="rembtn" class="replyUpdateBtn" data-frno="${replyList.frno}" style="margin-right:2px;">수정</button>
					</c:if>
					</div>
					<div class='header'><strong class= 'primary-font'>${replyList.writer}</strong>
					
					
					<small class='repDate'><fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" /></small>
					<p class='repContent'>${replyList.content}</p></div>
				</li>
			</c:forEach>   
		</ol>
	</div>

<form name="replyForm" method="post" class="form-horizontal">
	<input type="hidden" id="fno" name="fno" value="${read.fno}" />
	<input type="hidden" id="page" name="page" value="${scri.page}"> 
	<input type="hidden" id="writer" name="writer" value="${userVO.id}"> 
	<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
	<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
	<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 

<c:if test="${userVO ne null }">
	<div class="form-group">
		<label for="writer" class="col-sm-2 control-label" style="margin-top:-8px;">댓글 작성자</label>
		<div class="col-sm-10" >
			${userVO.nickname }
		</div>
	</div>
	
	<div class="form-group">
		<label for="content" class="col-sm-2 control-label">댓글 내용</label>
		<div class="col-sm-10">
			<input type="text" id="content" name="content" class="form-control" style="height:90px;"/>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button" class="replyWriteBtn uploadbtn" style="float:right; margin-right:50px;">작성</button>
		</div>
	</div>
	</c:if>
</form>

					
</div>		
		
		
		
		
		
		<form name="readForm" role="form" method="post">
			<input type="hidden" id="fno" name="fno" value="${read.fno}" />
			<input type="hidden" id="page" name="page" value="${scri.page}"> 
			<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
		</form>
		
	</body>
	
	
	<script type="text/javascript">
		
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/board/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				
				var deleteYN = confirm("삭제하시겠습니까?");
				if(deleteYN == true){
					
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
					
				}
			})
			
			// 목록
			$(".list_btn").on("click", function(){
				
				location.href = "/board/list?page=${scri.page}"
						      +"&perPageNum=${scri.perPageNum}"
						      +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})
			
			$(".replyWriteBtn").on("click", function(){
				var formObj = $("form[name='replyForm']");
				formObj.attr("action", "/board/replyWrite");
				formObj.submit();
			});
			
			//댓글 수정 View
			$(".replyUpdateBtn").on("click", function(){
				location.href = "/board/replyUpdateView?fno=${read.fno}"
								+ "&page=${scri.page}"
								+ "&perPageNum=${scri.perPageNum}"
								+ "&searchType=${scri.searchType}"
								+ "&keyword=${scri.keyword}"
								+ "&frno="+$(this).attr("data-frno");
			});
			
			//댓글 삭제 View
			$(".replyDeleteBtn").on("click", function(){
				location.href = "/board/replyDeleteView?fno=${read.fno}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${scri.searchType}"
					+ "&keyword=${scri.keyword}"
					+ "&frno="+$(this).attr("data-frno");
			});
		})
	</script>
	</body>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</html>