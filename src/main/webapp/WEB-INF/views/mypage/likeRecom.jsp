<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ include file="/WEB-INF/views/includes/sidebar.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html>
<div class="myp-title">관심 목록</div>
	<div class="main">
		<span class="bold">좋아요한 추천장소</span>
	<hr>
	<c:if test="${empty list}">
		<div style="text-align:center;">좋아요한 추천장소가 없습니다.</div>
	</c:if>
	
	</div>
	

<script type="text/javascript">
</script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">	



















</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>