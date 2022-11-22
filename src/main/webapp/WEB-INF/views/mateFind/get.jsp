<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/resources/js/mateReply.js"></script>



<c:choose>
	<c:when test="${mate.regular eq '1'}">
		정기모임
	</c:when>
	<c:otherwise>
		단기모임
	</c:otherwise>
</c:choose>
<br>
	${mate.activityname}<br>
	${mate.writer}
	<div>
	<label>작성일</label><input value='<c:out value="${mate.regdate}"/>' readonly="readonly">
	</div>
	<div>
	<label>업데이트 날짜</label><input value='<c:out value="${mate.updatedate}"/>' readonly="readonly">
	</div>
	
	
		 <div class="form-group">
       
            <img src="/Mate/display?fileName=${mate.image}"/>
        </div>

		 <div class="form-group">
          <label>활동명</label> <input class="form-control" name='activityname'
            value='<c:out value="${mate.activityname }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>활동일시</label> <input class="form-control" name='meetingdate' id='meetingdate'
            value='<c:out value="${mate.meetingdate}(${mate.dayofweek })"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>모임시간</label> <input class="form-control" name='meetingtime' id='meetingtime'
            value='<c:out value="${mate.meetingtime}"/>' readonly="readonly">
        </div>
         <div class="form-group">
          <label>활동시간</label> <input class="form-control" name='time' id='time'
            value='<c:out value="${mate.starttime}~${mate.endtime}"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>모임인원</label>
          <textarea class="form-control" rows="3" name='peoplenum'
            readonly="readonly"><c:out value="${mate.peoplenum}명 / ${mate.peoplemaxnum}명"/></textarea>
        </div>
       <c:choose>
         <c:when test="${join ==0}"> 
	        <button type="button" id="matejoin" data-joinchk='${join}'>참여하기</button>
	        <input type="hidden" id="joincheck" value="${join }">
		 </c:when>					
         <c:when test="${join ==1}"> 
	        <button type="button" id="matejoin" data-joinchk='${join}'>나가기</button>
	        <input type="hidden" id="joincheck" value="${join }">
		 </c:when>
       </c:choose>    
        		
        
		<button data-oper='list' class="btn btn-info">목록</button>
		<div class="form-group">
          <label>활동장소</label><br>출발지<input class="form-control" name='startzone'
            value='<c:out value="${mate.startzone }"/>' readonly="readonly">
            
           					   목적지<input class="form-control" name='endzone'
            value='<c:out value="${mate.endzone }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>안내사항</label> <input class="form-control" name='content'
            value='<c:out value="${mate.content }"/>' readonly="readonly">
        </div>
          <div class="form-group">
          <label>모임장소</label> <input class="form-control" name='meetingplace'
            value='<c:out value="${mate.meetingplace }"/>' readonly="readonly">
        </div>
        
        <p style="margin-top:-12px">
    
</p>
	<div id="map" style="width:40%;height:250px;"></div>
	
	
        
        <div>
        현재 모임 참여중인 인원(${mate.peoplenum })
        </div>
        
        
    <form id='operForm' action="/mate/modify" method="get">
	  <input type='hidden' id='no' name='no' value='<c:out value="${mate.no}"/>'>
	  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
	  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
  	  <input type='hidden' name='meeting' value='<c:out value="${cri.meeting }"/>'>
      <input type='hidden' name='filter' value='<c:out value="${cri.filter }"/>'>
	</form>

	<c:choose>
		<c:when test="${like ==0}">
			<a href='javascript: like_func();'><img id="likeImg" src="/resources/img/빈하트.png" alt="" width="30px" height="30px"></a>
			좋아요<div id='likecnt'>${mate.likecnt}</div>
			<input type="hidden" id="likecheck" value="${like }">
		</c:when>					
		<c:when test="${like ==1}">
			<a href='javascript: like_func();'><img id="likeImg" src="/resources/img/꽉찬하트.png" alt="" width="30px" height="30px"></a>
			좋아요<div id='likecnt'>${mate.likecnt}</div>
			<input type="hidden" id="likecheck" value="${like }">
		</c:when>
	</c:choose>		
				


<div class='row'>

	<div class="col-lg-12">

		<!-- /.panel -->
		<div class="panel panel-default"> 

		<div class="reply">	
			<div class="form-group">
                <label>Reply</label> 
                <input class="form-control" id='reply' name='reply' value="" placeholder="댓글을 입력해보세요.">
              </div>      
              <div class="form-group">
                <label>Replyer</label> 
                <input class="form-control" name='replyer' value='replyer'>
              </div>
      
        <button id='modalRegisterBtn' type="button" class="btn btn-primary">작성</button>
       
      </div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<ul class="chat">

				</ul>
				
				<!-- ./ end ul -->
			</div>
		</div>
	</div>
	<!-- ./ end row -->
</div>
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
	
	function showList(page){
		
		replyService.getList({no:noValue, page: page|| 1}, function(list){
			
			var str="";
			if(list == null || list.length == 0){
				replyUL.html("");
				return;
			}
			for(var i=0, len = list.length || 0; i<len; i++){
				str +="<li class='left clearfix'  id='rno"+list[i].rno+"' data-replyer="+list[i].replyer+" data-reply='"+list[i].reply+"' data-rno='"+list[i].rno+"'>";
				str +="<div><div class='header'><strong class= 'primary-font'>"
						+list[i].replyer+"</strong>";

				str +="<small class='pull-right text-musted'>"+replyService.displayTime(list[i].replyDate)+"</small>";
				str += "<button class='replyUpdateBtn' data-replyer="+list[i].replyer+" data-reply='"+list[i].reply+"' data-rno='"+list[i].rno+"'>수정</button>";
				str += "<button type='button' id='rembtn' data-rno='"+list[i].rno+"'>삭제</button></div>"
				str +="<p>"+list[i].reply+"</p></div></li>";
			}
			replyUL.html(str);
			
		}); //end function
	}//end showList
	
	 var modalRegisterBtn = $("#modalRegisterBtn");
	 var replyForm = $(".reply");
     var InputReply = replyForm.find("input[name='reply']");
     var InputReplyer = replyForm.find("input[name='replyer']");
     var InputReplyDate = replyForm.find("input[name='replyDate']");
     
     var repository = $(".repository");
     var repReply = repository.find("input[name='repReply']")
     var repReplyer = repository.find("input[name='repReplyer']")
     var repReplyDate = repository.find("input[name='repReplyDate']")
	 var repReplyNo = repository.find("input[name='repReplyNo']")

     modalRegisterBtn.on("click",function(e){
    	 if (!replyForm.find("input[name='reply']").val()){
    		 	alert("댓글 내용을 입력해주세요.")
    			return false;
    		}
    	 
        var reply = {
              reply: InputReply.val(),
              replyer:InputReplyer.val(),
              no:noValue
            };
        replyService.add(reply, function(result){
          
          
          replyForm.find("input").val("");
   
          
          showList(1);
          
          
        });
        
      });
    
     
     $(document).on("click", '#rembtn', function(e){
    	    var rno = $(this).data("rno");
    	    
    		console.log(rno);
    		replyService.remove(rno,function(result){
    			alert(result);
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

	    htmls += '<div id="mod">'+replyData.replyer;
	    
	    htmls += '<button type="button" id="modbtn">  저장  </button>';

		htmls += '<button type="button" id="modCancel">취소</button>';
		htmls += '<div id="rno'+ replyData.rno + '">';
		
		htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';

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
 	    	alert(result);
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
    operForm.submit();
    
  });
  
  typeChange();

  function typeChange(){
		
		var time = $("#time").val();
		var meetingtime = $("#meetingtime").val();
		
		time=time.slice(0,2) +":" + time.slice(2,7)+":"+time.slice(7,9);
		meetingtime=meetingtime.slice(0,2) +":"+meetingtime.slice(2,4);
		console.log(meetingtime);
		console.log(time);
      $("#time").val(time);
      $("#meetingtime").val(meetingtime);
      
	        
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
		if(count == 1){
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
				"no" : no,
				"count" : count
				};
	$.ajax({
		url : "/matejoin/joinUpdate",
		type : 'PUT',
		contentType: 'application/json',
		data : JSON.stringify(data),
		success : function(result){
		
			
			console.log("수정" + result.result);
			if(count == 1){
			 alert('${mate.activityname} 활동에서 나가셨습니다.');	
			 console.log("나가요~");
			 $('#joincheck').val(0);
			 $('#matejoin').html('참여하기');		
			 window.location.reload();
			}else if(result.result=='fail'){
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
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">코스타</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	</script>


<%@ include file="/WEB-INF/views/includes/footer.jsp" %>