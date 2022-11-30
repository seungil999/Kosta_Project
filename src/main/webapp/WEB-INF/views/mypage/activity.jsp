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
	
	<div class="activity-Info">
	<span class="myp-image"><img class="activity-Img" src="/resources/img/기본프로필.png"></span>
		 <div class="myp-titleInfo">서울 특별시 남산 플로깅</div>
	
		 <div class="myp-info">4명 / 6명</div>
		 <div class="myp-info">2022년 10월 24일 여의도역</div>
	</div>	 
	<br><br><br><br>
	<div class="activity-Info">
	<span class="myp-image"><img class="activity-Img" src="/resources/img/기본프로필.png"></span>
		 <div class="myp-titleInfo">서울 특별시 남산 플로깅</div>
	
		 <div class="myp-info">4명 / 6명</div>
		 <div class="myp-info">2022년 10월 24일 여의도역</div>
	</div>
	<br><br><br><br><br>
	<span class="myp-allview"><a href="/mypage/finish">전체보기 ></a></span>
	<div class="bold">종료된 활동내역</div>
<hr>
	<div class="activity-Info">
		<span class="myp-image"><img class="activity-Img" src="/resources/img/기본프로필.png"></span>
			 <div class="myp-titleInfo">서울 특별시 남산 플로깅</div>
		
			 <div class="myp-info">4명 / 6명</div>
			 <div class="myp-info">2022년 10월 24일 여의도역</div>
			 <button type="button" class="uploadbtn">후기작성</button>
		</div>
		<br><br>
		<div class="activity-Info">
		<span class="myp-image"><img class="activity-Img" src="/resources/img/기본프로필.png"></span>
			 <div class="myp-titleInfo">서울 특별시 남산 플로깅</div>
		
			 <div class="myp-info">4명 / 6명</div>
			 <div class="myp-info">2022년 10월 24일 여의도역</div>
			 <button type="button" class="uploadbtn">후기작성</button>
	</div>
	<br><br>
	
	
	</div>

<script type="text/javascript">
	$(document).on("click", '.uploadbtn', function(e){
		location.href="/review/writeForm";
		console.log("click!");
	});
</script>
	
</html>





<%@ include file="/WEB-INF/views/includes/footer.jsp" %>