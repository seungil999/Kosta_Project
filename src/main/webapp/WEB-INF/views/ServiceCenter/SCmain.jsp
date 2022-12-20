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
A:link, A:visited, A:active, A:hover {
	text-decoration: none;
	color: black;
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

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.1);
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
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
	float: left;
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
							<li><a class="link_menu"
								href="/ServiceCenter/">전체보기</a></li>
							<li><a class="link_menu" href="0">계정관련</a></li>
							<li><a class="link_menu" href="1">도용.보안</a></li>
							<li><a class="link_menu" href="2">모임관련</a></li>
							<li><a class="link_menu" href="3">이용제한</a></li>
							<li><a class="link_menu" href="4">게시판관련</a></li>
							<li
								style="font-size: 21px; padding-top: 20px; font-weight: bold;">
								<a class="link_menu1"
								href="http://localhost:8088/ServiceCenter/notice">공지사항</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
			<div class="sc_content">
				<div class="scmain_text">
					<h3 class="scmain_title">자주 찾는 질문</h3>
					<br>
					<div class="QList">
						<ol>
							<c:forEach items="${list}" var="QUESTIONS">
								<li><b class=Qbtn>Q &nbsp;&nbsp;&nbsp;${QUESTIONS.name }</b>

									<div class="modal">
										<div class="modal-content">
											<span class="close">&times;</span>
											<h2>Q </h2>
											<h3>${QUESTIONS.name }</h3>
											<br>
											<h2>A </h2>
											<p>${QUESTIONS.content }</p>
										</div>
									</div></li>
							</c:forEach>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form id='actionForm' action="/ServiceCenter/" method='get'>
		<input type='hidden' name='filter' value='<c:out value="${filter }"/>'>
	</form>
	
	
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

	<!-- 리스트 모달창 -->
	<script>
		var modals = document.getElementsByClassName("modal");
		var btns = document.getElementsByClassName("Qbtn");
		var spanes = document.getElementsByClassName("close");
		var funcs = [];

		function Modal(num) {
			return function() {
				btns[num].onclick = function() {
					modals[num].style.display = "block";
					console.log(num);
				};

				spanes[num].onclick = function() {
					modals[num].style.display = "none";
				};
			};
		}
		
		<!-- for문 안 주면 모달창 각각의 값을 받아올 수 없고, 맨 첫번째 모달창 값만 가져올 수 있음 -->
		for (var i = 0; i < btns.length; i++) {
			funcs[i] = Modal(i);
		}

		for (var j = 0; j < btns.length; j++) {
			funcs[j]();
		}

		window.onclick = function(event) {
			if (event.target.className == "modal") {
				event.target.style.display = "none";
			}
		};
	</script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
		var actionForm = $("#actionForm");
		
		$('.link_menu').on("click",
				function(e) {
			
				e.preventDefault();
				
				actionForm.find("input[name='filter']")
				.val("");
				
				actionForm.find("input[name='filter']")
				.val($(this).attr("href"));
				
				
				actionForm.submit();
				
		});
});
</script>



</body>
</html>
