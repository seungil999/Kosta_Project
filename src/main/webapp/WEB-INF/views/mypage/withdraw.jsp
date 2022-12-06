<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ include file="/WEB-INF/views/includes/sidebar.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">
<style>	
button:disabled {
  background: #ccc;
}
</style>

<div class="myp-title">회원탈퇴</div>
	<div class="main">
		<div class="bold">회원탈퇴</div>
	<hr>
	<h2 style="text-align:center; color:#42DF2B;">회원 탈퇴 주의사항</h2><br><br>
	<p style="text-align:center; font-weight:600; font-size:17px;">ZupgoZupup 온라인/모바일 로그인 및 게시판이용 불가, 일반계정 삭제,<br><br>
	   회원탈퇴 시 ZupgoZupup에 로그인할 수 없습니다.<br><br>
	   작성 했던 모든 게시글 및 모든 모임이 삭제됩니다.</p>
	   <br><br>
	 <input type='password' id='pwd' class="form-control id" style="height:35px; margin:0 auto;" placeholder="비밀번호를 입력해주세요" >
	 <br>
	 <p style="text-align:center;">
	 <input id='agreeprov' type="checkbox" style="margin:0 auto;" >
	 위의 회원 탈퇴 시 주의사항을 모두 확인하였습니다.</p><br>
	 <div style="text-align:center;">
	 <button id='withdraw' class="withdraw" style="width:250px; height:50px; border-radius:80px 80px;" disabled>회원탈퇴</button>
	 </div>
</div>
<form id='submit' action='/mypage/withdraw' method='post'>

</form>
<script>
$(document).ready(function() {
	const agree= document.querySelector('#agreeprov');
	const withdraw = document.querySelector('#withdraw');
	console.log(withdraw)
	var chk="false";
	
	agree.addEventListener('change',listener);
	function listener() {
		var checked = $('#agreeprov').is(':checked');
		if(checked){
			var chk=true;
		}
	    switch (!chk==true) {
	        case true: withdraw.disabled = true; break;
	        case false: withdraw.disabled = false; break;
	    }
	}
});

$(".withdraw").click(function() {
	var pass=$('#pwd').val();
	var sessionPass="<c:out value='${userVO.pwd}'/>";
	if(sessionPass != pass){
		alert('비밀번호가 틀렸습니다');
		return;
	}else{
		if (confirm("정말 삭제하시겠습니까?"))
			$('#submit').submit();
		   	alert('회원탈퇴가 정상 처리되었습니다.');
		 }
	});


</script>
















</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>