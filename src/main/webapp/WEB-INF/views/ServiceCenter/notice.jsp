<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<style>
.scmain_title {
	border-bottom-style: solid;
	border-bottom-color: #43a906;
	border-bottom-width: 1px;
	text-align: left;
	margin: 25px 25px;
	padding-bottom: 15px;
	font-size: 20px;
	font-weight: bold;
	letter-spacing: -.5px;
}

.scmain_tbox  *{
	list-style-type: none;
	float: left;
	padding: 0 14px;
}
.scmain_tbox button{
	border: none;
	color: black;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	padding: 7px 7px;
	font-size: 15px;
	border-radius: 15px;
}
.active{
    background-color:#03c75a;
    color: white;
    }
</style>
<body>
	<div>
		<div class="leftbtn">
			<ul id="scmenu" class="scmenu">
				<li style="background: #43a906;"><b>메뉴</b></li>
				<li>
					<button class="scbtn" onclick="location.href='/ServiceCenter/'">자주 찾는 질문</button>
				</li>
				<li>
					<button class="scbtn" onclick="location.href='/ServiceCenter/Notice'">공지 사항</button>
				</li>
			</ul>
		</div>
		<div class="scmain">
			<h3 class="scmain_title">공지사항</h3>
			<div class="scmain_Qlist">
				<ul>
					<li></li>
				</ul>
			</div>
		</div>
	</div>
	
</body>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</html>