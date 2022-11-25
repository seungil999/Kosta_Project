<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메이트 모집</title>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<style>
.mcm {
	width: 200px;
	height: 200px;
	line-height: 120px;
	text-align: center;
	margin: 0 auto;
}

.mcmb {
	width: 100vw;
	height: 70vh;
	display: flex;
	align-items: center;
}
</style>
<body>
	<div class="mcmb">
		<div class="mcm">
			<a href="/Mate/Flashgathering"
				style="padding:10px 10px 10px 10px; width: 150px; vertical-align: middle; border: 5px solid #86EC77; border-radius: 15px; font-size: 40px; font-family: 'Open Sans', sans-serif;">
				번개모임</a> 
			<a href="/Mate/Regularmeeting" 
				style="padding:10px 10px 10px 10px; width: 150px; vertical-align: middle; border: 5px solid #86EC77;  border-radius: 15px; font-size: 40px; font-family: 'Open Sans', sans-serif;">정기모임</a>
		</div>
	</div>
</body>
</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>