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
<title>Insert title here</title>
</head>
<style>
.Btn {
	background-color: #a2cba1;
	border: 1px solid white;
	color: white;
	padding: 3px 40px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	border-radius: 15px;
	font-weight: bold;
}
</style>
<body>
	<div class="content-wrap">
		<div class="chap1">
			<div class="Explanation_title">"플로깅(Plogging)이란?"</div>
			<div class="Explanation_main">
				플로깅(plogging)은 이삭을 줍는다는 뜻인 스웨덴어 plocka upp과 영어 단어 jogging이 합쳐져 생긴
				합성어입니다. <br> 해외에서는 스웨덴어 plocka upp과 영어 단어 jogging이 합쳐진 <b>'플로깅'</b>
				, 국내에서는 '줍다'와 '조깅'을 결합한 <b>'줍깅'</b>으로 불리고 있습니다. <br> 조깅하면서 쓰레기를
				줍는 행동으로 2016년 스웨덴에서 처음 시작해 북유럽을 중심으로 확산되다가 현재는 전 세계적인 운동 트렌드로 자리매김하고
				있습니다. <br> 거리에 버려진 쓰레기를 최대한 많이 주우면서 목적지까지 가벼운 조깅으로 가는 것이 목적이기
				때문에 조깅하는 시간을 고려하여 필요한 쓰레기봉투와 장갑, 집게 등을 챙겨가는 것이 좋습니다.
			</div>
		</div>
		<div class="chap2">
			<div class="Explanation_title2">환경과 건강을 챙기는 플로깅 함께 해요</div>
			<div class="main_feature">
				<img src="/resources/img/findM.png"
					style="width: 130px; height: 142px;">
				<div class="ftitle">메이트 찾기</div>
				<div class="fmain">인근에 개설된 모임을 확인하고 직접 참여해보세요</div>
			</div>
			<div class="main_feature">
				<img src="/resources/img/createM.png"
					style="width: 130px; height: 142px;">
				<div class="ftitle">메이트 모집</div>
				<div class="fmain">인근 지역 모임이 없다면 모임을 직접 모집해보세요</div>
			</div>
			<div class="main_feature">
				<img src="/resources/img/bestP.png"
					style="width: 130px; height: 142px;">
				<div class="ftitle">추천</div>
				<div class="fmain">인근 지역에 갈만한 곳이 없다면 확인해보세요</div>
			</div>
			<div class="main_feature">
				<img src="/resources/img/afterP.png"
					style="width: 130px; height: 142px;">
				<div class="ftitle">후기</div>
				<div class="fmain">종료된 모임의 후기를 작성하고 확인도 해보세요</div>
			</div>
			<div class="main_feature">
				<img src="/resources/img/board.png"
					style="width: 130px; height: 142px;">
				<div class="ftitle">자유게시판</div>
				<div class="fmain">어떤 주제든 상관없이 자유롭게 소통해보세요</div>
			</div>
		</div>
		<div class="chap3">
			<div class="Explanation_main">
				<div class="Explanation_title2">Starting with ZupGoZupUp</div>
				<div class="Explanation_main">
					깨끗한 지구를 만들기 위해 <br>시작된 플로깅(plogging)운동! <br>조깅하면서 건강도
					관리하고, <br>깨끗한 길거리를 만들기 위해 <br>오늘부터 실천해 보시기 바랍니다.
				</div>
				<br> 
				<input type="button" class="Btn" value="메이트찾기" onclick="location.href='/matefind/list'">&nbsp;&nbsp;&nbsp;
				<a href="/Mate/MateCreateMain" onclick="loginChk();" id="create" class="Btn">메이트모집</a>
			</div>
		</div>
	</div>
	
<script>
	function loginChk(){
		if(${userVO.id == null}){
			alert("로그인 후 이용 가능한 서비스입니다.");
			$("#create").attr("href", "/user/loginPage")
		}
	}
</script>
</body>

</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>