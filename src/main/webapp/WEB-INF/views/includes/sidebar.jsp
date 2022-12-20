<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/mate-find.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
  
<head>
</head>  
<div class="sidebar">
	<div class="profile">
		<img src='/Mate/display?fileName=${userVO.profile}' style="height:150px; width:200px;">
	</div>
	<br>
		<div class="nickname" style="margin-left:0px;">${userVO.nickname }</div>
		<fieldset>
  	
</fieldset>
	<br>
	<div>
		<button type="button" class="modInfo" onclick="location.href='/mypage/profile'">프로필 수정
		 <i class="fa fa-pencil" aria-hidden="true"></i></button>
	</div>
	<br>
	<div class="list">
		<div class="sidebar-bold">내 활동 내역</div>
		<div class="sidebar-normal"><a href="/mypage/activity">&nbsp;나의 플로깅 활동</a></div>
		<div class="sidebar-normal"><a href="/mypage/schedule">&nbsp;예정된 활동</a></div>
		<div class="sidebar-normal"><a href="/mypage/finish">&nbsp;완료한 활동</a></div>
	</div>
		<hr style="margin-top:0px; margin-bottom:0px;">
	<div class="list">
			<div class="sidebar-bold">관심 목록</div>
			<div class="sidebar-normal"><a href="/mypage/likeActivity">&nbsp;좋아요한 활동</a></div>
			<div class="sidebar-normal"><a href="/mypage/likeReview">&nbsp;좋아요한 후기</a></div>
			<div class="sidebar-normal"><a href="/mypage/likeRecom">&nbsp;좋아요한 추천장소</a></div>
		</div>
		<hr style="margin-top:0px; margin-bottom:0px;">
		<div class="list">
			<div class="sidebar-bold">내글관리</div>
			<div class="sidebar-normal"><a href="/mypage/mate">&nbsp;메이트모집</a></div>
			<div class="sidebar-normal"><a href="/mypage/free">&nbsp;자유게시판</a></div>
			<div class="sidebar-normal"><a href="/mypage/review">&nbsp;후기</a></div>
		</div>	
		<hr style="margin-top:0px; margin-bottom:0px;">	
		<div class="list">
			<div class="sidebar-normal"><a href="/mypage/info">&nbsp;내 정보</a></div>
			<div class="sidebar-normal"><a href="/mypage/withdraw">&nbsp;회원탈퇴</a></div>
		</div>
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