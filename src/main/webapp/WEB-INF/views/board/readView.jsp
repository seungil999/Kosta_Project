<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<html>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/review.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mate-find.css" rel="stylesheet">		



<div class="review-title" style="margin-top:60px;">자유게시판</div> 
	<div class="review_main" style="width:1150px;">
		<br><br>
		<input type="hidden" id="no" value="${read.bno}">
		
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
				<li>
					<p>
					작성자 : ${replyList.writer}<br />
					작성 날짜 :  <fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" />
					</p>
					  
					<p>${replyList.content}</p>
					<div>
						<button type="button" class="replyUpdateBtn btn btn-warning" data-rno="${replyList.rno}">수정</button>
						<button type="button" class="replyDeleteBtn btn btn-danger" data-rno="${replyList.rno}">삭제</button>
					</div>
				</li>
			</c:forEach>   
		</ol>
	</div>

<form name="replyForm" method="post" class="form-horizontal">
	<input type="hidden" id="bno" name="bno" value="${read.bno}" />
	<input type="hidden" id="page" name="page" value="${scri.page}"> 
	<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
	<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
	<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 

	<div class="form-group">
		<label for="writer" class="col-sm-2 control-label">댓글 작성자</label>
		<div class="col-sm-10">
			<input type="text" id="writer" name="writer" class="form-control" />
		</div>
	</div>
	
	<div class="form-group">
		<label for="content" class="col-sm-2 control-label">댓글 내용</label>
		<div class="col-sm-10">
			<input type="text" id="content" name="content" class="form-control"/>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button" class="replyWriteBtn btn btn-success">작성</button>
		</div>
	</div>
</form>

					
</div>		
		
		
		
		
		
		<form name="readForm" role="form" method="post">
			<input type="hidden" id="bno" name="bno" value="${read.bno}" />
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
				location.href = "/board/replyUpdateView?bno=${read.bno}"
								+ "&page=${scri.page}"
								+ "&perPageNum=${scri.perPageNum}"
								+ "&searchType=${scri.searchType}"
								+ "&keyword=${scri.keyword}"
								+ "&rno="+$(this).attr("data-rno");
			});
			
			//댓글 삭제 View
			$(".replyDeleteBtn").on("click", function(){
				location.href = "/board/replyDeleteView?bno=${read.bno}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${scri.searchType}"
					+ "&keyword=${scri.keyword}"
					+ "&rno="+$(this).attr("data-rno");
			});
		})
	</script>
	
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</html>