<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->


<body data-spy="scroll" data-target="#header">


	<!--Start of slider section-->
	<section id="slider">
		<div id="carousel-example-generic"
			class="carousel slide carousel-fade" data-ride="carousel"
			data-interval="3000">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<div class="slider_overlay">
						<img
							src="${pageContext.request.contextPath}/resources/img/main.jpg"
							alt="...">
						<div class="carousel-caption">
							<div class="slider_text">
								<h3>플로깅</h3>
								<h2>플로깅</h2>
								<p>플로깅</p>
								<a href="" class="custom_btn">플로깅 설명페이지로 이동</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--End of Carousel Inner-->
		</div>
	</section>
	<!--end of slider section-->

	<section id="intro">
		<div class="intro_notice">
			<div class="intro_notice_tl">
				<div class="section_title">공지사항</div>
				<div class="notice_title">비긴메이트 파트너 전문가 등록 안내</div>
				<div class="notice_sub_title">with 글로벌 팀빌딩 플랫폼</div>
				<div class="more_bt">날씨 api</div>				                        
			</div>
		</div>
	</section>

	<!-- 메인 좋아요 순 리스트 -->

	<h2>좋아요 순으로 리스트 출력</h2>

	<c:choose>
		<c:when test="${articleList!=null && pageInfo.listCount>0 }">
			<section id="listForm">
				<table>
					<tr id="tr_top">
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>날짜</td>
						<td>조회수</td>
					</tr>

					<c:forEach var="article" items="${articleList }">
						<tr>
							<td>${article.board_num }</td>
							<td><c:choose>
									<c:when test="${article.board_re_lev!=0}">
										<c:forEach var="i" begin="0" end="${article.board_re_lev*2}">
							&nbsp;
						</c:forEach>
						▶
					</c:when>
									<c:otherwise>▶</c:otherwise>
								</c:choose> <a
								href="./boarddetail?board_num=${article.board_num}&page=${pageInfo.page}">
									${article.board_subject} </a></td>
							<td>${article.board_name }</td>
							<td>${article.board_date }</td>
							<td>${article.board_readcount }</td>
						</tr>
					</c:forEach>
				</table>
			</section>
			<section id="pageList">
				<c:choose>
					<c:when test="${pageInfo.page<=1}">
					[이전]&nbsp;
				</c:when>
					<c:otherwise>
						<a href="boardList?page=${pageInfo.page-1}">[이전]</a>&nbsp;
				</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${pageInfo.startPage }"
					end="${pageInfo.endPage }">
					<c:choose>
						<c:when test="${pageInfo.page==i }">[${i }]</c:when>
						<c:otherwise>
							<a href="boardList?page=${i}">[${i }]</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${pageInfo.page>=pageInfo.maxPage }">
					[다음]
				</c:when>
					<c:otherwise>
						<a href="boardList?page=${pageInfo.page+1}">[다음]</a>
					</c:otherwise>
				</c:choose>
			</section>
		</c:when>
		<c:otherwise>
			<section id="emptyArea">등록된 글이 없습니다.</section>
		</c:otherwise>
	</c:choose>
	
	
	<!--  플로깅 하러가기 -->
	
	<div class="intro_chapter chap4">
		<div class="sub_title">Starting with beginmate</div>
		<div class="main_copy">작은 일도 시작해야, 위대한 일도 생긴다 - 마크 주커버그 -</div>
		<div class="main_copy_desc">당신과 함께 팀을 이루고 싶은 메이트들이 기다리고 있습니다.
			지금, 비긴메이트에서 만나보세요!</div>
		<span class="start_bt">플로깅 하러가기 > 메이트찾기로 이동</span>
	</div>

	<!--Scroll to top-->
	<a href="#" id="back-to-top" title="Back to top">&uarr;</a>
	<!--End of Scroll to top-->

	
	<!--날씨-->
	
	
	


	<!--Isotope-->
	<script
		src="${pageContext.request.contextPath}/resources/js/isotope/min/scripts-min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/isotope/cells-by-row.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/isotope/isotope.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/isotope/packery-mode.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/isotope/scripts.js"></script>

	<!--Back To Top-->
	<script
		src="${pageContext.request.contextPath}/resources/js/backtotop.js"></script>


	<!--JQuery Click to Scroll down with Menu-->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.localScroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.scrollTo.min.js"></script>
	<!--WOW With Animation-->
	<script
		src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
	<!--WOW Activated-->
	<script>
		new WOW().init();
	</script>


	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<!-- Custom JavaScript-->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>

</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
