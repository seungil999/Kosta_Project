<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>&#128077; 추천 &#128077;</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap"
	rel="stylesheet">

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
.modal {
	font-family: 'Yeon Sung', cursive;
}

#recDiv {
	margin-top: 50px;
}

.text-center {
	font-family: 'Yeon Sung', cursive;
}

#addStyle {
	width: 30px;
}
</style>

<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<script>

    $(document).ready(function(){ 
    	/* event */
    	$("#gettour").click(function(){
			var sido = $('#sido_code option:selected').text();
            var gungu = $('#sigoon_code option:selected').text();
            
            var sigungu = {"sido":sido ,"gungu":gungu }
            
            // 확인용
            console.log("시군구 : "+sido+" "+gungu);

           $.ajax({
                url : "/recommend/info",
                type: "get", 
                dataType : "json",
                data: sigungu,
                
                // data > result
                success : function(result){
        			console.log(typeof result); // object
                    $("table").html("<tr><th>번호</th><th>주소</th><th>관광지명</th><th>담기<th></tr>");
                    var show = "";
               
                    result.data.forEach((item,idx)=>{
                   		show += "<tr>";
                       	show += "<td>"+(idx+1)+"</td>";
                       	show += "<td>"+[item.CSido]+"&nbsp;"+[item.DGungu]+"</td>";
                       	show += "<td>"+[item.BResNm]+"</td>";
                    	show += `<td><button type="button" class="add" id="addStyle" data-bs-toggle="modal" style="background-color:#198754; border-color:black;"  data-id="\${item.EPreSimpleDesc}" data-title="\${item.BResNm}" data-kind="\${item.ASctnNm}" data-sido="\${item.CSido}" data-gungu="\${item.DGungu}"data-bs-target="#myModal">담기</button></td>`;
                       	show += "</tr>";
                    }) 
                 
                    $("table").append(show);
                    
                    /* 모달에 정보 담기 , 담기 클릭 이벤트 */ 
                    $('.add').click(function(){
                        var data =  $(this).data('id') + "...이하 내용 생략..."
                        var title = $(this).data('title')
                        var kind =  $(this).data('kind')
                      	var address = $(this).data('sido') + " "+$(this).data('gungu')
                    
                       
                      	// 모달 title
                        $(".modal-title").val(title)
                        $(".modal-title").html(title)
                      
                        
         				$(".form-group-kind").val(kind)
                        $(".form-group-kind").html(kind)
                        
                        $(".form-group-data").val(data)
                       	$(".form-group-data").html("<textarea  readonly='readonly' rows='10' style='width:100%;height:100%;'  placeholder='"+data+";'</textarea>")
                           
                           
                     	var desc = ""; 
                        desc += `<input type='hidden' name='recname' value='\${title}'></input><br>`
                        desc += `<input type='hidden' name='simpledesc' value='\${data}'></input><br>`;
                        desc += `<input type='hidden' name='address' value='\${address}'></input>`;
                           
                       $(".form-group-desc").val(desc);
                       $(".form-group-desc").html(desc);
                      
                        $(".form-group-data").val(data)
                        $(".form-group-data").html("<textarea  readonly='readonly' rows='10' style='width:100%;height:100%;'  placeholder='"+data+";'</textarea>")
                           
                            
                       });  /* .add 이벤트 */ 
                } /*success*/

           });    
                    
        });
       
    }); /* ready */ 
</script>
</head>

<header>
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>

</header>

<body>

	<!--Start of portfolio-->
	<section id="recDiv" class="text-center">
		<div class="col-md-12">
			<div class="portfolio_title">
				<h1>추천</h1>
				<br>
				<p style="font-size: 20px;">주요 관광지를 추천해드립니다 &#128154; 사람이 많은 곳에서
					플로깅 활동을 진행해봅시다 &#128539;</p>
				<br>
			</div>
		</div>

		<!--End of col-md-2-->
		<div class="colum">

			<!-- form 태그 -->
			<!-- 브이월드 행정구역도를 이용한 셀렉트 박스 구현... 공간정보를 기반으로 하고 있어서 국가공간정보포털보다 느림 -->
			<form id="nsdiSearchForm" action="#" class="validation-form"
				onsubmit="return false;search();">
				<select id="sido_code" class="btn btn-success dropdown-toggle"
					name="sido_code">
					<option>시/도 선택</option>
				</select>

				<!--   <button type="button" class="btn btn-success">Success</button>style=" height:30px; background-color:#198754 ; border-color:black;"
      -->
				<select id="sigoon_code" class="btn btn-success dropdown-toggle"
					name="sigoon_code">
					<option>군/구 선택</option>
				</select>
				<!-- <input type="submit" id="gettour" value="제출"></input> -->

				<button type="submit" id="gettour" class="btn btn-outline-success"
					style="height: 30px; background-color: white; color: black; border-color: black;">찾기</button>
			</form>
			<!-- form 태그 end -->


			<!-- 시군구 행정코드 받아오는 부분 -->
			<script>
$.support.cors = true;
   
   $(function(){
      $.ajax({
         type: "get",
         url: "https://api.vworld.kr/req/data?key=917B9F49-439A-3452-8182-4EDC0B07BA45&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADSIDO_INFO",
         async: false,
         dataType: 'jsonp',
         success: function(data) {
            // let html = "<li><a class="dropdown-item" href="#">선택</a></li>";
             let html = "<option>시/도 선택</option>";
            data.response.result.featureCollection.features.forEach(function(f){
               console.log(f.properties)
               let gcode = f.properties.ctprvn_cd;
               let gname = f.properties.ctp_kor_nm;

               html +=`<option value=\"\${gcode}\">\${gname}</option>`
               
            })
            
               $('#sido_code').html(html);
            
         },
         error: function(xhr, stat, err) {}
      });
      
      
      $(document).on("change","#sido_code",function(){
         let thisVal = $(this).val();      

         $.ajax({
            type: "get",
            url: "https://api.vworld.kr/req/data?key=917B9F49-439A-3452-8182-4EDC0B07BA45&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADSIGG_INFO",
            data : {attrfilter : 'sig_cd:like:'+thisVal},
            async: false,
            dataType: 'jsonp',
            success: function(data) {
                let html = "<option>군/구 선택</option>";
               //let html = "<li><a class="dropdown-item" href="#">선택</a></li>";
               data.response.result.featureCollection.features.forEach(function(f){
                  console.log(f.properties)
                  let gcode = f.properties.sig_cd;
                  let gname = f.properties.sig_kor_nm;
                  

                  // html += `<li><a class="dropdown-item" href="#">\${gcode}</a></li>`
                  html +=`<option value=\"\${gcode}\">\${gname}</option>`
               })
                  $('#sigoon_code').html(html);
               
            },
            error: function(xhr, stat, err) {}
         });
      });
      
      

      
   })
</script>
			<!--End of row-->
		</div>

		<!--End of container-->
		<div class="container">
			<br>
			<div class="row">



				<!--End of row-->
			</div>
			<!--End of container-->

			<div class="container mt-3">

				<br>
				<table class="table table-hover" style="text-align: center;">
					<!-- data 출력 부분 -->
				</table>
			</div>
		</div>
		<!--End of colum-->
	</section>
	<!--end of portfolio-->



	<!--Scroll to top-->
	<a href="#" id="back-to-top" title="Back to top">&uarr;</a>
	<!--End of Scroll to top-->

	<!-- 모달창 띄우기 -->
	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title"></h4>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="/recommend/register" method="post">
						<input type="hidden" name="user_id"
							value="${sessionScope.userVO.id}" />
						<div class="form-group-kind" style="font-weight: bold;"></div>
						<hr width="100%" color="black" size="1">
						<div class="form-group-data" style="width: 100%; height: 100%;">

						</div>

						<hr width="100%" color="black" size="1">
						<div class="form-group-desc" style="width: 100%; height: 100%;">
						</div>

						<div class="form-group">
							<b>선택한 장소를 담으시겠습니까? </b>
							<p>
								<br>
							</p>
							<button type="submit" class="btn btn-default"
								style="background-color: #198754;">담기</button>
							<button type="button" class="btn btn-default"
								data-bs-dismiss="modal">취소</button>

						</div>
					</form>

				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal">X</button>
				</div>

			</div>
		</div>
	</div>
	<!-- 모달창 닫기 -->
</body>


</html>