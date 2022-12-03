<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="shortcut icon" type="image/x-icon"
	href="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/800px-Apple_logo_black.svg.png">
<title>ZupgoZupup</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

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
							<a class="navbar-brand custom_navbar-brand" href="/">
							<img src="${pageContext.request.contextPath}/resources/img/logo1.png"
								alt=""></a>
						</div>
						<!--End of navbar-header-->
						<div class="collapse navbar-collapse zero_mp"
							id="bs-example-navbar-collapse-2">
							<ul class="nav navbar-nav navbar-right main_menu1">
								
								<!--로그인 / 로그아웃-->
								<li class="nav-item">
								<c:choose>
										<c:when test="${userVO eq null}">
											<li><a href="user/joinPage">회원가입</a></li>
											<li><a class="nav-link" href="/user/loginPage">로그인</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="/mypage/activity">마이페이지</a></li>
											<li><a class="nav-link" href="/user/logout">로그아웃</a></li>

										</c:otherwise>
									</c:choose>
								</li>
								<li><a href="/ServiceCenter/">고객센터</a></li>
							</ul>
						</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse zero_mp"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav navbar-right main_menu">
								<li><a href="/matefind/list">메이트찾기 <span class="sr-only">(current)</span></a></li>
								<li><a href="/Mate/MateCreateMain" onclick="loginChk();" id="create">메이트모집</a></li>
								<li><a href="">추천</a></li>
								<li><a href="/review/list">후기</a></li>
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
	
<script>
	function loginChk(){
		if(${userVO.id eq null}){
			alert("로그인 후 이용 가능한 서비스입니다.");
			$("#create").attr("href", "/user/loginPage")
		}
	}
</script>