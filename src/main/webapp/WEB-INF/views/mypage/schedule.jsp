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
		<span class="bold">예정된 활동</span>
	<hr>
	<c:if test="${empty list}">
		<div style="text-align:center;"><img style="height:100px;" src="/resources/img/404.png"></div>
		<div style="text-align:center;">참여중인 활동이 없습니다.</div>
	</c:if>
	<c:forEach items="${list }" var="mate">	
		<div class="activity-Info">
		<span class="myp-image"><img class="activity-Img" src="/Mate/display?fileName=${mate.image}"/></span>
			 <div class="myp-titleInfo"><a href="/matefind/get?no=${mate.no}">${mate.activityname}</a></div>
		
			 <div class="myp-info">${mate.peoplenum}명 / ${mate.peoplemaxnum}명</div>
			 <div class="myp-info" id="meetingdate">${mate.meetingdate}</div>
			 <div class="myp-info">${mate.meetingplace}</div>
		</div>	 
		<br><br><br><br>
	</c:forEach>
	
</div>

















</html>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>