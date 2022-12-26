<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ include file="/WEB-INF/views/includes/sidebar.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap" rel="stylesheet">
<head>
<style>
body{
	font-family: 'Yeon Sung', cursive;
}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">	

<div class="myp-title">내 정보</div>
	<div class="main">
		<div style="text-align:center; margin-right:27px;"><img class='profileImg' id="profileImg" src='/Mate/display?fileName=${userVO.profile}'></div>
		  <div style="text-align:center; padding:2px;"><span style="color:#42df2b">${userVO.nickname}</span> 님 반가워요!</div>
		  
		  <div style="text-align:center; padding:2px;">${userVO.nickname} 님의 총 활동시간은 
		  <span class="info-time" style="color:#42df2b;">${time.HH}</span>시간 <span class="info-time" style="color:#42df2b;">${time.MM}</span>분 이에요.</div>
		  
		  <div style="text-align:center; padding:2px;" >${userVO.nickname} 님의 플로깅 완료 횟수는 총 <span class="info-time" style="color:#42df2b;"> ${time.count}</span>회에요.</div>
		  <c:choose>
		  	<c:when test="${time.grade>=3}">
  		<div style="margin-left:291px;">
		  	<img class="grade" src="/resources/img/3grade.png">
		  	<div class="progress" style="width:200px; margin-bottom:3px;">
		    <div class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar"
		   style="width:0%">
		    </div>
		  </div>
		 </div>
		 <span style="margin-left:320px;">
		<span style="color:#42df2b">${userVO.nickname}</span>님의 등급은 <span style="color:red">3단계</span>입니다.
		</span>
		  	</c:when>
		  	<c:when test="${time.grade==2}">
		  	<div style="margin-left:291px;">
		  	<img class="grade" src="/resources/img/2grade.png">
		  	<div class="progress"  style="width:200px; margin-bottom:3px;">
		    <div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar"
		   style="width:0%">
		    </div>
		  </div>
		  </div>
		  <span style="margin-left:320px;">
			<span style="color:#42df2b">${userVO.nickname}</span>님의 등급은 <span style="color:blue">2단계</span>입니다.
		  </span>
		  	</c:when>
		  	<c:when test="${time.grade==1}">
		  	<div style="margin-left:291px;">
		  	<img class="grade" src="/resources/img/1grade.png">
		  	<div class="progress" style="width:200px; margin-bottom:3px;">
			    <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar"
			   style="width:0%">
			    </div>
		   </div>
		  </div>
		 <span style="margin-left:320px;">
			<span style="color:#42df2b">${userVO.nickname}</span>님의 등급은 <span style="color:green">1단계</span>입니다.
	     </span>
		  	</c:when>
		  </c:choose>
		  
	<hr>

   <div class="chart-container" style="position: relative; float:left; width:50%;">
    <canvas id="myChart"></canvas>
  </div>
<div class="chart-container2" style="position:relative; float:left; width:50%;"> 
       <canvas id="myChart1"></canvas>     
</div>
    <br><br><br><br><br><br><br><br><br><br><br>
  
</div>

    <script type="text/javascript">
    var jan = "<c:out value='${time.jan}'/>";
    var feb = "<c:out value='${time.feb}'/>";
    var mar = "<c:out value='${time.mar}'/>";
    var apr = "<c:out value='${time.apr}'/>";
    var may = "<c:out value='${time.may}'/>";
    var june = "<c:out value='${time.june}'/>";
    var july = "<c:out value='${time.july}'/>";
    var aug = "<c:out value='${time.aug}'/>";
    var sept = "<c:out value='${time.sept}'/>";
    var oct = "<c:out value='${time.oct}'/>";
    var nov = "<c:out value='${time.nov}'/>";
    var dec = "<c:out value='${time.dec}'/>";
    var year = "<c:out value='${time.year}'/>";
    console.log(jan);
    console.log(dec);
    var ctx = document.getElementById('myChart');
    var myChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: ['1월', '2월', '3월', '4월', '5월', '6월','7월','8월','9월','10월','11월','12월'],
        datasets: [{
          label: year + ' 플로깅 완료횟수',
          data: [jan,feb,mar,apr,may,june,july,aug,sept,oct,nov,dec],
          backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(255, 206, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(255, 159, 64, 0.2)',
            'rgba(255, 99, 132, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(255, 206, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(255, 159, 64, 0.2)'
            
          ],
          borderColor: [
            'rgba(255, 99, 132, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)',
            'rgba(75, 192, 192, 1)',
            'rgba(153, 102, 255, 1)',
            'rgba(255, 159, 64, 1)',
            'rgba(255, 99, 132, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)',
            'rgba(75, 192, 192, 1)',
            'rgba(153, 102, 255, 1)',
            'rgba(255, 159, 64, 1)'
          ],
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          yAxes: [{
            ticks: {
              beginAtZero: true
            }
          }]
        }
      }
    });
    
    /** 파이형 차트 **/
    var regular = "<c:out value='${time.regular}'/>";
    var flash = "<c:out value='${time.flash}'/>";
    data = {
            datasets: [{
                backgroundColor: ['rgba(66, 223, 43, 0.3)','rgba(255, 62, 67, 0.3)'],
                data: [regular, flash]
            }],       
            // 라벨의 이름이 툴팁처럼 마우스가 근처에 오면 나타남
            labels: ['정기모임','번개모임'] 
        };

      // 가운데 구멍이 없는 파이형 차트
      var ctx1 = document.getElementById("myChart1");
      var myPieChart = new Chart(ctx1, {
          type: 'pie',
          data: data,
          options: {}
      });
      
     window.onload=function(){
    	 var grade = "<c:out value='${time.grade}'/>";
    	 var count = "<c:out value='${time.count}'/>";
    	 console.log(count);
    	 if(grade>=4){
    		 $('.progress-bar').css({
    		     
    	    	  "width":"100%"
    	      });	 
    	 }else{
    		 var exp = (count%10) * 10;
    		 $('.progress-bar').css({
    		     
    	    	  "width":exp+"%"
    	      });
    	 }
    	 
    	 
    	 
     };
  </script>
		  	
	

</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>