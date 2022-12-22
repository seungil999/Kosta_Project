<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>


<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 찾기 </title>


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
.findid_section{color: #363131; height: 697px; font-family: 'Noto Sans KR', sans-serif;}
.findid_form_container{width: 400px;margin: auto; padding-top : 200px;} 
.findid_form_title_div{margin: auto; text-align: center;}
.findid_form_title_h{font-weight: bold; font-size: 40px; display: inline-block; padding-top: 8px;margin-bottom: 30px;}
.findid_form_input{padding : 0 10px; width: 100%; height: 45px; border: 1px solid; border-radius: 3px; border-color: gray;}
.findid_form_text_alert{height: 20px; font-size: 0.8em;}
.findid_form_text_alert_padding{padding-bottom: 10px;}
.findid_form_submit_button{font-family: 'Noto Sans KR', sans-serif; width: 100%; height: 55px; background-color: #03c75a; border: 1px ; border-radius: 3px; color: white; font-size: 19px; font-weight: bold;}
.findid_info{line-height: 25px; padding: 6px 0 100px; font-size: 0.8em;}
.findpwd_info {
	line-height: 25px;
	padding: 6px 0 100px;
	font-size: 0.8em;
}

</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function() {
	// 이메일 유효성 검사
	$("#email").focusout(function() {
		var email = $("#email").val();
		var alert_email = $("#alert_email");
		var emailregex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var emailresult = emailregex.exec(email);
		
		if (email == null || email == "") {
			alert_email.text("이메일을 입력하세요").css("color", "red");
			$("#alert_mail").attr('data-boolean','false');
			return;
		} else if (email != null && email != "" && email == emailresult) {
			alert_email.text("")
			$("#alert_email").attr('data-boolean','ture');
		} //else if (email != emailresult) {
			//alert_email.text("이메일 양식에 맞게 입력하세요").css("color", "red");
			//$("#alert_member_email").attr('data-boolean','false');
			//return;
		//}
		
		$.ajax({
			url : "/user/emaildupchk",
			method : "post",
			data : {"email" : email},
			success:function(responseObj){
				if(responseObj.status == 1){
					$("#alert_email").text("존재하는 이메일 입니다.").css("color", "green");
                    $(".findid_form_submit_button").css("background-color", "#55a72b");
					$('.findid_form_submit_button').removeAttr('disabled');
					$(".findid_form_submit_button").css("cursor", "pointer");
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
    $(".findid_form_submit_button").click(function(){
        var email = $("#email").val();
        var alert_email = $("#alert_email");
        var emailregex = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
        var emailresult = emailregex.exec(email);
        
        if(email == null || email == ""){
            alert_email.text("이메일을 입력하세요.").css("color", "red");
            return;
        }else if(emailresult != null){
            alert_email.text("이메일이 발송되었습니다.").css("color", "#363131")
        }else{
            alert_email.text("이메일 양식에 맞게 입력하세요").css("color", "red");
        }
        
		$.ajax({
			method : "post",
			url : "/user/findId",
			data : {"email" : email},
			success : function(responseObj){
				if(responseObj.status == 1){
					alert("이메일이 전송 되었습니다");
				}else if(responseObj.status == -1){
					alert("이메일을 확인해주세요");
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
    
    <section class = "findid_section">
        <div id="container" class="main_container">
            <div class="findid_container">
                <div class="findid_form_container">
                    <form name="findid_form" method="post">
                        <div class="findid_form_title_div">
                            <h1 class="findid_form_title_h">아이디 찾기</h1>
                        </div>
                        <div>
                            <div>
                                <input type="email" id="email" name="email" placeholder="이메일" class="findid_form_input" />
                            </div>
                            <div class="findid_form_text_alert_padding">
                                <div id="alert_email" class="findid_form_text_alert"></div>
                            </div>
                        </div>
                        <div style="height: 10px;"></div>
                        <div>
                      
                            <button type="button" class="findid_form_submit_button" >안내 메일 발송</button>
                        </div>
                        <div class = "findid_info">
                            <label>
                                <span class = "guide_txt" style = "color: gray;">＊ 아이디 안내를 회원 가입시 입력했던 메일로 발송합니다.</span>
                            </label>
                            
                        </div>
                        
                        <div style=" float: right;">
                     
                            <a href = "/user/findPassword">비밀번호 찾기</a><span style = "color: gray;font-weight: bold;">　|　</span>
                            <a href = "/user/loginPage">로그인</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
   
</body>
</html>