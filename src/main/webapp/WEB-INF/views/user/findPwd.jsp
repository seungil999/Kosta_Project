<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>


<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 찾기</title>

<style>
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style>
@font-face {
font-family: 'Wemakeprice-Bold';
src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Wemakeprice-Bold.woff') format('woff');
font-weight: normal;
font-style: normal;
}
@font-face {
font-family: 'Wemakeprice-Regular';
src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Wemakeprice-Regular.woff') format('woff');
font-weight: normal;
font-style: normal;
}
.findpwd_section {
	color: #363131;
	height: 697px;
	font-family: 'Noto Sans KR', sans-serif;
}

.findpwd_form_container {
	width: 400px;
	margin: auto;
	padding-top: 200px;
}

.findpwd_form_title_div {
	margin: auto;
	text-align: center;
}

.findpwd_form_title_h {
	font-weight: bold;
	font-size: 40px;
	display: inline-block;
	padding-top: 8px;
	margin-bottom: 30px;
}

.findpwd_form_input {
	padding: 0 10px;
	width: 100%;
	height: 45px;
	border: 1px solid;
	border-radius: 3px;
	border-color: gray;
}

.findpwd_form_text_alert {
	height: 20px;
	font-size: 0.8em;
}

.findpwd_form_text_alert_padding {
	padding-bottom: 10px;
}

.findpwd_form_submit_button {
	font-family: 'Noto Sans KR', sans-serif;
	width: 100%;
	height: 55px;
	background-color:  #03c75a;
	border: 1px;
	border-radius: 3px;
	color: white;
	font-size: 19px;
	font-weight: bold;
}

.findpwd_info {
	line-height: 25px;
	padding: 6px 0 100px;
	font-size: 0.8em;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>


$(document).ready(function() {
    // 아이디 유효성 검사
    $("#id").focusout(function(){
        var id = $("#id").val();
        var alert_id = $("#alert_id");
        var idregex = /^[a-z0-9]{5,11}$/;
        var idresult = idregex.exec(id);
        
        if(id == null || id == ""){
            alert_id.text("아이디를 입력하세요.").css("color", "red");
            return;
        }else if(idresult != null){
            alert_id.text("")
        }else{
            alert_id.text("아이디 양식에 맞게 입력하세요").css("color", "red");
        }
        
        $.ajax({
			url : "/user/idCheck",
			method : "post",
			data : {"id" : id},
			success:function(responseObj){
				if(responseObj.status == 1){
					$("#alert_id").text("가입된 아이디 입니다.").css("color",   "green");
					$("#alert_id").attr('data-boolean','false');
				}else if(responseObj.status == -1){
					$("#alert_id").text("존재하지 않는 아이디 입니다.").css("color", "red");
					$("#alert_id").attr('data-boolean','true');
				}
			},
			error: function(jqXHR){
				alert(jqXHR.status);
			}
		});
    });

    // 이메일 유효성 검사
    $("#email").focusout(function(){
        var email = $("#email").val();
        var alert_email = $("#alert_email");
        var emailregex = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
        var emailresult = emailregex.exec(email);
        
        if(email == null || email == ""){
            alert_email.text("이메일을 입력하세요.").css("color", "red");
            return;
        }else if(emailresult != null){
            alert_email.text("")
        }else{
            alert_email.text("이메일 양식에 맞게 입력하세요").css("color", "red");
        }
        
        $.ajax({
			url : "/user/emaildupchk",
			method : "post",
			data : {"email" : email},
			success:function(responseObj){
				if(responseObj.status == 1){
					$("#alert_email").text("존재하는 이메일 입니다.").css("color", "green");
                    $(".findpwd_form_submit_button").css("background-color", "#55a72b");
					$('.findpwd_form_submit_button').removeAttr('disabled');
					$(".findpwd_form_submit_button").css("cursor", "pointer");
				}else if(responseObj.status == -1){
					$("#alert_email").text("가입된 이메일이 없습니다.").css("color", "red");
				}
			},
			error: function(jqXHR){
				alert(jqXHR.status);
			}
		});
    });

    // 입력값 공란 제출시
    $(".findpwd_form_submit_button").on("click", function(){
    	var email = $("#email").val();
    	var id = $("#id").val();
        if($("#id").val() == "" || $("#id").val() == null){
            $("#alert_id").text("아이디를 입력하세요.").css("color", "red");
        }else {
            $("#alert_id").text("");
        }
        
        if($("#email").val() == "" || $("#email").val() == null){
            $("#alert_email").text("이메일을 입력하세요").css("color", "red");
        }else{
            $("#alert_email").text("");
        }
        $("#alert_email").text("이메일이 발송되었습니다").css("color", "#363131");
        
        $.ajax({
			method : "post",
			url : "/user/findPwd",
			data : {"email" : email, "id" : id},
			success : function(map){
				if(responseObj.status == 1){
					alert("전송");
				}else if(responseObj.status == -1){
					alert("이상");
				}
			},
			error: function(jqXHR){
				alert(jqXHR.status);
			}
		});
    });
});
</script>
</head>
<body>

	<section class="findpwd_section">
		<div id="container" class="main_container">
			<div class="findpwd_container">
				<div class="findpwd_form_container">
					<form name="findpwd_form" method="post">
						<div class="findpwd_form_title_div">
							<h1 class="findpwd_form_title_h">비밀번호 찾기</h1>
						</div>
						<div>
							<div>
								<input type="text" id="id" name="id"
									placeholder="아이디" class="findpwd_form_input" />
							</div>
							<div class="findpwd_form_text_alert_padding">
								<div id="alert_id" class="findpwd_form_text_alert"></div>
							</div>
						</div>
						<div>
							<div>
								<input type="email" id="email" name="email"
									placeholder="이메일" class="findpwd_form_input" />
							</div>
							<div class="findpwd_form_text_alert_padding">
								<div id="alert_email" class="findpwd_form_text_alert"></div>
							</div>
						</div>
						<div style="height: 10px;"></div>
						<div>
							<button type="button" class="findpwd_form_submit_button">안내
								메일 발송</button>
						</div>
						<div class="findpwd_info">
							<label> <span class="guide_txt" style="color: gray;">＊
									비밀번호 안내를 회원 가입시 입력했던 메일로 발송합니다.</span>
							</label>
						</div>
						  <div style=" float: right;">
                         <a href = "/user/loginPage">로그인하러가기</a>
                        </div>
					</form>
				</div>
			</div>
		</div>

	</section>
	
</body>
</html>