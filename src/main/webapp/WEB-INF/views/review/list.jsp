<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<!DOCTYPE html>
<html>
<link href="${pageContext.request.contextPath}/resources/css/review.css" rel="stylesheet">	
	
	<div>

		<form id='searchForm' action="/matefind/list" method='get'>
			<select name='type' id='type' class='mate-select'>
				
				<option value="A" name="option" class="lang-option"
					<c:out value="${pageMaker.cri.type eq 'A'?'selected':''}"/>>활동명</option>
				<option value="M" class="lang-option"
					<c:out value="${pageMaker.cri.type eq 'M'?'selected':''}"/>>지역별</option>
			</select> 
			<div class="mate-keyword">
               <input type="text" class="form-control" name="keyword" id="keyword" placeholder="검색어를 입력해주세요"
				value="" />
			</div>
				 <input type='hidden' name='pageNum' value="" />
				 <input type='hidden' name='amount' value="" />
			<button class='find' id=''>찾기</button>
		</form>
		
	</div>
	<br><br><br><br>
	<div class="review-title">후기</div> 
	<div class="main">
		<span class="filter">최신순</span>
		<span class="filter">좋아요순</span>
		<span class="filter">댓글순</span>
		<br><br>
		<hr>
	<span class="image"><img class="activity-Img" src="/resources/img/기본프로필.png"></span>
		<span class="titleInfo">10월 23일 광안리 플로깅</span>
		<span class="date">2022.10.28</span>
		<div class="content">광안리 플로깅 내용 안녕하세요 이번에 광안리..</div>
		<div class="content"></div>
		<div class=""
	</div>
	
</html>





<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
