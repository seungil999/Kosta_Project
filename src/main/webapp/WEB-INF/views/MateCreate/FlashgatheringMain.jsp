<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZupgoZupup</title>
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap" rel="stylesheet">

<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
</head>
<style>

body{
	font-family: 'Yeon Sung', cursive;
	
}
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
	border: 3px solid #198754 ;
	border-radius: 15px;
	margin: 0 auto;
	width: 1000px;
	padding-bottom: 40px;
	position: relative;
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
	z-index: 10;
	padding: 3px 40px;
	margin: 10px;
}

.uploadResult {
	position: relative;
	top: -150px;
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
}

.Btn {
	background-color: #198754;
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
	background-color: #198754;
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

h1 {
	margin-top : 50px;
	margin-bottom : 50px;
	text-align: center;
	padding: 10px 0px;
	font-weight: bold;
}
</style>
</head>

<body>
	<div class="matecreate">
		<h1>번개활동</h1>
		<div class="matecreate_container">
			<form action="/Mate/matecreate" method="post"
				onsubmit="typeChange(); ">
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

										<th>모임명</th>
										<td><input type="text" name="activityname"
											placeholder="모임명을 입력해주세요" size="30" required 
											oninvalid="this.setCustomValidity('모임명은 필수로 입력 해주세요.')"
											oninput="this.setCustomValidity('')"> 
											<input type="hidden" name="writer" value="${userVO.nickname}">
											<input type="hidden" name="user_id" value="${userVO.id}">
										</td>
									</tr>
									<tr>
										<th>모임장소</th>
										<td><input type="button" 
											onclick="sample5_execDaumPostcode()" value="주소검색" class="Btn" ><br></td>
									</tr>
									<tr>
										<th></th>
										<td><input type="text" name="meetingplace" readonly="readonly"
											id="sample5_address" placeholder="주소 검색을 눌러주세요" size="30" required 
											oninvalid="this.setCustomValidity('모임장소는 필수로 입력 해주세요.')"
											oninput="this.setCustomValidity('')"></td>
									</tr>
									<tr>
										<td colspan="4">
											<div id="map"
												style="width: 100%; height: 100px; margin-top: 10px; display: none"></div>
										</td>
									</tr>
									<tr>
										<th>모임시간</th>
										<td><input type="time" id="mtime" name="mtime"
											onchange="setMinValue()"> <input type="hidden"
											id="meetingtime" name="meetingtime" value=""></td>
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
										<td><input type="text" name="startzone" size="30"  id="start_address"
											placeholder="출발지를 입력해주세요." required 
											oninvalid="this.setCustomValidity('출발지는 필수로 입력 해주세요.')"
											oninput="this.setCustomValidity('')"
											/>
									</tr>
									<tr>
										<th>목적지</th>
										<td><input type="text" name="endzone" size="30" id="end_address"
											placeholder="도착지를 입력해주세요." required 
											oninvalid="this.setCustomValidity('목적지는 필수로 입력 해주세요.')"
											oninput="this.setCustomValidity('')"/>
									</tr>
									<tr>
										<th>활동시간</th>
										<td><input type="time" id="stime" name="stime" required 
											oninvalid="this.setCustomValidity('활동시간은 필수로 입력 해주세요.')"
											oninput="this.setCustomValidity('')">
											부터 <input type="hidden" id="starttime" name="starttime"
											value=""> <input type="time" id="etime" name="etime" required 
											oninvalid="this.setCustomValidity('활동시간은 필수로 입력 해주세요.')"
											oninput="this.setCustomValidity('')"> 까지 <input type="hidden" id="endtime"
											name="endtime" value=""></td>
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
			document.getElementById("address_kakao")
					.addEventListener("click",
							function() { 
								new daum.Postcode({
											oncomplete : function(data) { 
												document
														.getElementById("address_kakao").value = data.address; 
											}
										}).open();
							});
		}
	</script>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<!-- 주소 검색 후, 지도 나타내기 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4a66ad8f3bff103d861fce2044f9138a&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), 
		mapOption = {
			center : new daum.maps.LatLng(37.537187, 127.005476), 
			level : 3
		};
		var map = new daum.maps.Map(mapContainer, mapOption);
		var geocoder = new daum.maps.services.Geocoder();
		var marker = new daum.maps.Marker({
			position : new daum.maps.LatLng(37.537187, 127.005476),
			map : map
		});
		function sample5_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					var addr = data.address;
					document.getElementById("sample5_address").value = addr;
					geocoder.addressSearch(data.address, function(results,
							status) {
						if (status === daum.maps.services.Status.OK) {
							var result = results[0]; 
							var coords = new daum.maps.LatLng(result.y,
									result.x);
							mapContainer.style.display = "block";
							map.relayout();
							map.setCenter(coords);
							marker.setPosition(coords)
						}
					});
				}
			}).open();
		}
		
		/* 출발지 */
		function start_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					var addr = data.address; // 최종 주소 변수
					// 주소 정보를 해당 필드에 넣는다.
					document.getElementById("start_address").value = addr;
				
				}
			}).open();
		}
		
		/* 목적지 */
		function end_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					var addr = data.address; // 최종 주소 변수
					// 주소 정보를 해당 필드에 넣는다.
					document.getElementById("end_address").value = addr;
		
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
				swal("", "단기 모임 모집인원은 2인 이상 6인 이하로 설정해주세요.", "error");
			}
		};
		var countDown = function() {
			if (count > 2) {
				count = count - 1;
				$("#peoplemaxnum").val(count);
				document.querySelector("#maxnum").innerText = count;

			} else {
				swal("", "단기 모임 모집인원은 2인 이상 6인 이하로 설정해주세요.", "error");
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
		
		$('.uploadBtn').click(
						function() {
							var formData = new FormData();
							var inputFile = $("input[type='file']");
							var files = inputFile[0].files;
							if(files.length!=0){
									//클릭 시 버튼 삭제
									$('.uploadBtn').hide();
									$(img).hide();
								}
							for (var i = 0; i < files.length; i++) {
								console.log(files[i]);
								formData.append("uploadFiles", files[i]);
							}//.uploadBtn

							$.ajax({
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
										$('.uploadBtn').show()
										$(img).show()
										
										$("#image").val("");
										
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
	
	<!-- 현재 시간 보다 전 시간 선택 불가능 -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		let dateElement = document.getElementById('mtime');
		let date = new Date(new Date().getTime()
				- new Date().getTimezoneOffset() * 60000).toISOString().slice(
				11, 16);
		dateElement.value = date;
		dateElement.setAttribute("min", date);

		function setMinValue() {
			if (dateElement.value < date) {
				swal("", "번개 모임시간은 이전 시간에 모집할 수 없습니다. \n모임시간을 다시 설정해 주세요.", "warning");
				dateElement.value = date;
			}
		}
	</script>
	

</body>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</html>
<!-- test -->