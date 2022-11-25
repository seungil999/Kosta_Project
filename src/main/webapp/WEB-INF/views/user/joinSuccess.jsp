<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JBlog</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jblog.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.3.min.js"></script>
</head>
<body>
	<div class="center-content">
				
		<!-- logo header-->
 	<!--	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>-->
 		<!-- logo header end -->
		
		<p class="welcome-message">
			<span> 감사합니다. 회원 가입 성공.
		    </span>
			<br><br>
			<a href="${pageContext.request.contextPath}/user/loginPage">로그인 하기</a>
		</p>
		
	</div>
</body>
</html>
