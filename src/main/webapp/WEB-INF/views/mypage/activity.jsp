<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!DOCTYPE html>

<html>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">	

<div class="sidebar">
	<div class="profile">
		<img src="/resources/img/기본프로필.png">
	</div>
		<div class="nickname">닉네임</div>
	<div>
		<button type="button" class="modInfo">프로필 수정 <i class="fa fa-pencil" aria-hidden="true"></i></button>
	</div>
	<div class="list">
		<div class="sidebar-bold">나의 플로깅 활동</div>
		<div class="sidebar-normal">예정된 활동</div>
		<div class="sidebar-normal">완료한 활동</div>
		<div class="sidebar-normal">플로깅 다이어리</div>
	</div>
		<hr>
	<div class="list">
			<div class="sidebar-bold">관심 목록</div>
			<div class="sidebar-normal">좋아요한 활동</div>
			<div class="sidebar-normal">좋아요한 추천장소</div>
		</div>
		<hr>
		<div class="list">
			<div class="sidebar-bold">내글관리</div>
			<div class="sidebar-normal">메이트모집</div>
			<div class="sidebar-normal">자유게시판</div>
			<div class="sidebar-normal">후기</div>
		</div>	
		<hr>
		<div class="list">
			<div class="sidebar-normal">회원탈퇴</div>
		</div>
</div>
		<div class="bold">내 활동 내역</div>
<div class="main">
	<span class="bold">참여중인 활동내역</span>
	 <span class="normal">전체보기 ></span>
</div>




<script type="text/javascript">
$(document).ready(function(){
	  var currentPosition = parseInt($(".sidebar").css("top"));
	  $(window).scroll(function() {
	    var position = $(window).scrollTop(); 
	    $(".sidebar").stop().animate({"top":position+currentPosition+"px"},1000);
	  });
	});
</script>



</html>







<%@ include file="/WEB-INF/views/includes/footer.jsp" %>