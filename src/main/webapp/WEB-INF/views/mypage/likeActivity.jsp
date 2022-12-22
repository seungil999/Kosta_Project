<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ include file="/WEB-INF/views/includes/sidebar.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap" rel="stylesheet">
<head>
<style>
body{
	font-family: 'Yeon Sung', cursive;
}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">	

<div class="myp-title">관심 목록</div>
	<div class="main">
		<span class="bold">좋아요한 활동</span>
	<hr>
	<c:if test="${empty list}">
		<div style="text-align:center;">좋아요한 활동이 없습니다.</div>
	</c:if>
	<c:forEach items="${list }" var="mate">	
		<div class="activity-Info">
		<span class="myp-image"><img class="activity-Img" src="/Mate/display?fileName=${mate.image}"/></span>
			 <div class="myp-titleInfo"><a href="/matefind/get?no=${mate.mate_no}">${mate.activityname}</a></div>
		
			 <div class="myp-info">${mate.peoplenum}명 / ${mate.peoplemaxnum}명</div>
			 <div class="myp-info" id="meetingdate">${mate.meetingdate}</div>
			 <div class="myp-info">${mate.meetingplace}</div>
		</div>	 
		<br><br><br><br>
	</c:forEach>
	
	</div>
<div class="panel-body ">

	<div style="text-align: center; margin-right:250px;">
		<ul class="pagination">

			 <c:if test="${pageMaker.prev}">
				<li class="paginate_button previous"><a
					href="${pageMaker.startPage -1}">Previous</a></li>
			</c:if>

			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""} " >
					<a href="${num}">${num}</a>
				</li>
				
			</c:forEach>
			<c:if test="${pageMaker.next}">
			<li class="paginate_button next"><a
					href="${pageMaker.startPage +1 }">Next</a>	
			</c:if>

		</ul>
	</div>
	<!--  end Pagination -->
</div>	


<form id='actionForm' action="/mypage/likeActivity" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>	
</form>

<script type="text/javascript">
	
$(document).ready(function() {		
	var actionForm = $("#actionForm");
	
   	$(".paginate_button a").on("click",
			function(e) {
				e.preventDefault();
				actionForm.find("input[name='pageNum']")
						.val($(this).attr("href"));
				actionForm.submit();
				
			})
		});
</script>

















</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>