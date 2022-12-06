<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ include file="/WEB-INF/views/includes/sidebar.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>

<html>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">	


<div class="myp-title">내 활동 내역</div>
	<div class="main">
		<span class="bold">참여중인 활동내역</span>
		 <span class="myp-allview"><a href="/mypage/schedule">전체보기 ></a></span>
	<hr>
	<c:forEach items="${mate }" var="mate">
		<div class="activity-Info">
		<span class="myp-image"><img class="activity-Img" src="/Mate/display?fileName=${mate.image}"/></span>
			 <div class="myp-titleInfo"><a href="/matefind/get?no=${mate.no}">${mate.activityname}</a></div>
		
			 <div class="myp-info">${mate.peoplenum}명 / ${mate.peoplemaxnum}명</div>
			 <div class="myp-info" id="meetingdate">${mate.meetingdate}</div>
			 <div class="myp-info">${mate.meetingplace}</div>
		</div>	 
		<br><br><br><br>
	</c:forEach>

	<br>
	<span class="myp-allview"><a href="/mypage/finish">전체보기 ></a></span>
	<div class="bold">종료된 활동내역</div>
<hr>
	<c:forEach items="${emate }" var="emate">
	<div class="activity-Info">
		<span class="myp-image"><img class="activity-Img" src="/Mate/display?fileName=${emate.image}"/></span>
			 <div class="myp-titleInfo">${emate.activityname }</div>
			 <div class="myp-info">${emate.peoplenum }명 / ${emate.peoplemaxnum }명</div>
			 <div class="myp-info">${emate.meetingdate }</div>
			 <div class="myp-info">${emate.meetingplace }</div>
			 <button type="button" data-no="${emate.no}" class="uploadbtn">후기작성</button>
		</div>

<br><br>
	</c:forEach>	
	<br><br>
	
	
	</div>

<script type="text/javascript">
	$(document).on("click", '.uploadbtn', function(e){
	
	 var no = $(this).data("no");
	
	 location.href="/review/writeForm?no="+no;
	 
		
	});
</script>


	
</html>





<%@ include file="/WEB-INF/views/includes/footer.jsp" %>