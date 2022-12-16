<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ include file="/WEB-INF/views/includes/sidebar.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">	

        <div id="my_modal">
        	<div class="modal_pwChk">비밀번호 확인</div>
           <input type="password" class="form-control id" id="mod_pass" 
           style=" position: absolute; top: 50%; left: 50%;
            transform: translate(-50%,-50%);" placeholder="가입시 등록한 비밀번호를 입력해주세요."></input>
            <span id="result"></span>
           <button class="modal_submit_btn">확인</button>
            <button class="modal_close_btn">취소</button>
        </div>

       


<div class="myp-title">프로필 수정</div>
	<div class="main">
		<div class="bold">회원정보 수정</div>
	<hr>
	<form id='update' action="/mypage/profileUpdate" method="POST" novalidate>
	
 	<table class="modtab">
 		<tr class="profile-tr">
	 		<td class="bold">아이디</td>
	 		<td class="profile-input">
	 		<textarea rows="1" class="form-control id"  name="id" readonly>${userVO.id }</textarea></td>
	 		<td rowspan="2"> 
            	<div class="uploadResult">
            		<img class='profileImg' id="profileImg" src='/Mate/display?fileName=${userVO.profile}'>
            	</div>
            	<input type="hidden" name="profile" id="profile" value="${userVO.profile}">
        	</td>
 		</tr>
 		<tr>
	 		<td class="bold">비밀번호</td>
	 		<td class="profile-input">
	 		<input type="password" class="form-control id" name="pwd" id="pwd" style="height:35px;"></input></td>
 		</tr>
 		<tr>
	 		<td class="bold">이름</td>
	 		<td class="profile-input"><textarea rows="1" id="username" name="username" class="form-control id">${userVO.username }</textarea></td>
	 		
	 		<td>
		 		<label for="file" class="modrem">&nbsp;&nbsp;&nbsp;&nbsp;프로필 사진 변경</label>
		 		
		 		<input type="file" name="file" id="file">
	 		</td>
		
 		</tr>
 		<tr>
	 		<td class="bold">닉네임</td>
	 		<td class="profile-input"><textarea rows="1" name="nickname" id="nickname" class="form-control id">${userVO.nickname}</textarea></td>
	 		<td><button class="modrem" id="nickChk">중복확인</button></td>
 		</tr>
 		<tr>
	 		<td class="bold">이메일</td>
	 		<td class="profile-input"><textarea rows="1" name="email" id="email" class="form-control id">${userVO.email}</textarea></td>
	 		<td><button class="modrem">중복확인</button></td>
 		</tr>
 		<tr>
	 		<td class="bold">휴대폰</td>
	 		<td class="profile-input"><textarea rows="1" name="phone" id="phone" class="form-control id">${userVO.phone }</textarea></td>
	 		<td><button class="modrem">본인인증</button></td>
 		</tr>
 		<tr>
	 		<td class="bold">성별</td>
	 		
	 		<td class="profile-input">
		 		<select class="form-control id" name="gender" style="height:37px;" >
					<option value="choice" >선택</option>
					<option value='man' <c:out value="${userVO.gender eq 'man' ? 'selected':'' }"/>>남자</option>
					<option value='woman' <c:out value="${userVO.gender eq 'woman' ? 'selected':'' }"/>>여자</option>
					<option value='not_choice' <c:out value="${userVO.gender eq 'not_choice' ? 'selected':'' }"/>>선택 안함</option>
				</select>
	 		</td>
	 		<td>
	 		<label style="margin-left:20px; color:#46e02f;">
	 		<c:choose>
		 		<c:when test="${userVO.profile_open eq 'Y'}">
	    			<input role="switch" type="checkbox" class="open" checked/>
	    		</c:when>
	    		<c:otherwise>
	    			<input role="switch" type="checkbox" class="open"/>
	    		</c:otherwise>
    		</c:choose>	
    			<input type="hidden" id="profile_open" name="profile_open"/>
   				 <span>프로필 공개</span>
 			 </label>
	 		</td>
 		</tr>
 	</table>
 		
 		
</form>
		
	<span style="justify-content: center;
    align-items: center;
    display: flex; margin-top:25px;">
	<button class="modrem" id="submit">확인</button>
	<button class="modrem" id="cancel">취소</button></span>
	
</div>



<script type="text/javascript">
$('#file').change(
		function() {
			var formData = new FormData();
			var inputFile = $("input[type='file']");
			var files = inputFile[0].files;
			var profileImg = $("#profileImg");
			
			/* var fileName = arr[0].thumbnailURL;
			
			$.post('/Mate/removeFile', {
				fileName : fileName
			}, function(result) {
				console.log(result);
			}); */
			
			if(files.length==0){
				
				return;
			}else{
				$("#profileImg").remove();	
			} 
			
			formData.append("uploadFiles", files[0]);
			

			$.ajax({
						url : '/mypage/uploadAjax',
						processData : false,
						contentType : false,
						data : formData,
						type : 'POST',
						dataType : 'json',
						success : function(result) {
							
							showUploadedImages(result);
							var str = "";
							for (var i = 0; i < result.length; i++) {
								str += result[i].thumbnailURL;
							}
							$("#profile").val(str);
						},
						error : function(jqXHR, textStatus,
								errorThrown) {
							console.log(textStatus);
						}

					});//.ajax
			function showUploadedImages(arr) {
				console.log(arr);
				var divArea = $(".uploadResult");
				var str = "";
				
					str += "<div id='profileImg'>";
					str += "<img class='profileImg' src='/Mate/display?fileName="
							+ arr[0].thumbnailURL + "'>";
					str += "</div>";
				
				divArea.append(str);
			}
			$(".uploadResult").on("click", ".removeBtn",
					function(e) {
						var target = $(this);
						var fileName = target.data("name");
						var targetDiv = $(this).closest("div");

						console.log(fileName);

						$.post('/Mate/removeFile', {
							fileName : fileName
						}, function(result) {
							console.log(result);
							if (result === true) {
								targetDiv.remove();
							}
						})
					})
		});
	





 $(".modal_submit_btn").click(function() {
	var pass=$('#mod_pass').val();
	var sessionPass="<c:out value='${userVO.pwd}'/>";
	if(sessionPass != pass){
		$("#result").html("비밀번호가 틀렸습니다.");
		return;
	}else{
		alert("회원정보가 수정되었습니다.");
		$('#update').submit();
	}
}); 


 $("#cancel").click(function() {
 	location.href="/mypage/activity";
 });
/* 
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
	
}); // 아이디 중복체크 */
</script>

 <script>
        $(document).ready(function(){
        	
        	
            function modal(id) {
                var zIndex = 9999;
                var modal = document.getElementById(id);
				console.log(modal);
                // 모달 div 뒤에 희끄무레한 레이어
                var bg = document.createElement('div');
                bg.setStyle({
                    position: 'fixed',
                    zIndex: zIndex,
                    left: '0px',
                    top: '0px',
                    width: '100%',
                    height: '100%',
                    overflow: 'auto',
                    // 레이어 색갈은 여기서 바꾸면 됨
                    backgroundColor: 'rgba(0,0,0,0.4)'
                });
                document.body.append(bg);

                // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
                modal.querySelector('.modal_close_btn').addEventListener('click', function() {
                    bg.remove();
                    modal.style.display = 'none';
                });

                modal.setStyle({
                    position: 'fixed',
                    display: 'block',
                    boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

                    // 시꺼먼 레이어 보다 한칸 위에 보이기
                    zIndex: zIndex + 1,

                    // div center 정렬
                    top: '50%',
                    left: '50%',
                    transform: 'translate(-50%, -50%)',
                    msTransform: 'translate(-50%, -50%)',
                    webkitTransform: 'translate(-50%, -50%)'
                });
            }

            // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
            Element.prototype.setStyle = function(styles) {
                for (var k in styles) this.style[k] = styles[k];
                return this;
            };
			
            $('#submit').on("click",function(e){
        		
    			if ($('#username').val().length == 0){
    				alert('변경하실 이름을 입력해주세요');
    				 form.username.focus();
    				 return false;
    			} 
    			
    			if ($('#username').val().length < 2) {
    				alert('이름을 2자 이상 입력해주세요');
    				 form.username.focus();
    				 return false; 
    			}
    			
    			if($('#pwd').val().length == 0){
    				alert('변경하실 비밀번호를 입력해주세요');
    				 form.pwd.focus();
    				 return false;
    			} 
    			if($('#nickname').val().length == 0){
    				alert('닉네임을 입력해주세요');
    				 form.nickname.focus();
    				 return false;
    			} 
    			if($('#email').val().length == 0){
    				alert('이메일을 입력해주세요');
    				$('#email').focus();
    				 return false;
    			}
    			if($('#phone').val().length == 0){
    				alert('휴대폰 번호를 입력해주세요');
    				$('#phone').focus();
    				 return false;
    			}
    			if($('.open').is(':checked')){
        			$('#profile_open').val('Y');
        			
        		}else{
        			$('#profile_open').val('N');
        			
        		}
    			
    				
    			 modal('my_modal');
    		});	
			
			
        });
        </script>
</html>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>