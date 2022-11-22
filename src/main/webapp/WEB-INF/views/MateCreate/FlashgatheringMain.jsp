<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZupgoZupup</title>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<style>
#matecreateF{
	height: 1000px;
	background: white;
	border: 3px solid #42DF2B;
	border-radius: 15px;
	margin:0 auto;
	width: 940px;
    padding-bottom: 65px;
}
h3{
	text-align: center;
	padding: 10px 0px;
	font-weight: bold;
}
.image {
	float: left;
	width: 390px;
}
.mateC {
	float: right;
	width: 520px;
}

</style>
</head>

<body>
	<h3>정기모임</h3>
	<section id="matecreate">
		
		<div id="image">
			<input name="image" type="file" id="image"> 
			<input type="button" class="uploadBtn" value="등록">
		</div>
		<div id="mateC">
			모임명
					<input type="text" name="activityname"
						placeholder="모임명을 입력해주세요" size="25">
		</div>
	</section>
	
<!-- 이미지 업로드 기능 -->
	<script>
		function setThumbnail(event) {
			var reader = new FileReader();

			reader.onload = function(event) {
				var img = document.createElement("img");
				img.setAttribute("src", event.target.result);
				document.querySelector("div#image_container").appendChild(img);
			};

			reader.readAsDataURL(event.target.files[0]);
		}
	</script>

	<!-- 주소 검색 기능 -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		window.onload = function() {
			document
					.getElementById("address_kakao")
					.addEventListener(
							"click",
							function() { //주소입력칸을 클릭하면
								//카카오 지도 발생
								new daum.Postcode(
										{
											oncomplete : function(data) { //선택시 입력값 세팅
												document
														.getElementById("address_kakao").value = data.address; // 주소 넣기
											}
										}).open();
							});
		}
	</script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<!-- 주소 검색 후, 지도 나타내기 -->
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

	<!-- 인원수 카운트 -->
	<script>
		var count = 2;

		var countUp = function() {
			if (count < 6) {
				count = count + 1;
				$("#peoplemaxnum").val(count);
				document.querySelector("#maxnum").innerText = count;

			} else {
				alert("단기 모임은 2인 이상 6인 이하로 설정해주세요.");
			}
		};
		var countDown = function() {
			if (count > 2) {
				count = count - 1;
				$("#peoplemaxnum").val(count);
				document.querySelector("#maxnum").innerText = count;

			} else {
				alert("단기 모임은 2인 이상 6인 이하로 설정해주세요.");
			}
		};
	</script>
	
	<script>
		  function typeChange(){
			
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
	        
		        
		  };  
	
	
	
	
	
		$('.uploadBtn')
				.click(
						function() {
							var formData = new FormData();
							var inputFile = $("input[type='file']");
							var files = inputFile[0].files;
							
							
							
							for (var i = 0; i < files.length; i++) {
								console.log(files[i]);
								formData.append("uploadFiles", files[i]);
							}//.uploadBtn

							$
									.ajax({
										url : 'uploadAjax',
										processData : false,
										contentType : false,
										data : formData,
										type : 'POST',
										dataType : 'json',
										success : function(result) {

											showUploadedImages(result);
										},
										error : function(jqXHR, textStatus,
												errorThrown) {
											console.log(textStatus);
										}

									});//.ajax
							function showUploadedImages(arr) {
								console.log(arr);
								var divArea = $(".uploadResult");
								var str = "";
								for (var i = 0; i < arr.length; i++) {
									str += "<div>";
									str += "<img src='display?fileName="
											+ arr[i].thumbnailURL + "'>";
									str += "<input type ='button' class ='removeBtn' data-name='"+arr[i].imageURL+"' value='삭제'>"
									str += "</div>";
								}
								divArea.append(str);
							}
							$(".uploadResult").on("click", ".removeBtn",
									function(e) {
										var target = $(this);
										var fileName = target.data("name");
										var targetDiv = $(this).closest("div");

										console.log(fileName);

										$.post('removeFile', {
											fileName : fileName
										}, function(result) {
											console.log(result);
											if (result === true) {
												targetDiv.remove();
											}
										})
									})
						});
	</script>
</body>
</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>