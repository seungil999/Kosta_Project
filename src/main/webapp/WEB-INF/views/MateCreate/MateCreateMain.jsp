<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메이트 모집</title>
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap" rel="stylesheet">
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<%-- 1. 메이트 모집 메인 --%>
</head>
<style>

.mcm {
	width: 240px;
	height: 240px;
	line-height: 120px;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}

.mcmb {
	width: 100vw;
	height: 70vh;
	display: flex;
	align-items: center;
}

div #flashMate, #regularMate {
	background-color: #198754 ;
	padding:10px 10px 10px 10px; 
	width: 240px;
	vertical-align: middle; 
	border-radius: 15px; 
	color: white;
	
}

body{
	font-family: 'Yeon Sung', cursive;
	font-size: 40px; 
}
</style>
<body>
	<div class="mcmb">
		<div class="mcm">
			<a id="flashMate" href="/Mate/Flashgathering">번개모임 &#127939;</a>
			<a id="regularMate" href="/Mate/Regularmeeting" >정기모임 &#128694;</a>
		</div>
	</div>
</body>
</html>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>