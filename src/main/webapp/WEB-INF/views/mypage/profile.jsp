<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ include file="/WEB-INF/views/includes/sidebar.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">	

<div class="myp-title">프로필 수정</div>
	<div class="main">
		<div class="bold">회원정보 수정</div>
	<hr>
	

	<textarea rows="1" class="form-control id" readonly></textarea><div class="my-info">아이디</div>
	
	<textarea rows="1" class="form-control id"></textarea><div class="my-info">비밀번호</div>
	<button class="modrem">프로필 사진 변경</button>
	<textarea rows="1" class="form-control id"></textarea><div class="my-info">이름</div>
	<button class="modrem">중복확인</button>
	<textarea rows="1" class="form-control id"></textarea><div class="my-info">닉네임</div>
	<button class="modrem">중복확인</button>
	<textarea rows="1" class="form-control id"></textarea><div class="my-info">이메일</div>
	<button class="modrem">본인인증</button>
	<textarea rows="1" class="form-control id"></textarea><div class="my-info">휴대폰</div>
	<div class="gender">성별</div><div class="radio">
	<div><input  type="radio" id="man" name="gender" value="man"><label for="man" class="my-label">남자</label></div>
	<div class="nbsp"><input type="radio" id="woman" name="gender" value="woman"><label class="my-label" for="woman">여자</label></div>
	</div>
	
	<br><br>
</div>

















</html>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>