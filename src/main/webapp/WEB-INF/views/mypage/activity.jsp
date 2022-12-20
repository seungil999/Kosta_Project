<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ include file="/WEB-INF/views/includes/sidebar.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>

<html>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">	
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap" rel="stylesheet">

<head>
<style>
body{
	font-family: 'Yeon Sung', cursive;
}
</style>
</head>
<body>

<div class="myp-title">내 활동 내역</div>
	<div class="main">
		<span class="bold">참여중인 활동내역</span>
		 <span class="myp-allview"><a href="/mypage/schedule">전체보기 ></a></span>
	<hr>
	<c:if test="${empty mate}">
		<div style="text-align:center;">참여중인 활동이 없습니다.</div>
	</c:if>
	<c:forEach items="${mate }" var="mate">
		<div class="activity-Info">
		<span class="myp-image"><img class="activity-Img" src="/Mate/display?fileName=${mate.image}"/></span>
			 <div class="myp-titleInfo"><a href="/matefind/get?no=${mate.mate_no}">${mate.activityname}</a></div>
		
			 <div class="myp-info">${mate.peoplenum}명 / ${mate.peoplemaxnum}명</div>
			 <div class="myp-info m-meetingdate">${mate.meetingdate}</div>
			 <div class="myp-info">${mate.meetingplace}</div>
			 <div class="myp-info m-timer" id=${mate.mate_no } style="color:red;"></div>
			 <input type="hidden" class="m-meetingtime" value="${mate.meetingtime}">
		</div>	 
		<br><br><br><br>
	</c:forEach>
	<br>
	<span class="myp-allview"><a href="/mypage/finish"><b>전체보기 ></b></a></span>
	<div class="bold">종료된 활동내역</div>
<hr>
	<c:if test="${empty emate}">
		<div style="text-align:center;">참여했던 활동이 없습니다.</div>
	</c:if>
	<c:forEach items="${emate }" var="emate">
	<div class="activity-Info">
		<span class="myp-image"><img class="activity-Img" src="/Mate/display?fileName=${emate.image}"/></span>
			 <div class="myp-titleInfo">${emate.activityname }</div>
			 <div class="myp-info">${emate.peoplenum}명 / ${emate.peoplemaxnum}명</div>
			 <div class="myp-info" id="e-meetingdate">${emate.meetingdate }</div>
			 <div class="myp-info">${emate.meetingplace }</div>
			 <button type="button" data-no="${emate.mate_no}" class="uploadbtn">후기작성</button>
		</div>

<br><br>
	</c:forEach>	
	<br><br>
	
	
	</div>
<body>

</body>

<script type="text/javascript">
	$(document).on("click", '.uploadbtn', function(e){
	
	 var no = $(this).data("no");
	
	 location.href="/review/writeForm?no="+no;
	 
		
	});
</script>




<script>
const countDownTimer = function (id, date) {
	var _vDate = new Date(date); // 전달 받은 일자
	var _second = 1000;
	var _minute = _second * 60;
	var _hour = _minute * 60;
	var _day = _hour * 24;
	var timer;

	function showRemaining() {
		var now = new Date();
		var distDt = _vDate - now;

		if (distDt < 0) {
			clearInterval(timer);
			document.getElementById(id).textContent = '모임 시간입니다!';
			return;
		}

		var days = Math.floor(distDt / _day);
		var hours = Math.floor((distDt % _day) / _hour);
		var minutes = Math.floor((distDt % _hour) / _minute);
		var seconds = Math.floor((distDt % _minute) / _second);

	
		document.getElementById(id).textContent = '남은시간 : '+ days + '일 ';
		document.getElementById(id).textContent += hours + '시간 ';
		document.getElementById(id).textContent += minutes + '분 ';
		document.getElementById(id).textContent += seconds + '초';
	}

	timer = setInterval(showRemaining, 1000);
}
var count=0;
const dateList=[];
const timeList=[];
typeChange();
function typeChange(){
	
	$(".m-meetingdate").each(function(index,item){
		var year = $(item).html().slice(0,4)+" ";
		var month = $(item).html().slice(5,7)+"/";
		var day = $(item).html().slice(8,10)+"/";
		var date = month+day+year;
		dateList.push(date);
		count++;
	});
	$(".m-meetingtime").each(function(index,item){
		var time = $(item).val().slice(0,2)+":"+$(item).val().slice(2,4);
		timeList.push(time);
	});
	for(var i=0; i<count; i++){
	console.log(dateList[i]+timeList[i]);
	}
}
$('.m-timer').each(function(index,item){
	countDownTimer(item.id, dateList[index]+timeList[index]); 
})
</script>
</body>
</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>