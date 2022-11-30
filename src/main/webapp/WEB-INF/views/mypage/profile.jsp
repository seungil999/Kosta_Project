<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ include file="/WEB-INF/views/includes/sidebar.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">	

<div class="myp-title">프로필 수정</div>
	<div class="main">
		<div class="bold">회원정보 수정</div>
	<hr>
	
 	<table class="modtab">
 		<tr class="profile-tr">
	 		<td class="bold">아이디</td>
	 		<td class="profile-input"><textarea rows="1" class="form-control id" readonly></textarea></td>
	 		<td rowspan="2"> 
            	<div class="uploadResult">
            	</div>
            	<input type="hidden" name="image" id="image">
        	</td>
 		</tr>
 		<tr>
	 		<td class="bold">비밀번호</td>
	 		<td class="profile-input"><textarea rows="1" class="form-control id"></textarea></td>
 		</tr>
 		<tr>
	 		<td class="bold">이름</td>
	 		<td class="profile-input"><textarea rows="1" class="form-control id"></textarea></td>
	 		
	 		<td>
		 		<label for="file" class="modrem">&nbsp;&nbsp;&nbsp;&nbsp;프로필 사진 변경</label>
		 		
		 		<input type="file" name="file" id="file">
	 		</td>
		
 		</tr>
 		<tr>
	 		<td class="bold">닉네임</td>
	 		<td class="profile-input"><textarea rows="1" class="form-control id"></textarea></td>
	 		<td><button class="modrem">중복확인</button></td>
 		</tr>
 		<tr>
	 		<td class="bold">이메일</td>
	 		<td class="profile-input"><textarea rows="1" class="form-control id"></textarea></td>
	 		<td><button class="modrem">중복확인</button></td>
 		</tr>
 		<tr>
	 		<td class="bold">휴대폰</td>
	 		<td class="profile-input"><textarea rows="1" class="form-control id"></textarea></td>
	 		<td><button class="modrem">본인인증</button></td>
 		</tr>
 		<tr>
	 		<td class="bold">성별</td>
	 		<td class="profile-input"><label for="man">남자</label><input type="radio" name="gender" id="man" value="남자"> 
	 			<label for="woman">여자</label><input type="radio" name="gender" id="woman" value="여자">
	 		</td>
 		
 		</tr>
 	</table>

	
</div>




<script type="text/javascript">
$('#file').change(
		function() {
			var formData = new FormData();
			var inputFile = $("input[type='file']");
			var files = inputFile[0].files;

			/* var fileName = arr[0].thumbnailURL;
			
			$.post('/Mate/removeFile', {
				fileName : fileName
			}, function(result) {
				console.log(result);
			}); */
			$("#profileImg").remove();
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
							$("#image").val(str);
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
	
	
</script>












</html>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>