<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JupgoJupup : 회원가입</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
body {
	min-height: 100vh;
	background-image: linear-gradient(120deg, #125349, #367341);
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
					action="/user/doJoin" method="POST" class="validation-form"
					novalidate>


					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name">이름</label> <input type="text" name="username"
								class="form-control" id=name placeholder="" value=""
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
						<label for="loginId">아이디</label> <input maxlength="30" type="text"
							class="form-control" id="loginId" name="loginId"
							placeholder="아이디를 입력해주세요." required>
						<div class="invalid-feedback">필수 정보입니다.</div>
					</div>


					<div class="mb-3">
						<label for="loginPw">비밀번호</label> <input maxlength="30"
							type="password" class="form-control" id="loginPw" name="pwd"
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
					<button class="btn btn-primary btn-lg btn-block" type="submit">가입
						완료</button>
				</form>
			</div>
		</div>
	</div>




	<script>
function isAlphaNumeric(str){
	var code, i, len;
	
	for (i =0 ,len = str.length; i <len; i++){
		
		code = str.charCodeAt(i);
		if(!(code > 47 && code < 58) &&
		!(code > 64 && code < 91) &&
		!(code > 96 && code < 123)) {
			return false;
		}
	
	}  
	return true;
	
}

 </script>


	<script>
  
  	function submitjoinPage(form){
  		
  		form.name.value = form.name.value.trim();
  		if (form.name.value.length == 0){
  			alert('이름을 입력해주세요');
  			 form.name.focus();
  			 return false;
  		}
  		
  		if (form.name.value.length < 2) {
  			alert('이름을 2자 이상 입력해주세요');
 			 form.name.focus();
 			 return false;
  			
  		}
  		
  		
  		
  		if (form.loginId.value.length == 0){
  			alert('로그인 아이디를 입력해주세요');
  			 form.loginId.focus();
  			 return false;
  		}
  		
  		 if (form.loginId.value.length < 4){
  			 alert('로그인 아이디를 4자 이상 입력해 주세요');
  			 form.loginId.focus();
  			 return false;
  		 }
  		 
  		 if (isAlphaNumeric(form.loginId.value) == false){
  			 alert('로그인 비밀번호 영문자 소문자와 숫자만 사용 가능');
 			 form.loginId.focus();
 			 return false;
  			    			  
  		  }
  	
  		 form.loginId.value = form.loginId.value.toLowerCase();
  		 
  		
  		 form.loginpw.value = form.loginpw.value.trim();
  		if(form.loginpw.value.length == 0){
  			alert('로그인 비밀번호를 입력해주세요');
  			 form.loginpw.focus();
  			 return false;
  			
  		}
  		
  		form.loginPwConfirm.value = form.loginPwConfirm.value.trim();
  		if(form.loginPwConfirm.value.length == 0){
  			alert('로그인 비밀번호 확인을 입력해주세요');
  			 form.loginPwConfirm.focus();
  			 return false;
  			
  		}
  		 if (form.loginpw.value != form.loginPwConfirm.value){
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