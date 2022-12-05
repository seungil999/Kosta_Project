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
		<span class="bold">참여중인 활동내역</span>
		 <span class="myp-allview"><a href="/mypage/schedule">전체보기 ></a></span>
	<hr>
	<c:if test="${mate[0] ne null }">	
		<div class="activity-Info">
		<span class="myp-image"><img class="activity-Img" src="/Mate/display?fileName=${mate[0].image}"/></span>
			 <div class="myp-titleInfo"><a href="/matefind/get?no=${mate[0].no}">${mate[0].activityname}</a></div>
		
			 <div class="myp-info">${mate[0].peoplenum}명 / ${mate[0].peoplemaxnum}명</div>
			 <div class="myp-info" id="meetingdate">${mate[0].meetingdate}</div>
			 <div class="myp-info">${mate[0].meetingplace}</div>
		</div>	 
		<br><br><br><br>
	</c:if>
	<c:if test="${mate[1] ne null }">
		<div class="activity-Info">
		<span class="myp-image"><img class="activity-Img" src="/Mate/display?fileName=${mate[1].image}"/></span>
			 <div class="myp-titleInfo"><a href="/matefind/get?no=${mate[1].no}">${mate[1].activityname}</a></div>
		
			 <div class="myp-info">${mate[1].peoplenum}명 / ${mate[1].peoplemaxnum}명</div>
			 <div class="myp-info" id="meetingdate">${mate[1].meetingdate}</div>
			 <div class="myp-info">${mate[1].meetingplace}</div>
		</div>	 
		<br><br><br><br>
	</c:if>
	<br>
	<span class="myp-allview"><a href="/mypage/finish">전체보기 ></a></span>
	<div class="bold">종료된 활동내역</div>
<hr>
<c:if test="${emate[0] ne null }">
	<div class="activity-Info">
		<span class="myp-image"><img class="activity-Img" src="/Mate/display?fileName=${emate[0].image}"/></span>
			 <div class="myp-titleInfo">${emate[0].activityname }</div>
			 <div class="myp-info">${emate[0].peoplenum }명 / ${emate[0].peoplemaxnum }명</div>
			 <div class="myp-info">${emate[0].meetingdate }</div>
			 <div class="myp-info">${emate[0].meetingplace }</div>
			 <button type="button" data-no="${emate[0].no}" class="uploadbtn">후기작성</button>
		</div>
</c:if>
<c:if test="${emate[1] ne null }">
<br><br>
		<div class="activity-Info">
		<span class="myp-image"><img class="activity-Img" src="/Mate/display?fileName=${emate[1].image}"/></span>
			 <div class="myp-titleInfo">${emate[1].activityname }</div>
		
			 <div class="myp-info">${emate[1].peoplenum }명 / ${emate[1].peoplemaxnum }명</div>
			 <div class="myp-info">${emate[1].meetingdate }</div>
			 <div class="myp-info">${emate[1].meetingplace }</div>
			 <button type="button" data-no="${emate[1].no}" class="uploadbtn">후기작성</button>
	</div>
</c:if>	
	<br><br>
	
	
	</div>

<script type="text/javascript">
	$(document).on("click", '.uploadbtn', function(e){
	
	 var no = $(this).data("no");
	
	 location.href="/review/writeForm?no="+no;
	 
		
	});
</script>


	
</html>





<%@ include file="/WEB-INF/views/includes/footer.jsp" %>