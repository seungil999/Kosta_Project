<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ include file="/WEB-INF/views/includes/sidebar.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">	

<div class="myp-title">내 활동 내역</div>
	<div class="main">
		<span class="bold">예정된 활동</span>
	<hr>
	<c:if test="${empty list}">
		<div style="text-align:center;">참여중인 활동이 없습니다.</div>
	</c:if>
	<c:forEach items="${list }" var="mate">	
		<div class="activity-Info">
		<span class="myp-image"><img class="activity-Img" src="/Mate/display?fileName=${mate.image}"/></span>
			 <div class="myp-titleInfo"><a href="/matefind/get?no=${mate.no}">${mate.activityname}</a></div>
			
			 <div class="myp-info">${mate.peoplenum}명 / ${mate.peoplemaxnum}명</div>
			 <div class="myp-info m-meetingdate" id="meetingdate">${mate.meetingdate}</div>
			 <div class="myp-info">${mate.meetingplace}</div>
			 <input type="hidden" class="m-meetingtime" value="${mate.meetingtime}">
			 <div class="myp-info m-timer" id=${mate.no } style="color:red;"></div>
		</div>	 
		<br><br><br><br>
	</c:forEach>
	
</div>






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
		console.log($(item).val());
		if($(item).val().length==4){
			var time = $(item).val().slice(0,2)+":"+$(item).val().slice(2,4);	
		}else if($(item).val().length==3){
			var time = $(item).val().slice(0,1)+":"+$(item).val().slice(1,3);
		}else if($(item).val().length==2){
			var time = "00:"+$(item).val();
		}else if($(item).val().length==1){
			var time = "00:0"+$(item).val();
		}else{
			var time = '00:00';
		}
		
		timeList.push(time);
	});
	for(var i=0; i<count; i++){
	console.log(dateList[i]+timeList[i]);
	}
}
$('.m-timer').each(function(index,item){
	countDownTimer(item.id, dateList[index]+timeList[index]); 
})
console.log(timeList);
</script>



</html>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>