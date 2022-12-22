<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<html lang="en">
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="css/animatedLogin.css">

	
<meta charset="UTF-8">
<title>ZupgoZupup : 로그인</title>

<style type="text/css">


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

.login_find_info a{text-decoration: none; color: gray; font-size: 0.8em; line-height: 20px;

}


</style>






	<script >
   var msg = "${msg}";
   if (msg != ""){
	   
	   alert(msg);
   }

</script>

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
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	
	
	<!-- 카카오 로그인 -->
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
<script type="text/javascript">
    $(document).ready(function(){
        Kakao.init('6e3c3664c60870aea7164522a62f8825');
        Kakao.isInitialized();
    });

    function loginWithKakao() {
        Kakao.Auth.authorize({ 
        redirectUri: 'http://localhost:8088/user/kakao' 
        }); // 등록한 리다이렉트uri 입력
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
		
		<input type="submit" class="logbtn" value="로그인">

          	<!-- 카카오 로그인 -->      
          <a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=c54da2a5f03d3994996f0e79f1f70ae2&redirect_uri=http://localhost:8088/user/kakao&response_type=code">      
	
		<img src="${pageContext.request.contextPath}/resources/img/kakao_login_medium_narrow.png" style="height:60px">
      		</a>




		<div class="login_find_info">
			<a href="/user/finduserId">아이디</a><span style="color: gray;">
				/ </span> <a href="/user/findPassword">비밀번호 찾기</a><span
				style="color: gray; font-weight: bold;"> | </span> <a
				href="/user/joinPage">회원가입</a>
		</div>





	</form>

</body>
</html>