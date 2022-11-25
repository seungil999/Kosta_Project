<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    
<div class="sidebar">
	<div class="profile">
		<img src="/resources/img/기본프로필.png">
	</div>
		<div class="nickname">닉네임</div>
	<div>
		<button type="button" class="modInfo">프로필 수정 <i class="fa fa-pencil" aria-hidden="true"></i></button>
	</div>
	<div class="list">
		<div class="sidebar-bold">내 활동 내역</div>
		<div class="sidebar-normal"><a href="/mypage/schedule">나의 플로깅 활동</a></div>
		<div class="sidebar-normal"><a href="/mypage/schedule">예정된 활동</a></div>
		<div class="sidebar-normal"><a href="/mypage/finish">완료한 활동</a></div>
		<div class="sidebar-normal"><a href="/mypage/diaryList">플로깅 다이어리</a></div>
	</div>
		<hr>
	<div class="list">
			<div class="sidebar-bold">관심 목록</div>
			<div class="sidebar-normal"><a href="/mypage/likeActivity">좋아요한 활동</a></div>
			<div class="sidebar-normal"><a href="/mypage/likeRecom">좋아요한 추천장소</a></div>
		</div>
		<hr>
		<div class="list">
			<div class="sidebar-bold">내글관리</div>
			<div class="sidebar-normal"><a href="/mypage/mate">메이트모집</a></div>
			<div class="sidebar-normal"><a href="/mypage/free">자유게시판</a></div>
			<div class="sidebar-normal"><a href="/mypage/review">후기</a></div>
		</div>	
		<hr>
		<div class="list">
			<div class="sidebar-normal"><a href="/mypage/withdraw">회원탈퇴</a></div>
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