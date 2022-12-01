<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ZupgoZupup : 회원가입</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
body {
	min-height: 100vh;
	background-image: linear-gradient(120deg, #E0FFDB, #E0FFDB);
}

.input-form {
	max-width: 600px;
	margin-top: 100px;
	padding: 50px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
</style>

</head>

<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">회원가입</h4>

				<form onsubmit="submitjoinPage(this); return false;"
					action="/user/joinPage" method="POST" id="join" class="validation-form"
					novalidate>


					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="username">이름</label> <input type="text" name="username"
								class="form-control" id=username placeholder="" value=""
								required>
							<div class="invalid-feedback">이름을 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="nickname">닉네임</label> <input type="text"
								name="nickname" class="form-control" id="nickname"
								placeholder="" value="" required>
							<div class="invalid-feedback">닉네임을 입력해주세요.</div>
						</div>
					</div>


					<div class="mb-3">
						<label for="id">아이디</label> <input maxlength="30" type="text"
							class="form-control" id="id" name="id"
							placeholder="아이디를 입력해주세요." required>
					<input type="button" value="ID중복확인" id="idCheck">
					                        <span id="result"></span>	
						<div class="invalid-feedback">필수 정보입니다.</div>
					</div>


					<div class="mb-3">
						<label for="pwd">비밀번호</label> <input maxlength="30"
							type="password" class="form-control" id="pwd" name="pwd"
							placeholder="영문조합8자이상" required>
						<div class="invalid-feedback">유효한 비밀번호가 필요합니다.</div>
					</div>


					<div class="mb-3">
						<label for="loginPwConfirm">비밀번호 확인</label> <input maxlength="30"
							type="password" class="form-control" id="loginPwConfirm"
							placeholder="비밀번호 확인을 입력해주세요." required>
						<div class="invalid-feedback">유효한 비밀번호가 필요합니다.</div>
					</div>


					<div class="mb-3">
						<label for="email">이메일</label> <input type="email" name="email"
							class="form-control" id="email" placeholder="jupjup@example.com"
							required>
						<div class="invalid-feedback">이메일을 입력해주세요.</div>

					</div>

					<div class="mb-3">
						<label for="tel">휴대전화</label> <input type="tel" name="phone"
							class="form-control" id="tel" placeholder="- 없이 입력해주세요"
							pattern="[0-9]+" required>
						<div class="invalid-feedback">필수 정보입니다.</div>
					</div>


					<div class="row">
						<div class="col-md-8 mb-3">
							<label for="root">성별</label> <select
								class="custom-select d-block w-100" id="root" name="gender">
								<option value="choice">선택</option>
								<option value="man">남자</option>
								<option value="woman">여자</option>
								<option value="not_choice">선택 안함</option>
							</select>
						</div>
					</div>



					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
					</div>

					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" id="joinbtn" type="submit">가입
						완료</button>
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript">
    	// 아이디 중복체크
    	$("#idCheck").click(function() {
    		
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
						$("#id").attr("readonly", true); // 리드온리 속성지정
						$("#result").html("사용가능한 아이디 입니다");
					} else { // 중복
						$("#result").html("중복된 아이디입니다");
					}
    				
    			},
    			error : function(status, error) {
    				alert("서버문제가 발생했습니다. 관리자에게 문의하세요.");
    			}
    		});
    		
    	}); // 아이디 중복체크
</script>

<script>
	// 폼검증
    	$("join").click( function() {
    		
    		console.log( $("#id").attr("readonly") );
    	
    		if( $("#id").attr("readonly") != 'readonly' ){ // 중복검사를 하지 않은 경우
    			alert("아이디 중복검사는 필수 입니다.");
    			$("id").focus();
    			return;
   
    		  } else {
    			$("#join").submit(); // 전송
    		 }
    	});	
    		
    </script> 
	
	 <script>
  
  	function submitjoinPage(form){
  		
  		form.username.value = form.username.value.trim();
  		if (form.username.value.length == 0){
  			alert('이름을 입력해주세요');
  			 form.username.focus();
  			 return false;
  		}
  		
  		if (form.username.value.length < 2) {
  			alert('이름을 2자 이상 입력해주세요');
 			 form.username.focus();
 			 return false;
  			
  		}
  		
  		
  		
  		if (form.id.value.length == 0){
  			alert('로그인 아이디를 입력해주세요');
  			 form.id.focus();
  			 return false;
  		}
  		
  		 if (isAlphaNumeric(form.id.value) == false){
  			 alert('로그인 아이디 영문자 소문자와 숫자만 사용 가능');
 			 form.id.focus();
 			 return false;
  			    			  
  		  }
  	
  		 form.id.value = form.id.value.toLowerCase();
  		 
  		
  		 form.pwd.value = form.pwd.value.trim();
  		if(form.pwd.value.length == 0){
  			alert('로그인 비밀번호를 입력해주세요');
  			 form.pwd.focus();
  			 return false;
  			
  		}
  		
  		form.loginPwConfirm.value = form.loginPwConfirm.value.trim();
  		if(form.loginPwConfirm.value.length == 0){
  			alert('로그인 비밀번호 확인을 입력해주세요');
  			 form.loginPwConfirm.focus();
  			 return false;
  			
  		}
  		 if (form.pwd.value != form.loginPwConfirm.value){
  			 alert('로그인 비밀번호가 일치하지 않습니다.');
  			 return false;
  			 
  		 }
  		
  			form.submit();
  		}
    </script>

	<script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);

  </script>



</body>

</html>