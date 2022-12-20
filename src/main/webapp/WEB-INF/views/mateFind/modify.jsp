<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/resources/js/mateReply.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/mate-find.css" rel="stylesheet">


<div class="mate-border">
<br>
 <div class="mate-container">
	
		 <div class="mate-topinfoImg">
  <form action="/matefind/modify" method="post" name="sub" onsubmit="typeChange()">
            <img src="/Mate/display?fileName=${mate.image}" style="width:360px; height:300px;"/>
            <input type="hidden" name="image" id="image" value="${mate.image}">
            <div class="uploadResult"></div>
								
        </div>
		
		 <div class="mate-topinfo">
          <h2 class="mate-title">활동명</h2>
          <textarea class="form-control activityname" name="activityname" id="activityname">${mate.activityname }</textarea>
        </div><br><br><br><br>

        <div class="mate-topinfo">
          <h2 class="mate-title">활동일시</h2>
          <input class="form-control meetingdate" type="date" name="meetingdate" id="meetingdate" value="${mate.meetingdate }">

        </div><br><br><br><br><br><br>
        
        <div class="mate-topinfo">
          <h2 class="mate-title">최대인원</h2>
          <input type="button" onclick="countDown();" value="-" 
          class="peopleBtn">&nbsp;&nbsp; <strong id="maxnum">${mate.peoplemaxnum}</strong>&nbsp;&nbsp;
			<input type="button" onclick="countUp();" value="+"
			class="peopleBtn"> <input type="hidden"
			id="peoplemaxnum" name="peoplemaxnum" value="2">
        </div>
        
        
        <br><br><br><br>
         
        
        <br><br><br>
        
        <br><br>
        <div class="mate-guide">안내사항</div>
        <hr>
        
        <div class="form-group">
          <h2 class="mate-title">모임시간</h2>
          <input class="form-control meetingtime" type="time" id="mtime" name="mtime" value="${mate.meetingtime }"> 
          <input type="hidden" id="meetingtime" name="meetingtime" value="${mate.meetingtime }">
        </div>
         <div class="form-group">
          <h2 class="mate-title">활동시간</h2>
		<input class="form-control time" type="time" id="stime" name="stime"><p style="font-weight:bolder; font-size:30px;">~</p>
		  <input class="form-control time" type="time" id="etime" name="etime">
			<input type="hidden" id="starttime" name="starttime" value="${mate.starttime }">
			<input type="hidden" id="endtime" name="endtime" value="${mate.endtime }">
        </div>
  		
        
		
		<div class="form-group">
          	  <h2 class="mate-title">모임장소</h2>
          	  <input type="text" class="form-control meetingplace" name="meetingplace" id="sample5_address" value="${mate.meetingplace }" size="25">
          	  <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" class="Btn">
          	  <div id="map" style="width: 60%; height: 100px; margin-top: 10px; display: none"></div>
        </div>
        <div class="form-group">
          	  <h2 class="mate-title">출발지</h2><textarea class="form-control startzone" name="startzone" id="startzone" >${mate.startzone }</textarea>
        </div>
        <div class="form-group">
         	  <h2 class="mate-title">목적지</h2><textarea class="form-control endzone" name="endzone" id="endzone">${mate.endzone }</textarea>
	 	</div>
	 	
        <div class="form-group">
          <h2 class="mate-title">안내사항</h2><textarea class="form-control content" name="content" id="content">${mate.content }</textarea>
        </div>
        
        
        
      <input type='hidden' id='no' name='no' value='<c:out value="${mate.no}"/>'>
	  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
	  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
  	  <input type='hidden' name='meeting' value='<c:out value="${cri.meeting }"/>'>
      <input type='hidden' name='filter' value='<c:out value="${cri.filter }"/>'>
        
    </form>    
        <p style="margin-top:-12px">
    
</p>

	<br>
	<button id='modify' type="button" class="modrem" style="width:100px;">완료</button>
	
        <br><br><br>
</div>

</div>      
    <form id='operForm'>
	  <input type='hidden' id='no' name='no' value='<c:out value="${mate.no}"/>'>
	  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
	  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
  	  <input type='hidden' name='meeting' value='<c:out value="${cri.meeting }"/>'>
      <input type='hidden' name='filter' value='<c:out value="${cri.filter }"/>'>
	</form>
	
	
<script type="text/javascript">
$(document).ready(function() {

   var operForm = $("#operForm"); 
	
  $("button[data-oper='list']").on("click", function(e){
    operForm.find("#no").remove();
    operForm.attr("action","/matefind/list")
    operForm.attr("method","get");
    operForm.submit();
    
  });
  

  $("button[id='modify']").on("click", function(e){
	
			
			var starttime = $("#stime").val();
			var endtime = $("#etime").val();
			var meetingtime = $("#mtime").val();
			
			starttime=starttime.replace(":","");
			endtime=endtime.replace(":","");
			meetingtime=meetingtime.replace(":", "");
			console.log(meetingtime);
			
	        parseInt(starttime);
	        parseInt(endtime);
	        parseInt(meetingtime);
	        console.log(endtime);
	        $("#starttime").val(starttime);
	        $("#endtime").val(endtime);
	        $("#meetingtime").val(meetingtime);
	        
	        document.sub.submit();
	
	 
    
  });
  
    
  $("button[id='remove']").on("click", function(e){
   
    operForm.attr("action","/matefind/remove");
    operForm.attr("method","post");
    operForm.submit();
    
  }); 
  
  
});




</script>


<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4a66ad8f3bff103d861fce2044f9138a&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};
		//지도를 미리 생성
		var map = new daum.maps.Map(mapContainer, mapOption);
		//주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		//마커를 미리 생성
		var marker = new daum.maps.Marker({
			position : new daum.maps.LatLng(37.537187, 127.005476),
			map : map
		});
		function sample5_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					var addr = data.address; // 최종 주소 변수
					// 주소 정보를 해당 필드에 넣는다.
					document.getElementById("sample5_address").value = addr;
					// 주소로 상세 정보를 검색
					geocoder.addressSearch(data.address, function(results,
							status) {
						// 정상적으로 검색이 완료됐으면
						if (status === daum.maps.services.Status.OK) {
							var result = results[0]; //첫번째 결과의 값을 활용
							// 해당 주소에 대한 좌표를 받아서
							var coords = new daum.maps.LatLng(result.y,
									result.x);
							// 지도를 보여준다.
							mapContainer.style.display = "block";
							map.relayout();
							// 지도 중심을 변경한다.
							map.setCenter(coords);
							// 마커를 결과값으로 받은 위치로 옮긴다.
							marker.setPosition(coords)
						}
					});
				}
			}).open();
		}
	</script>
<script>
		var count = 2;

		var countUp = function() {
			if (count < 30) {
				count = count + 1;
				$("#peoplemaxnum").val(count);
				document.querySelector("#maxnum").innerText = count;

			} else {
				alert("정기 모임은 2인 이상 30인 이하로 설정해주세요.");
			}
		};
		var countDown = function() {
			if (count > 2) {
				count = count - 1;
				$("#peoplemaxnum").val(count);
				document.querySelector("#maxnum").innerText = count;

			} else {
				alert("정기 모임은 2인 이상 30인 이하로 설정해주세요.");
			}
		};
		
		
		
	</script>	

</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>