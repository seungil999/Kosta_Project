<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZupgoZupup</title>
</head>
<style>
textarea {
	width: 100%;
	height: 8.25em;
	resize: none;
}

.center table {
	width: 1280px;
	display: flex;
	margin: auto;
	height: 427px;
	background: skyblue;
}

table {
	border-spacing: 20px;
}
</style>
<body>
	<h3>정기모임</h3>
<form action="/Mate/matecreate" method="post">
		<div id="center">
			<input name="image" type="file" accept = image/jpg,impge/png,image/jpeg id="image" multiple >
			<input type="button" class="uploadBtn" value="업로드">
			<div class="uploadResult" id="image"></div>
			
			<table>
				<tr>
					<th>모임명</th>
					<td colspan="5"><input type="text" name="activityname"
						placeholder="모임명을 입력해주세요" size="25"></td>
				</tr>
				<tr>
					<th>모임날짜</th>
					<td><input type="date" name="meetingdate"></td>
				</tr>
				<tr>
					<th>모임장소</th>
					<td><input type="button" onclick="sample5_execDaumPostcode()"
						value="주소 검색"><br></td>
				</tr>
				<tr>
					<th></th>
					<td colspan="5"><input type="text" name="meetingplace"
						id="sample5_address" placeholder="주소 검색을 눌러주세요" size="25"></td>
				</tr>
				<tr>
					<th></th>
					<td colspan="5"><div id="map"
							style="width: 500px; height: 250px; margin-top: 10px; display: none"></div></td>
				</tr>
				<tr>
					<th>모임시간</th>
					<td><input type="time" name="meetingtime"></td>
				</tr>
				<tr>
					<th>모임인원</th>
					<td><input type="button" onclick="countDown();" value="-">
						<strong id="peoplemaxnum">2</strong> 
						<input type="button" onclick="countUp();" value="+">
						<input type="hidden" id="data" name="data">
					</td>
				</tr>
				<tr>
					<th>출발지</th>
					<td><input type="text" name="startzone" />
					<th>목적지</th>
					<td><input type="text" name="endzone" />
				</tr>
				<tr>
					<th>활동시간</th>
					<td><input type="time" name="starttime"> 부터</td>
					<td><input type="time" name="endtime"> 까지</td>
				</tr>
				<tr>
					<th>안내사항</th>
					<td colspan="6"><textarea name="content"
							placeholder="안내사항을 입력해주세요&#13;&#10;ex)준비물,교통편"></textarea></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="button" value="뒤로가기" onclick="history.back(-1)">
						<input type="submit" value="등록" /></td>
				</tr>
			</table>
		</div>
	</form>



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
				document.querySelector("#data").innerText = count;
				document.querySelector("#peoplemaxnum").innerText = count;

			} else {
				alert("단기 모임은 2인 이상 6인 이하로 설정해주세요.");
			}
		};
		var countDown = function() {
			if (count > 2) {
				count = count - 1;
				document.querySelector("#data").innerText = count;
				document.querySelector("#peoplemaxnum").innerText = count;

			} else {
				alert("단기 모임은 2인 이상 6인 이하로 설정해주세요.");
			}
		};
	</script>
	<script>
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

							$.ajax({
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
							$(".uploadResult").on("click", ".removeBtn", function(e){
								var target = $(this);
								var fileName = target.data("name");
								var targetDiv = $(this).closest("div");
								
								console.log(fileName);
								
								$.post('removeFile', {fileName: fileName}, function(result) {
									console.log(result);
									if(result === true) {
										targetDiv.remove();
									}
								})
							})
						});
	</script>
</body>
</html>