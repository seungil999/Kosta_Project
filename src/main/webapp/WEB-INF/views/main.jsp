<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
</head>
<style>
.BestList {
	background: white;
	border: 3px solid #42DF2B;
	border-radius: 15px;
	margin: 10px auto 40px;
	width: 1000px;
	padding-bottom: 40px;
	position: relative;
	padding: 10px;
}

.BestListHeader {
	margin: 0 250px;
	position: relative;
	padding: 10px;
	font-weight: bold;
	padding-top: 40px;
}

p {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.htemp {
	color: red;
}

.ltemp {
	color: blue;
}

.weatherAPI {
	float:right;
	width:25%;
}
.weatherAPI .ctemp{
	font-size:20px;
}
</style>
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
								<h2>환경과 건강을 챙기는 플로깅</h2>
								<br>
								<p>함께 하고싶다면 ZupGoZupUp 에서 시작하세요</p>
								<a href="/MainDetail" class="custom_btn">플로깅이란?</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--End of Carousel Inner-->
		</div>
	</section>
	<!--end of slider section-->
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"
		integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
		crossorigin="anonymous"></script>
	<script>
		$
				.getJSON(
						'https://api.openweathermap.org/data/2.5/weather?lat=37.4730836&lon=126.8788276&appid=1739efda697cf8ad45f9120598c9257d&units=metric',
						function(result) {
							$('.ctemp').append(result.main.temp);
							$('.htemp').append(result.main.temp_max);
							$('.ltemp').append(result.main.temp_min);
							var wiconURL = '<img src="http://openweathermap.org/img/wn/'+result.weather[0].icon+'.png" alt="'+result.weather[0].description+'">'
							$('.icon').html(wiconURL);
							
						});
	</script>

	<section id="intro">
		<div class="section_title">
			<div class="weatherAPI">
				<b class="icon"> </b> 
				<b class="ctemp"></b><b style="font-size:20px;">°</b>
				<b class="weather"></b>
				<span class="ltemp"></span>°
				<b>/</b>
				<span class="htemp"></span>°
			</div>
		</div>
	</section>


	<!-- 메인 좋아요 순 리스트 -->
	<h3 class="BestListHeader">이번주 Zup픽</h3>
	<div class="BestList">
		<div class="row">
			<c:forEach items="${list}" var="mate">
				<div class="col-md-4">
					<div class="blog_news">
						<div class="single_blog_item">

							<div class="blog_img">
								<a class='move' href="${mate.no}"><img
									style="width: 360px; height: 300px;"
									src="/Mate/display?fileName=${mate.image}" /></a>
							</div>
							<div class="blog_content">
								<h2 class="mate-title">
									<a class='move' href="${mate.no}">활동명 : ${mate.activityname }</a>
								</h2>
								<div class="expert">
									<div class="left-side text-left">
										<p class="left_side">
											<span class="admin"> <c:choose>
													<c:when test="${mate.regular eq 1 }">
														<span style="color: #60e44c;">정기활동</span>
													</c:when>
													<c:when test="${mate.regular eq 0 }">
														<span style="color: #ff8a8a;">번개활동</span>
													</c:when>
												</c:choose></span><br> <span class="admin">활동장 : ${mate.writer }</span><br>
											<span class="admin">모임장소 : ${mate.meetingplace}</span><br>
											<span class="admin">활동날짜 : ${mate.meetingdate}
												(${mate.dayofweek }) / </span> <span class="admin meetingtime">${mate.meetingtime }</span><br>
											<span class="admin">모임인원 :</span><span class="admin"
												style="color: orange;">${mate.peoplenum } </span> /<span
												class="admin">${mate.peoplemaxnum } 명</span><br> <span
												class="admin">작성일 : ${mate.regdate }</span><br> <span
												class="admin">내용 : </span><span class="content">${mate.content }</span>

										</p>
										<br> <br>
										<p class="right_side text-right">
											<span class="right_msg text-right"><i
												class="fa fa-comments-o"></i></span> <span class="count">${mate.replycnt }
											</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-heart"></i>
											<span class="count">${mate.likecnt }</span>
										</p>
									</div>
								</div>
								<p class="blog_news_content"></p>
								<a href="" class="blog_link"></a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<form id='actionForm' action="/matefind/list" method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

		<input type='hidden' name='type'
			value='<c:out value="${ pageMaker.cri.type }"/>'> <input
			type='hidden' name='keyword'
			value='<c:out value="${ pageMaker.cri.keyword }"/>'> <input
			type='hidden' name='meeting'
			value='<c:out value="${ pageMaker.cri.meeting }"/>'> <input
			type='hidden' name='filter'
			value='<c:out value="${ pageMaker.cri.filter }"/>'>


	</form>

	<!--Start of counter-->
	<section id="counter">
		<div class="counter_img_overlay">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="counter_header">
							<h2>ZupGo! ZupUp!</h2>
							<p>
								<strong id="getMonth"></strong>월 지구를 총 3번 23시간 정화했어요!
							</p>
						</div>
					</div>
					<!--End of col-md-12-->
				</div>
				<!--End of row-->
				<div class="row">
					<div class="col-md-3">
						<div class="counter_item text-center">
							<div class="sigle_counter_item">
								<img src="/resources/img/tree.png" alt="">
								<div class="counter_text">
									<span class="counter">24,871</span>
									<p>탄소 정화량</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="counter_item text-center">
							<div class="sigle_counter_item">
								<img src="/resources/img/trash.png" alt="">
								<div class="counter_text">
									<span class="counter">1,658,098</span>
									<p>쓰레기 정화량</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="counter_item text-center">
							<div class="sigle_counter_item">
								<img src="/resources/img/tuhnder.png" alt="">
								<div class="counter_text">
									<span class="counter">9854</span>
									<p>이번 달 번개</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="counter_item text-center">
							<div class="sigle_counter_item">
								<img src="/resources/img/group.png" alt="">
								<div class="counter_text">
									<span class=""></span>
									<!-- 수정중 달 단위 -->
									<span class="counter">5412</span>
									<p>이번 달 정기</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--End of row-->
			</div>
			<!--End of container-->
		</div>
	</section>
	<!--end of counter-->

	<!-- 맨 위로 가기 -->
	<a href="#" id="back-to-top" title="Back to top">&uarr;</a>


	<!--날씨-->

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<!-- <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>-->
	<script src="js/jquery-1.12.3.min.js"></script>

	<!--Counter UP Waypoint-->
	<script src="js/waypoints.min.js"></script>
	<!--Counter UP-->
	<script src="js/jquery.counterup.min.js"></script>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							history.replaceState({}, null, null);
							var actionForm = $("#actionForm");
							var searchForm = $("#searchForm");
							$(".move")
									.on(
											"click",
											function(e) {
												e.preventDefault();
												$('input').remove("#no");
												actionForm
														.append("<input type='hidden' id='no' name='no' value='"
																+ $(this).attr(
																		"href")
																+ "'>");
												actionForm.attr("action",
														"/get");
												actionForm.submit();

											});
						});
	</script>

	<script>
		$('.counter').counterUp({
			delay : 10,
			time : 1000
		});
	</script>

	<script>
		var now = new Date();
		var month = now.getMonth();
		document.querySelector("#getMonth").innerText = month + 1;
	</script>



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
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
