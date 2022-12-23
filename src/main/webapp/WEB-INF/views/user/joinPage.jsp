<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>회원가입</title>
   
<style>
button:hover {
   cursor: pointer;
}
#container {width: 100%; height: 100%; position: relative; margin-top: 50px;}

#root{
width: 100%; height: 55px; border: 1px solid #dadada;padding: 17px; border-radius: 5px; margin-top: 20px; margin-bottom: 20px;
}

.dpn {display: none !important;}
.join_wrap {width:550px; margin: 0 auto; border: 1px solid #dadada; padding: 24px; border-radius: 5px;}
.join_title {width:100%; height:35px; font-size: 19px; font-weight: bold; padding-left: 10px; padding: 0 0 10px 10px;}

.join_box {width: 100%;}
.join_box input {width: 100%; height: 50px; border: 1px solid #dadada;padding: 17px; border-radius: 5px; margin-top: 20px;}
.join_box span {display: inline-block; color: red; font-size: 12px; padding-left: 1px; padding-top: 8px;}

.auth {width: 100%; margin-top: 10px;}
.auth input {display:inline-block; width: calc(100% - 121px); vertical-align: top; margin: 0;}
.auth_btn{
   display: inline-block;
    width: 115px;
    height: 50px;
    padding: 17px 0 15px;
    border-radius: 6px;
    border: solid 1px rgba(0,0,0,.15);
    background-color: #198754;
    color: white;
    font-size: 17px;
    font-weight: bold;
    line-height: 1;
}
.email_auth {width: 100%; margin-top: 10px;}
.email_auth input {display:inline-block; width: calc(100% - 121px); vertical-align: top; margin: 0;}
.email_auth_btn{
   display: inline-block;
    width: 115px;
    height: 50px;
    padding: 17px 0 15px;
    border-radius: 6px;
    border: solid 1px rgba(0,0,0,.15);
    background-color: #198754;
    color: white;
    font-size: 17px;
    font-weight: bold;
    line-height: 1;
}

.join_btn {    
   display: block;
    width: 100%;
    padding: 17px 0 15px;
    border-radius: 6px;
    border: solid 1px rgba(0,0,0,.15);
    background-color: #198754;
    color: white;
    font-size: 19px;
    font-weight: bold;
    margin-top: 20px;
}
</style>
   
</head>
<body>

<div id="container" class="container">
   <div class="content">
      <div class="join_wrap">
         <form id="join_frm">
            <div class="join_title">회원가입</div>
            <br>
            <div class="join_box">
                <input type="text" placeholder="이름" name="username" id="username" style="margin: 0;">
                
                  <label for="root"></label> 
                     <select class="" id="root" name="gender">
                        <option value="choice">성별 선택</option>
                        <option value="man">남자</option>
                        <option value="woman">여자</option>
                        <option value="not_choice">선택 안함</option>
                     </select>
               <div class="auth">      
               <input type="text" placeholder="아이디" name="id" id="id" >
               <button type="button" id="ck_btn" class="auth_btn">중복확인</button>
                <span id="result"></span>   
               </div>
               
               <div class="auth">
               <input type="text" placeholder="닉네임" name="nickname" id="nickname">
               <button type="button" id="nick_btn" class="auth_btn">중복확인</button>
               <span id="result2"></span>
                </div>

      
               <input type="password" placeholder="비밀번호" name="pwd" id="pwd">
               <input type="password" placeholder="비밀번호  확인" id="loginPwConfirm">            
            
                     
               <div class="email_auth">
                  <input type="text" placeholder="이메일" name="email" id="email" class="email">
                  <button type="button" id="email_auth_btn" class="email_auth_btn">인증번호 받기</button>
               </div>
               <input type="text" placeholder="인증번호 입력" id="email_auth_key">
            </div>
            
            <!-- 기본프로필 및 프로필 공개여부 기본값 -->
            <input type="hidden" value="기본프로필.png" id="profile" name="profile">
             <input type="hidden" id="profile_open" name="profile_open" value="N"/>
             
            <button type="button" id="join" class="join_btn">가입하기</button>
         </form>
      </div>
   </div>
</div>


<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
   <script >
   var msg = "${msg}";
   if (msg != ""){
      
      alert(msg);
   }

</script>
<script>
       
       
       /**
        *  회원가입 관련 처리
        */
        
        function fn_join(){
          var f = $('#join_frm');
          var formData = f.serialize();
             
          $.ajax({
             type : "POST",
             url : "/user/join",
             data : formData,
             success: function(data){
                if(data == "N"){   
                   alert("회원가입에 실패하였습니다.");
                   location.href="/user/joinPage"
                }else if(data=="Y"){
                   alert("회원가입이 완료되었습니다.");
                   location.href="/user/loginPage"
                }
             },
             error: function(data){
                alert("회원가입 에러 발생!");
                console.log(data);
             }
          });
        }
        
        $(function() { 
           
           var email_auth_cd = '';
        
          $('#join').click(function(){
             
             if($('#id').val() == ""){
                alert("아이디를 입력해주세요.");
                return false;
             }
             
             if($('#nickname').val() == ""){
                alert("닉네임을 입력해주세요.");
                return false;
             }
             
             if($('#pwd').val() == ""){
                alert("비밀번호를 입력해주세요.");
                return false;
             }
             
             if($('#pwd').val() != $('#loginPwConfirm').val()){
                alert("비밀번호가 일치하지 않습니다.");
                return false;
             }
             
             if($('#email_auth_key').val() != email_auth_cd){
                alert("인증번호가 일치하지 않습니다.");
                return false;
             }
          
             fn_join();
          });
          
          $(".email_auth_btn").click(function(){            
               var email = $('#email').val();
               
               if(email == ''){
                  alert("이메일을 입력해주세요.");
                  return false;
               }
               
               var email = {email : email}
               
               $.ajax({
                type : "POST",
                url : "/user/emailAuth",
                datatype : "json",
                data : email,
                success: function(data){
                   alert("인증번호가 발송되었습니다.");
                   email_auth_cd = data;
                },
                error: function(data){
                   alert("메일 발송에 실패했습니다.");
                }
             }); 
          });
          
       
        });
</script>
<script type="text/javascript">
       // 아이디 중복체크
       $("#ck_btn").click(function() {
          
          var userId = $("#id").val();
          
          if( userId == '' || userId.length < 4 ) {
             $("#id").focus(); // 포커싱함수
             alert("아이디 형식을 확인하세요");
             return; // 함수 종료
          };
          
    
          
          // 비동기처리
          $.ajax({
             type : "post",
             url : "/user/idCheck",
             contentType : "application/json",
             data : userId,
             success : function(data) {
                
               if(data == 0){ // 사용가능
            //      $("#id").attr("readonly", true); // 리드온리 속성지정
                  $("#result").html("사용가능한 아이디 입니다");
                   $("#result").css({"color": "green"});
                  
               } else { // 중복
                  $("#result").html("중복된 아이디입니다");
                  $("#result").css({"color": "red"});
               }
                
             },
             error : function(status, error) {
                alert("서버문제가 발생했습니다. 관리자에게 문의하세요.");
             }
          });
          
       }); // 아이디 중복체크
       
       
       $("#nick_btn").click(function() {
          
          var nickName = $("#nickname").val();
          if( nickName == '' || nickName.length < 2 ) {
             $("#nickname").focus(); // 포커싱함수
             alert("닉네임 형식을 확인하세요 : 두글자이상");
             return; // 함수 종료
          };
          
          // 비동기처리
          $.ajax({
             type : "post",
             url : "/user/nicknameCheck",
             contentType : "application/json",
             data : nickName,
             success : function(data) {
                
               if(data == 0){ // 사용가능
                  // $("#nickname").attr("readonly", true); // 리드온리 속성지정
                  $("#result2").html("사용가능한 닉네임 입니다");
                  $("#result2").css({"color": "green"});
               } else { // 중복
                  $("#result2").html("중복된 닉네임입니다");
                  $("#result2").css({"color": "red"});
               }
                
             },
             error : function(status, error) {
                alert("서버문제가 발생했습니다. 관리자에게 문의하세요.");
             }
          });
          
       }); // 아이디 중복체크
</script>


</body>

</html>