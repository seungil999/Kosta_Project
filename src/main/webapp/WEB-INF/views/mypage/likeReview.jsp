<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ include file="/WEB-INF/views/includes/sidebar.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">	
<link href="${pageContext.request.contextPath}/resources/css/review.css" rel="stylesheet">	

<div class="myp-title">관심 목록</div>
	<div class="main" style="margin-top:60px; width:880px; float:center; margin-left:283px; padding:30px;">
		<span class="bold">좋아요한 후기</span>
	<hr>
	<c:if test="${empty list}">
		<div style="text-align:center;"><img style="height:100px;" src="/resources/img/404.png"></div>
		<div style="text-align:center;">좋아요한 후기가 없습니다.</div>
	</c:if>
	<c:forEach items="${list}" var="review">
	<a class="move" href="/review/get?no=${review.no}">
	<c:choose>
		<c:when test="${empty review.thumbnail }">
			<span class="image"><img class="activity-Img" src="/resources/img/logo2.png" width=250; height=200;></span>
		</c:when>
		<c:otherwise>
			<span class="image">${review.thumbnail }</span>
		</c:otherwise>
	</c:choose>
		<span class="titleInfo">${review.title}</span></a>
		<span class="date">${review.regdate }</span>
		<br>
		<div class="content">${review.content }</div>
		<div class="content">작성자:${review.writer}</div>
		<div class="content">조회 ${review.hit} 좋아요 ${review.likecnt }</div>
		<div class="content" style="color:#42df2b; font-weight:bold;">모임명:${review.mate_activity}</div>
		<hr>
		</c:forEach>
	
	
</div>

	<div class="panel-body">

	<div style="text-align: center; margin-right:250px">
		<ul class="pagination">

			 <c:if test="${pageMaker.prev}">
				<li class="paginate_button previous"><a
					href="${pageMaker.startPage -1}">Previous</a></li>
			</c:if>

			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} " >
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next}">
				<li class="paginate_button next"><a
					href="${pageMaker.endPage +1 }">Next</a></li>
			</c:if>


		</ul>
	</div>
	</div>



<form id='actionForm' action="/mypage/likeReview" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

</form>






<script type="text/javascript">
$(document) .ready(function() {

	remove();
	function remove(){
	$('.content').find($('img')).remove();
	};
			var actionForm = $("#actionForm");
			
	    	$(".paginate_button a").on("click",
					function(e) {
			    		e.preventDefault();

						actionForm.find("input[name='pageNum']")
								.val($(this).attr("href"));
						actionForm.submit();
						
					});
		
			typeChange();
			function typeChange(){
				$(".content").each(function (index, item){
					var content = $(item).html();
					if(content.length>40){
					content=content.substring(0,40);
					$(item).html(content+"...");
					}
				});
				
			  };
		});
		
		
		
</script>










</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>