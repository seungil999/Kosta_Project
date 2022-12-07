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
A:link,A:visited,A:active,A:hover {
	text-decoration:none; color:black;
}
.leftbtn {
	float: left;
	height: 100%;
	width: 160px;
	font-size: 15px;
	padding-right: 20px;
}

.scmain {
	border: 3px solid #42DF2B;
	border-radius: 15px;
	display: block;
	width: 990px;
	margin: 30px auto;
	min-height: 484px;
	padding: 10px;
}

.cmain {
	width: 990px;
	height: 100%;
	overflow: hidden;
}

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
.Btn {
	background-color: white;
	border: 1px solid #42DF2B ;
	color: white;
	padding: 3px 40px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	border-radius: 15px;
	font-weight: bold;
	margin: 30px 30px;
}
.Qbtn {
	cursor: pointer;
}

.QList li {
	list-style: none;
	margin: 5px 31px;
	padding: 5px;
	font-size: 20px;
	border-bottom: 1px solid gray;
}

.scmain .scmain_text {
	margin: 35px 5px;
}

.sc_content {
	position: relative;
	float: right;
	border-left: 1px solid #e8e8e8;
	width: 750px;
	min-height: 700px;
	padding-bottom: 60px;
}

.tit_menu {
	font-size: 21px;
	margin-top: 50px;
	font-weight: bold;
}

#Gnb .list_menu {
	margin-top: 20px;
	float:left;
}
#Gnb .list_menu li {
    margin: 0 0 20px 5px;
    font-size: 15px;
    text-align: left;
}
</style>
<body>
	<div class="scmain">
		<div class="cmain">
			<div class="leftbtn">
				<div id="scmenu" class="scmenu">
					<h2 class="tit_menu">자주찾는 질문</h2>
						<nav id="Gnb" aria-labelledby="lnb">
							<ul class="list_menu">
								<li>
								<a class="link_menu" href="http://localhost:8088/ServiceCenter/">전체보기</a>
								</li>
								<li>
								<a class="link_menu" href="http://localhost:8088/ServiceCenter/">계정관련</a>
								</li>
								<li>
								<a class="link_menu" href="http://localhost:8088/ServiceCenter/">도용.보안</a>
								</li>
								<li>
								<a class="link_menu" href="http://localhost:8088/ServiceCenter/">모임관련</a>
								</li>
								<li>
								<a class="link_menu" href="http://localhost:8088/ServiceCenter/">이용제한</a>
								</li>
								<li>
								<a class="link_menu" href="http://localhost:8088/ServiceCenter/">게시판관련</a>
								</li>
								<li style="font-size:21px; padding-top:20px; font-weight:bold;">
								<a class="link_menu" href="http://localhost:8088/ServiceCenter/notice">공지사항</a>
								</li>
							</ul>
						</nav>
				</div>
			</div>
			<div class="sc_content">
				<div class="scmain_text">
					<h3 class="scmain_title">공지사항</h3>
					<br>
					<div class="QList">
						<ol>
							<li><b>${noticeVO.name }</b></li>
							<li>${noticeVO.regdate }</li>
							<li>${noticeVO.content }</li>
						</ol>
					</div>
					<a class="Btn" href="/ServiceCenter/notice">목록</a>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

</body>
</html>
