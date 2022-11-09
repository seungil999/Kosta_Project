<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<link rel="shortcut icon" type="image/x-icon"
	href="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/800px-Apple_logo_black.svg.png">


 <head>
        <meta charset="utf-8">
        
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->


<meta charset="utf-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>ZupgoZupup</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!--    Google Fonts-->
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link
	href='https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css'
	rel='stylesheet' type='text/css'>
<!--Fontawesom-->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">

<!--Animated CSS-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/animate.min.css">

<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<!--Bootstrap Carousel-->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/carousel.css" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/isotope/style.css">

<!--Main Stylesheet-->
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">
<!--Responsive Framework-->
<link
	href="${pageContext.request.contextPath}/resources/css/responsive.css"
	rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>

<body data-spy="scroll" data-target="#header">

	<!--Start Hedaer Section-->
	<section id="header">
		<div class="header-area">

			<div class="header_menu text-center" data-spy="affix"
				data-offset-top="50" id="nav">
				<div class="container">
					<nav class="navbar navbar-default zero_mp ">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1"
								aria-expanded="false">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<a class="navbar-brand custom_navbar-brand" href="#"><img
								src="${pageContext.request.contextPath}/resources/img/logo1.png"
								alt=""></a>
						</div>
						<!--End of navbar-header-->
						<div class="collapse navbar-collapse zero_mp"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav navbar-right main_menu1">
								<li><a href="">회원가입</a></li>
								<!--로그인 / 로그아웃-->
								<li class="nav-item"><c:choose>
										<c:when test="${sessionScope.id eq null}">
											<a class="nav-link" href="./login">로그인</a>
										</c:when>
										<c:otherwise>
											<a class="nav-link" href="./logout">로그아웃</a>
										</c:otherwise>
									</c:choose></li>
								<li><a href="">고객센터</a></li>
							</ul>
						</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse zero_mp"
							id="bs-example-navbar-collapse-2">
							<ul class="nav navbar-nav navbar-right main_menu">
								<li><a href="">메이트찾기 <span class="sr-only">(current)</span></a></li>
								<li><a href="">메이트모집</a></li>
								<li><a href="">추천</a></li>
								<li><a href="">후기</a></li>
								<li><a href="">자유게시판</a></li>
							</ul>
						</div>
						<!-- /.navbar-collapse -->
					</nav>
					<!--End of nav-->
				</div>
				<!--End of container-->
			</div>
			<!--End of header menu-->
		</div>
		<!--end of header area-->
	</section>
	<!--End of Hedaer Section-->



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
	
	

	<!-- 푸터 -->
	<section id="footer">
		<div class="container">
			<div class="row text-center">
				<div class="col-md-15">
					<div class="copyright">
						<p>(주)ZupGoZupUp | 대표이사 | 개인정보관리책임자 (jupgo@jupup.com)</p>

						<p>서울 강남구 언주로69길 19, 지하1층(역삼동) | 02-6713-0817 |
							점심시간(13:00~14:00)</p>

						<p>사업자등록번호 123-45-67890 | 제2018-서울강남-02246호| 유료직업소개사업등록번호:
							(국내)제2020-3220237-14-5-00014호</p>
					</div>
					<div class="designer">
						<p>2022 © ZupgoZupup. All rights reserved</p>
					</div>
				</div>
			</div>
			<!--End of row-->
		</div>
		<!--End of container-->
	</section>
	<!--End of footer-->



	<!--Scroll to top-->
	<a href="#" id="back-to-top" title="Back to top">&uarr;</a>
	<!--End of Scroll to top-->


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<!-- <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>-->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-1.12.3.min.js"></script>

	<!--Counter UP Waypoint-->
	<script
		src="${pageContext.request.contextPath}/resources/js/waypoints.min.js"></script>
	<!--Counter UP-->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.counterup.min.js"></script>

	<script>
		//for counter up
		$('.counter').counterUp({
			delay : 10,
			time : 1000
		});
	</script>

	<!--Gmaps-->
	<script
		src="${pageContext.request.contextPath}/resources/js/gmaps.min.js"></script>
	<script type="text/javascript">
		var map;
		$(document).ready(function() {
			map = new GMaps({
				el : '#map',
				lat : 23.6911078,
				lng : 90.5112799,
				zoomControl : true,
				zoomControlOpt : {
					style : 'SMALL',
					position : 'LEFT_BOTTOM'
				},
				panControl : false,
				streetViewControl : false,
				mapTypeControl : false,
				overviewMapControl : false,
				scrollwheel : false,
			});

			map.addMarker({
				lat : 23.6911078,
				lng : 90.5112799,
				title : 'Office',
				details : {
					database_id : 42,
					author : 'Foysal'
				},
				click : function(e) {
					if (console.log)
						console.log(e);
					alert('You clicked in this marker');
				},
				mouseover : function(e) {
					if (console.log)
						console.log(e);
				}
			});
		});
	</script>
	<!--Google Maps API-->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjxvF9oTfcziZWw--3phPVx1ztAsyhXL4"></script>


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