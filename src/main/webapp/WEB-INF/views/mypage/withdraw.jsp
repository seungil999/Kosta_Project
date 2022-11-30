<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ include file="/WEB-INF/views/includes/sidebar.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">	



<div class="myp-title">회원탈퇴</div>
	<div class="main">
		<div class="bold">회원탈퇴</div>
	<hr>
	<h2>회원 탈퇴 주의사항</h2>
	<p>ZupgoZupup 온라인/모바일 로그인 및 게시판이용 불가, 일반계정 삭제
	   회원탈퇴 시 ZupgoZupup에 로그인할 수 없습니다.
	   작성 했던 모든 게시글 및 모든 모임이 삭제됩니다.</p>
	   
	 <textarea rows="1" class="form-control id" placeholder="비밀번호를 입력해주세요" ></textarea>
	 <input type="checkbox">위의 회원 탈퇴 시 주의사항을 모두 확인하였습니다.<br>
	 <button class="withdraw">회원탈퇴</button>
</div>


















</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>