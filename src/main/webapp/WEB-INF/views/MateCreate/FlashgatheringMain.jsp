<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZupgoZupup</title>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<style>
.matecreate {
	position: relative;
	min-width: 990px;
}

.matecreate_container {
	position: relative;
}

.style_inner {
	width: 940px;
	margin: 0 auto;
	padding-bottom: 65px;
	position: relative;
}

.matecreateF {
	background: white;
	border: 3px solid #42DF2B;
	border-radius: 15px;
	margin: 0 auto;
	width: 1000px;
	padding-bottom: 40px;
	position: relative;
	clear: both;
}

.style_content {
	position: relative;
}

.summary_info {
	position: relative;
	padding-top: 45px;
}

.image {
	float: left;
	width: 350px;
	position: relative;
	padding: 3px 40px;
	margin: 10px;
}
.uploadResult {
	position: relative; 
	top: -200px;
	background-color: white;
}
.uploadBtn, .removeBtn {
	background-color: white;
	border: none;
	color: black;
	padding: 3px 40px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	border: 1px solid green;
	border-radius: 15px;
	font-weight: bold;
	margin: 10px;
}

.Btn {
	background-color: #42DF2B;
	border: none;
	color: white;
	padding: 3px 40px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	border-radius: 15px;
	font-weight: bold;
}

.peopleBtn {
	background-color: #42DF2B;
	border: none;
	color: white;
	padding: 3px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 18px;
	border-radius: 50%;
	font-weight: bold;
}

textarea {
	width: 95%;
	height: 100px;
	resize: none;
}

th, td {
	padding: 12px;
}

h3 {
	text-align: center;
	padding: 10px 0px;
	font-weight: bold;
}

</style>
</head>

<body>
	<div class="matecreate">
		<h3>번개모임</h3>
		<div class="matecreate_container">
			<form action="/Mate/matecreate" method="post"
				onsubmit="typeChange();">
				<div class="matecreateF">
					<div class="style_content">
						<div class="summary_info">
						
							<div class="image">
							
							<div class="defaultImg">
								<c:if test="${empty img }">
									<img src="/resources/img/logo2.png" width=388; height=388;>
								</c:if>
							</div>
								<div class="uploadResult"></div>
								<input name="img" type="file" id="img"> 
								<input type="button" class="uploadBtn" value="등록"> 
								<input type="hidden" name="image" id="image">
							</div>		
							
							<div class="mateC">
								<table>
									<tr>
										<th>작성자</th>
										<td><input type="text" name="writer" size="30"></td>
										<!-- 삭제후 ${users.writer}예정  -->
									</tr>
									<tr>
										<th>모임명</th>
										<td><input type="text" name="activityname"
											placeholder="모임명을 입력해주세요" size="30"></td>
									</tr>
									<tr>
										<th>모임장소</th>
										<td><input type="button"
											onclick="sample5_execDaumPostcode()" value="주소검색" class="Btn"><br></td>
									</tr>
									<tr>
										<th></th>
										<td><input type="text" name="meetingplace"
											id="sample5_address" placeholder="주소 검색을 눌러주세요" size="30"></td>
									</tr>
									<tr>
										<td colspan="4">
											<div id="map"
												style="width: 100%; height: 100px; margin-top: 10px; display: none"></div>
										</td>
									</tr>
									<tr>
										<th>모임시간</th>
										<td><input type="time" id="mtime" name="mtime">
											<input type="hidden" id="meetingtime" name="meetingtime"
											value=""></td>
									</tr>
									<tr>
										<th>모임인원</th>
										<td><input type="button" onclick="countDown();" value="-"
											class="peopleBtn">&nbsp&nbsp <strong id="maxnum">2</strong>&nbsp&nbsp
											<input type="button" onclick="countUp();" value="+"
											class="peopleBtn"> <input type="hidden"
											id="peoplemaxnum" name="peoplemaxnum" value="2"></td>
									</tr>
									<tr>
										<th>출발지</th>
										<td><input type="text" name="startzone" size="30" />
									</tr>
									<tr>
										<th>목적지</th>
										<td><input type="text" name="endzone" size="30" />
									</tr>
									<tr>
										<th>활동시간</th>
										<td><input type="time" id="stime" name="stime">
											부터 <input type="hidden" id="starttime" name="starttime"
											value=""> <input type="time" id="etime" name="etime">
											까지 <input type="hidden" id="endtime" name="endtime" value=""></td>
									</tr>
									<tr>
										<th style="vertical-align: top;">안내사항</th>
										<td style="vertical-align: top;"><textarea name="content"
												placeholder="안내사항을 입력해주세요&#13;&#10;예시)준비물,교통편,..."></textarea></td>
									</tr>
									<tr>
										<td style="text-align: left;"><input type="button"
											value="뒤로가기" class="Btn" onclick="history.back(-1)"></td>
										<td colspan="3" style="text-align: right;"><input
											type="submit" id="submit" value="등록" class="Btn" /></td>
									</tr>
								</table>
								<input type="hidden" name="regular" value="0">
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>



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
		function typeChange() {

			var starttime = $("#stime").val();
			var endtime = $("#etime").val();
			var meetingtime = $("#mtime").val();

			starttime = starttime.replace(":", "");
			endtime = endtime.replace(":", "");
			meetingtime = meetingtime.replace(":", "");
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
											var str = "";
											for (var i = 0; i < result.length; i++) {
												str += result[i].thumbnailURL;
											}
											$("#image").val(str);
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
									str += "<input type ='button' class ='removeBtn' data-name='"+arr[i].imageURL+"' value='사진삭제'>"
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
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</html>