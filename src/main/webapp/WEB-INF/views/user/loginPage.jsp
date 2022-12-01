<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<title>ZupgoZupup : 로그인</title>

<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,200;0,300;0,400;0,500;0,700;1,500&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	font-family: 'Montserrat', sans-serif;
}

body {
	min-height: 100vh;
	background-image:#fff;
}

.login-form {
	idth: 360px;
	background: #f1f1f1;
	height: 350px;
	padding: 65px 60px;
	border-radius: 10px;
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}

.login-form h1 {
	text-align: center;
	margin-bottom: 60px;
}

.txtb {
	border-bottom: 2px solid #adadad;
	position: relative;
	margin: 30px 0;
}

.txtb input {
	font-size: 15px;
	color: #333;
	border: none;
	width: 100%;
	outline: none;
	background: none;
	padding: 0 5px;
	height: 40px;
}

.txtb span::before {
	content: attr(data-placeholder);
	position: absolute;
	top: 50%;
	left: 5px;
	color: #adadad;
	transform: translateY(-50%);
	z-index: -1;
	transition: .5s;
}

.txtb span::after {
	content: '';
	position: absolute;
	width: 0%;
	height: 2px;
	background: linear-gradient(120deg, #125349, #42DF2B);
	transition: .5s;
}

.focus+span::before {
	top: -5px;
}

.focus+span::after {
	width: 100%;
}

.logbtn {
	display: block;
	width: 100%;
	height: 50px;
	border: none;
	background: linear-gradient(120deg, #2CA71A, #42DF2B, #2CA71A);
	background-size: 200%;
	color: #fff;
	outline: none;
	cursor: pointer;
	transition: .5s;
}

.logbtn:hover {
	background-position: right;
}

.bottom-text {
	margin-top: 60px;
	text-align: center;
	font-size: 13px;
}
</style>






<link rel="stylesheet" href="css/animatedLogin.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script >
   var msg = "${msg}";
   if (msg != ""){
	   
	   alert(msg);
   }

</script>
	
</head>
<body>
     
	<form onsubmit="submitloginPage(this); return false;"
		action="/user/loginPage" method="POST" class="login-form">
		<h1>ZupgoZupup</h1>


		<div class="txtb ">
			<input type="text" id="id" name="id" value=""> <span
				data-placeholder="아이디를 입력해주세요"></span>
		</div>

		<div class="txtb">
			<input type="password" id="pwd" name="pwd" value=""> <span
				data-placeholder="비밀번호를 입력해주세요"></span>
		</div>
		<!--아이디 혹은 비밀번호가 안맞는 경우 controller에서 result값을 받아와서 뿌려줌-->
		<%-- 	<c:if test="${param.result  eq 'fail'}">
			<p class="form-error">
				로그인 실패<br> 아이디/패스워드를 확인해 주세요.
			</p>
		</c:if> --%>
		<input type="submit" class="logbtn" value="로그인">

		<div class="form-check">
			<label class="form-check-label"> <input type="checkbox"
				class="form-check-input"> ID/PW 기억하기
			</label>
		</div>

		<div class="bottom-text">
			<a href="/user/joinPage">회원가입</a> <a href="#">비밀번호 찾기</a>
		</div>


	</form>


	<script>
		function submitloginPage(form) {

			form.id.value = form.id.value.trim();

			if (form.id.value.length == 0) {
				alert('로그인 아이디를 입력해주세요');
				form.id.focus();
				return false;
			}

			if (form.id.value.length < 4) {
				alert('로그인 아이디를 4자 이상 입력해 주세요');
				form.id.focus();
				return false;

			}

			form.id.value = form.id.value.toLowerCase();

			form.pwd.value = form.pwd.value.trim();
			if (form.pwd.value.length == 0) {
				alert('로그인 비밀번호를 입력해주세요');
				form.pwd.focus();
				return false;

			}

			form.submit();
		}
	</script>








	<script type="text/javascript">
		$(".txtb input").on("focus", function() {
			$(this).addClass("focus");
		});

		$(".txtb input").on("blur", function() {
			if ($(this).val() == "")
				$(this).removeClass("focus");
		})
	</script>

</body>
</html>