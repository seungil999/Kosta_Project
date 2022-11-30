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

.scmain_tbox  * {
	list-style-type: none;
	float: left;
	padding: 0 14px;
}

.scmain_tbox button {
	border: none;
	color: black;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	padding: 7px 7px;
	font-size: 15px;
	border-radius: 15px;
}

.active {
	background-color: #03c75a;
	color: white;
}
</style>
<body>
		<div class="leftbtn">
			<ul id="scmenu" class="scmenu">
				<li style="background: #43a906;"><b>메뉴</b></li>
				<li>
					<button class="scbtn" onclick="location.href='/ServiceCenter/'">자주 찾는 질문</button>
				</li>
				<li>
					<button class="scbtn"
						onclick="location.href='/ServiceCenter/notice'">공지 사항</button>
				</li>
			</ul>
		</div>
		<div class="scmain">
			<h3 class="scmain_title">자주 찾는 질문</h3>
			<div class="scmain_tbox" style="height: 34px;">
				<ul role="tablist">
					<li role="none">
						<button role="tab" class="tbutton active">전체보기</button>
					</li>
					<li role="none">
						<button role="tab" class="tbutton">계정관련</button>
					</li>
					<li role="none">
						<button role="tab" class="tbutton">이용방법</button>
					</li>
					<li role="none">
						<button role="tab" class="tbutton">번개모임</button>
					</li>
					<li role="none">
						<button role="tab" class="tbutton">정기모임</button>
					</li>
					<li role="none">
						<button role="tab" class="tbutton">이용제한</button>
					</li>
					<li role="none">
						<button role="tab" class="tbutton">자유게시판</button>
					</li>
					<li role="none">
						<button role="tab" class="tbutton">도용,보안</button>
					</li>
				</ul>
			</div>
			<br>
			<div class="scmain_Qlist">
				<div class="">
					<c:forEach items="${list}" var="QUESTIONS">
						<p class="">
							<span class="admin">${QUESTIONS.name }</span>
						</p>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<script>
			$('.tbutton').click(function() {
				$('.tbutton').removeClass("active");
				$(this).addClass("active");
			});
		</script>
</body>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</html>