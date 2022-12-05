<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/resources/js/mateReply.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/mate-find.css" rel="stylesheet">

<!--   모달창   -->
<c:forEach items="${users}" var="user">
<c:choose>
		<c:when test="${user.profile_open eq 'Y' }">
<div class="my_modal" id="${user.id}">
     <button class="modal_close_btn ${user.id}">✖</button>    	
	<div class="main">
		<div class="bold">${user.nickname }님의 프로필</div>
	
	<hr>
	
 	<table class="modtab">
 		
 		<tr>
	 		<td class="bold">이름</td>
	 		<td class="profile-input"><textarea rows="1" id="username" name="username" class="form-control id" readonly>${user.username }</textarea></td>
	 		<td rowspan="2"> 
            	<div class="uploadResult">
            		<img class='profileImg' id="profileImg" src='/Mate/display?fileName=${user.profile}'>
            	</div>
        	</td>
		
 		</tr>
 		<tr>
	 		<td class="bold">닉네임</td>
	 		<td class="profile-input"><textarea rows="1" name="nickname" id="nickname" class="form-control id" readonly>${user.nickname}</textarea></td>
 		</tr>
 		<tr>
	 		<td class="bold">이메일</td>
	 		<td class="profile-input"><textarea rows="1" name="email" id="email" class="form-control id" readonly>${user.email}</textarea></td>
 		</tr>
 		<tr>
	 		<td class="bold">휴대폰</td>
	 		<td class="profile-input"><textarea rows="1" name="phone" id="phone" class="form-control id" readonly>${user.phone }</textarea></td>
 		</tr>
 		<tr>
	 		<td class="bold">성별</td>
	 		<td class="profile-input"><textarea rows="1" name="phone" id="phone" class="form-control id" readonly><c:out value="${user.gender eq 'man' ? '남자':'여자' }"/></textarea></td>
	 		
 		</tr>
 	</table>
 	</div>
    
</div>
 	</c:when>
 	<c:otherwise>
 	<div class="my_modal" id="${user.id}">
     <button class="modal_close_btn ${user.id}">✖</button>    	
	<div class="main">
		<div class="bold">${user.nickname }님의 프로필</div>
	
	<hr>
	<div style="text-align:center;">
 		<img  src='/resources/img/404.png'>
         	<p class="private">비공개 프로필입니다!</p>
     </div>    	   
           </div>
        </div>
            
 	</c:otherwise>
 	</c:choose>	


</c:forEach>


<div class="flashOrRegular">
<c:choose>
	<c:when test="${mate.regular eq '1'}">
		<h2>정기활동</h2>
	</c:when>
	<c:otherwise>
		<h2>번개활동</h2>
	</c:otherwise>
</c:choose>
</div>

<div class="mate-border">
<br>
 <div class="mate-container">
	<div class="mate-bold">${mate.activityname}</div><br>
	<div class="mate-normal">${mate.writer}</div>
	<hr>
	
	<div class="mate-regdate"> 작성일 ${mate.regdate}</div><br>
	
	
	<div class="mate-updatedate">최신 업데이트 : ${mate.updatedate}</div>
	
	
	
		 <div class="mate-topinfoImg">
       
            <img src="/Mate/display?fileName=${mate.image}" style="width:360px; height:300px;"/>
        </div>
		
		 <div class="mate-topinfo">
          <h2 class="mate-title">활동명</h2><div class="form-control activityname">${mate.activityname }</div>
            
        </div><br><br><br><br>

        <div class="mate-topinfo">
          <h2 class="mate-title">활동일시</h2><div class="form-control meetingdate">${mate.meetingdate }(${mate.dayofweek })</div>
        </div><br><br><br><br>
        
        <div class="mate-topinfo">
          <h2 class="mate-title">모임인원</h2>
          <div class="form-control peoplenum">${mate.peoplenum}명 / ${mate.peoplemaxnum}명</div>
        </div><br><br><br><br>
         <c:choose>
         <c:when test="${userVO.id eq mate.user_id}">   
		 </c:when>
		 
         <c:when test="${join ==0 || join eq null}"> 
	        <button class="success" type="button" id="matejoin" data-joinchk='${join}'>참여하기</button>
	        <input type="hidden" id="joincheck" value="${join }">
		 </c:when>					
         <c:when test="${join ==1}"> 
	        <button class="success" type="button" id="matejoin" data-joinchk='${join}'>나가기</button>
	        <input type="hidden" id="joincheck" value="${join }">
		 </c:when>
		 
       </c:choose>  
        
        <br><br><br>
        <button data-oper='list' class="uploadBtn">목록</button>
        <br><br>
        <div class="mate-guide">안내사항</div>
        <hr>
        
        <div class="form-group">
          <h2 class="mate-title">모임시간</h2> <div class="form-control meetingtime">${mate.meetingtime }</div>
        </div>
         <div class="form-group">
          <h2 class="mate-title">활동시간</h2><div class="form-control starttime">${mate.starttime}</div>~<div class="form-control endtime">${mate.endtime}</div>
        </div>
  		
        
		
		<div class="form-group">
          	  <h2 class="mate-title">활동장소</h2><div class="form-control meetingplace">${mate.meetingplace }</div>
        </div>
        <div class="form-group">
          	  <h2 class="mate-title">출발지</h2><div class="form-control startzone" >${mate.startzone }</div>
        </div>
        <div class="form-group">
         	  <h2 class="mate-title">목적지</h2><div class="form-control endzone">${mate.endzone }</div>
	 	</div>
	 	
        <div class="form-group">
          <h2 class="mate-title">안내사항</h2><textarea class="form-control content" id="content" readonly>${mate.content }</textarea>
        </div>
          <div class="form-group">
          <h2 class="mate-title">모임장소</h2>
        </div>
        
        <p style="margin-top:-12px">
    
</p>
	<div id="map" style="width:40%;height:250px;"></div>
	<br>
	<div class="form-control meetingplace" id="meetingplace">${mate.meetingplace }</div>
	
        <br><br><br>
        <div class="form-group">
        <c:if test="${userVO.id eq mate.user_id}">
	        <button id='remove' type="button" class="modrem">삭제</button>	
			<button id='modify' type="button" class="modrem">수정</button>
		</c:if>
        <h2 class="mate-title">현재 모임 참여중인 인원( ${mate.peoplenum} )</h2>
        
        </div>
        	
        <hr>
        <c:forEach items="${users}" var="user">
        <a class="userProfile" data-user="${user.id}"><img class="user-img" src="/Mate/display?fileName=${user.profile}" style="margin-left:5px;"/></a>
        </c:forEach>
        <br><br>
        
    <form id='operForm'>
	  <input type='hidden' id='no' name='no' value='<c:out value="${mate.no}"/>'>
	  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
	  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
  	  <input type='hidden' name='meeting' value='<c:out value="${cri.meeting }"/>'>
      <input type='hidden' name='filter' value='<c:out value="${cri.filter }"/>'>
	</form>
	
	<img id="reply" src="/resources/img/말풍선.png" alt="" width="30px" height="30px">
	댓글<span id='replycnt'>${mate.replycnt}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<c:choose>
		<c:when test="${like ==0 || like eq null}">
			<a href='javascript: like_func();'><img id="likeImg" src="/resources/img/빈하트.png" alt="" width="30px" height="30px"></a>좋아요
			<span id='likecnt'>${mate.likecnt}</span>
			<input type="hidden" id="likecheck" value="${like }">
		</c:when>					
		<c:when test="${like ==1}">
			<a href='javascript: like_func();'><img id="likeImg" src="/resources/img/꽉찬하트.png" alt="" width="30px" height="30px"></a>좋아요
			<span id='likecnt'>${mate.likecnt}</span>
			<input type="hidden" id="likecheck" value="${like }">
		</c:when>
	</c:choose>		
				
	<hr>

<div class='row'>

	<div class="col-lg-12">

		<!-- /.panel -->

				<ul class="chat">

				</ul>
	
			
				<!-- ./ end ul -->
			</div>
		<c:if test="${userVO ne null}">
			<div class="reply">	
				<div class="form-group replyform">
					<div class="nickname" name="replyer">${userVO.nickname}</div>
	                <textarea class="form-control" id='reply' name='reply' placeholder="댓글을 입력해보세요."></textarea>
	                 
	              </div>      
	     	 <button id='modalRegisterBtn' type="button" class="uploadBtn">댓글작성</button>
	       
	       
	      </div>
      </c:if>
			<!-- /.panel-heading -->
			
		</div>
	</div>
	<!-- ./ end row -->
</div>


<!-- end mate container  -->
<!-- end mate border -->
<div class="repository">
	  <input type='hidden' name='repReply' value='<c:out value=""/>'>  
  	  <input type='hidden' name='repReplyer' value='<c:out value=""/>'>
      <input type='hidden' name='repReplyDate' value='<c:out value=""/>'>
      <input type='hidden' name='repReplyNo' value='<c:out value=""/>'>
      
</div>	


<script type="text/javascript">
$(document).ready(function() {
	var noValue = '<c:out value="${mate.no}"/>';
	
	var replyUL = $(".chat");
	var clearfix = $(".left clearfix");
	showList(1);
	var userid = "<c:out value='${userVO.id}'/>";
	
	function showList(page){
		
		replyService.getList({no:noValue, page: page|| 1}, function(list){
			
			var str="";
			if(list == null || list.length == 0){
				replyUL.html("");
				return;
			}
			for(var i=0, len = list.length || 0; i<len; i++){
				str +="<div><li class='replyList'  id='rno"+list[i].rno+"' data-replyer="+list[i].replyer+" data-reply='"+list[i].reply+"' data-rno='"+list[i].rno+"'>";
				if(userid==list[i].user_id){
				str += "<button type='button' id='rembtn' data-rno='"+list[i].rno+"'>삭제</button>";
				str += "<button class='replyUpdateBtn' data-replyer="+list[i].replyer+" data-reply='"+list[i].reply+"' data-rno='"+list[i].rno+"'>수정</button>";
				}
				str +="<div class='header'><strong class= 'primary-font'>"
						+list[i].replyer+"</strong>";
				str +="<small class='pull-right text-musted'>"+replyService.displayTime(list[i].replyDate)+"</small>";
				
				str +="<p class='repContent'>"+list[i].reply +"</p></div></li></div><hr>";
			}
			replyUL.html(str);
			
		}); //end function
	}//end showList
	
	 var modalRegisterBtn = $("#modalRegisterBtn");
	 var replyForm = $(".reply");
     var InputReply = replyForm.find("textarea[name='reply']");
     var InputReplyer = replyForm.find("div[name='replyer']");
     var InputReplyDate = replyForm.find("input[name='replyDate']");
     var repository = $(".repository");
     var repReply = repository.find("input[name='repReply']")
     var repReplyer = repository.find("input[name='repReplyer']")
     var repReplyDate = repository.find("input[name='repReplyDate']")
	 var repReplyNo = repository.find("input[name='repReplyNo']")

     modalRegisterBtn.on("click",function(e){
    	 if (!replyForm.find("textarea[name='reply']").val()){
    		 	alert("댓글 내용을 입력해주세요.")
    			return false;
    		}
        var reply = {
              reply: InputReply.val(),
              replyer:InputReplyer.html(),
              user_id:"${userVO.id}",
              no:noValue
            };
        replyService.add(reply, function(result){
          
          
          replyForm.find("textarea").val("");
   		  
          var repcnt = $("#replycnt").html();
          
          $("#replycnt").html(parseInt(repcnt)+1);
          
          showList(1);
          
          
        });
        
      });
    
     
     $(document).on("click", '#rembtn', function(e){
    	    var rno = $(this).data("rno");
    		console.log(rno);
    		replyService.remove(rno,function(result){
    			if(result=='success'){
    				$.ajax({
    	    			url : "/replies/repCntUpdate",
    	    			type : 'PUT',
    	    			contentType: 'application/json',
    	    			data : JSON.stringify(noValue),
    	    			success :
    	    				console.log("성공")	
    	    			, error : 
    	    				console.log("에러") 
    	    			});
    			}
    			var repcnt = $("#replycnt").html();
    	        $("#replycnt").html(parseInt(repcnt)-1);
    			repReply.val("");
    			showList(1);
    		});
    		
    	});
     $(document).on("click", ".replyUpdateBtn", function(e){

    	 if(repReply.val()!=""){
    		 showList(1);
    		 repReply.val("");
    		 
    		 return false;
    	 }
    	
    	 
    	 repReplyNo.val($(this).data("rno"));
    	 repReplyer.val($(this).data("replyer"));
    	 repReply.val($(this).data("reply"));
    	 
    	 var replyData ={
         rno:repReplyNo.val(),
         replyer:repReplyer.val(),
         reply:repReply.val()
    	 };
		
		
	   var htmls = "";
	    htmls += '<button type="button" id="modCancel" class="rembtn">취소</button>';
	    htmls += '<button type="button" id="modbtn" class="replyUpdateBtn">  저장  </button>';
	    htmls += '<div class="header"><strong class="primary-font" id="mod">'+replyData.replyer+"</strong>";
	   

		
		htmls += '<div id="rno'+ replyData.rno + '">';
		
		htmls += '<textarea name="editContent" id="editContent" rows="3">';

		htmls += replyData.reply;

		htmls += '</textarea>';

		htmls += '</div>';
		
		$('#rno'+replyData.rno).replaceWith(htmls);	
		$('#rno'+replyData.rno+' #editContent').focus();
	    
  });
     
     $(document).on("click", "#modbtn", function(e){
    	 
    	
    	var replyEditContent = $("#editContent").val();
    	 var reply = {rno:repReplyNo.val(), reply:replyEditContent} 
    	 
    	 replyService.update(reply, function(result){
 	    	repReply.val("");
 	    	showList(1);
 	    	}); 
     })
     
     $(document).on("click", "#modCancel", function(e){
    	 	repReply.val("");
 	    	showList(1); 
 	    	 
     });
     
  
  
   var operForm = $("#operForm"); 
	
  $("button[data-oper='list']").on("click", function(e){
    operForm.find("#no").remove();
    operForm.attr("action","/matefind/list")
    operForm.attr("method","get");
    operForm.submit();
    
  });
  
  typeChange();

  function typeChange(){
		
		var stime = $(".starttime").html();
		var etime = $(".endtime").html();
		var meetingtime = $(".meetingtime").html();
		if(stime.length==4){
			stime=stime.slice(0,2) +":"+stime.slice(2,4);
		}else if(stime==0){
			stime="00:00";
		}else if(stime.length==1 &&stime!=0){
			stime="00:0"+stime;
		}else if(stime.length==2){
			stime="00:"+stime;
		}else{
			stime=stime.slice(0,0) +"0"+stime.slice(0,1)+":"+stime.slice(1,4);	
		}
		if(etime.length==4){
			etime=etime.slice(0,2) +":"+etime.slice(2,4);
		}else if(etime==0){
			etime="00:00";
		}else if(etime.length==1 &&etime!=0){
			etime="00:0"+etime;
		}else if(etime.length==2){
			etime="00:"+etime;
		}else{
			etime=etime.slice(0,0) +"0"+etime.slice(0,1)+":"+etime.slice(1,4);	
			}
		
		
		if(meetingtime.length==4){
			meetingtime=meetingtime.slice(0,2) +":"+meetingtime.slice(2,4);
		}else if(meetingtime==0){
			meetingtime="00:00";
		}else if(meetingtime.length==1 &&meetingtime!=0){
			meetingtime="00:0"+meetingtime;
		}else if(meetingtime.length==2){
			meetingtime="00:"+meetingtime;
		}else{
			meetingtime=meetingtime.slice(0,0) +"0"+meetingtime.slice(0,1)+":"+meetingtime.slice(1,4);	
			}
			
      $(".starttime").html(stime);
      $(".endtime").html(etime);
      $(".meetingtime").html(meetingtime);
      
	        
	  };  
  
});




</script>
<script type="text/javascript">

function like_func(){
	const clickLikeUrl = "/resources/img/꽉찬하트.png";
    const emptyLikeUrl = "/resources/img/빈하트.png";
    const resultElement = document.getElementById('likecnt');
	var number=resultElement.innerText;
	
	no = $('#no').val(),
	count = $('#likecheck').val(),
	data = {
			"userid" : "${userVO.id}",
			"no" : no,
			"count" : count
			};
	
	
	

$.ajax({
	url : "/like/likeUpdate",
	type : 'PUT',
	contentType: 'application/json',
	data : JSON.stringify(data),
	success : function(result){
		console.log("수정" + result.result);
		var like_img='';
		if(result.result=='login'){
			alert('로그인 후 이용 가능한 서비스입니다.');
		}else if(count == 1){
			console.log("좋아요 취소");
			 $('#likecheck').val(0);
			 number = parseInt(number) - 1;
			 resultElement.innerText = number;
			 $('#likeImg').attr("src", emptyLikeUrl);
		}else if(count == 0){
			console.log("좋아요!");
			$('#likecheck').val(1);
			number = parseInt(number) + 1;
			resultElement.innerText = number;
			$('#likeImg').attr("src", clickLikeUrl);
		}
		 $('#like_img').attr('src', like_img);
	}, error : function(result){
		console.log("에러" + result.result)
	}
	
	});
};

$(document).on("click", "#matejoin", function(e){

	no = $('#no').val(),
	count = $('#joincheck').val(),
	
	data = {
				"userid" : "${userVO.id}",
				"no" : no,
				"count" : count
				};
	$.ajax({
		url : "/matejoin/joinUpdate",
		type : 'PUT',
		contentType: 'application/json',
		data : JSON.stringify(data),
		success : function(result){
		
			if(result.result=='login'){
				alert('로그인 후 이용 가능한 서비스입니다.');
				location.href="/user/loginPage";
			
			}else if(count == 1){
			 alert('${mate.activityname} 활동에서 나가셨습니다.');	
			 console.log("나가요~");
			 $('#joincheck').val(0);
			 $('#matejoin').html('참여하기');		
			 window.location.reload();
			}else if(result.result=='full'){
				alert("인원수가 가득찼습니다.");
				return false;
			}else if(count == 0){
				
			alert('${mate.activityname} 활동에 참여하셨습니다!');
			console.log("참여!");
			 $('#joincheck').val(1);
			 $('#matejoin').html('나가기');    
			 window.location.reload();
			}
			
		}, error : function(result){
			console.log("에러" + result.result)
		}
		
		});
});

</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e49668e033d2147dcdeca11f1531922&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${mate.meetingplace}', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">${mate.meetingplace}</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	</script>
	
<script type="text/javascript">
$(document).ready(function() {
	  var operForm = $("#operForm"); 

	  $("button[id='modify']").on("click", function(e){
		  operForm.attr("action","/matefind/modify");
		  operForm.attr("method","get");

		  operForm.submit();
	    
	  });
	  
	    
	  $("button[id='remove']").on("click", function(e){
	   
	    operForm.attr("action","/matefind/remove");
	    operForm.attr("method","post");
	    operForm.submit();
	    
	  });  
	});

</script>


<!-- 모달 -->

<script>
        $(document).ready(function(){
        	
            function modal(id) {
                var zIndex = 9999;
                var modal = document.getElementsByClassName(id);
                var modalId = document.getElementById(id);
				console.log(modal);
                // 모달 div 뒤에 희끄무레한 레이어
                var bg = document.createElement('div');
                bg.setStyle({
                    position: 'fixed',
                    zIndex: zIndex,
                    left: '0px',
                    top: '0px',
                    width: '100%',
                    height: '100%',
                    overflow: 'auto',
                    // 레이어 색갈은 여기서 바꾸면 됨
                    backgroundColor: 'rgba(0,0,0,0.4)'
                });
                document.body.append(bg);

                // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
               $(modal).on('click',function(e){
            	   bg.remove();
            	    modalId.style.display = 'none';
	
				});
               $(bg).on('click',function(e){
            	   bg.remove();
            	   modalId.style.display = 'none';
	
				});
				

                modalId.setStyle({
                    position: 'fixed',
                    display: 'block',
                    boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

                    // 시꺼먼 레이어 보다 한칸 위에 보이기
                    zIndex: zIndex + 1,

                    // div center 정렬
                    top: '50%',
                    left: '50%',
                    transform: 'translate(-50%, -50%)',
                    msTransform: 'translate(-50%, -50%)',
                    webkitTransform: 'translate(-50%, -50%)'
                });
            }

            // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
            Element.prototype.setStyle = function(styles) {
                for (var k in styles) this.style[k] = styles[k];
                return this;
            };
			
            $('.userProfile').on("click",function(e){
            	var userid = $(this).data("user");
    			 modal(userid);
    		});	
			
			
        });
        </script>	
<script>

</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>