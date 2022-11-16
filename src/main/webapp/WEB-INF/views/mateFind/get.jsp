<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          <label>이미지</label> <input class="form-control" name='image'
            value='<c:out value="${mate.image}"/>' readonly="readonly">
        </div>

		 <div class="form-group">
          <label>활동명</label> <input class="form-control" name='activityname'
            value='<c:out value="${mate.activityname }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>활동일시</label> <input class="form-control" name='meetingtime'
            value='<c:out value="${mate.meetingtime}(${mate.dayofweek })"/>' readonly="readonly">
        </div>
         <div class="form-group">
          <label>활동시간</label> <input class="form-control" name='time'
            value='<c:out value="${mate.starttime}~${mate.endtime}"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>모임인원</label>
          <textarea class="form-control" rows="3" name='peoplenum'
            readonly="readonly"><c:out value="${mate.peoplenum}명 / ${mate.peoplemaxnum}명"/></textarea>
        </div>
        <button type="button">참여하기</button>
		<button data-oper='list' class="btn btn-info">목록</button>
		<div class="form-group">
          <label>활동장소</label> <input class="form-control" name='startzone'
            value='<c:out value="${mate.startzone }"/>' readonly="readonly">
           					   <input class="form-control" name='endzone'
            value='<c:out value="${mate.endzone }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>안내사항</label> <input class="form-control" name='content'
            value='<c:out value="${mate.content }"/>' readonly="readonly">
        </div>
        <div>
        현재 모임 참여중인 인원(${mate.peoplenum })
        </div>
        ${cri.pageNum }
        
    <form id='operForm' action="/mate/modify" method="get">
	  <input type='hidden' id='no' name='no' value='<c:out value="${mate.no}"/>'>
	  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
	  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
  	  <input type='hidden' name='meeting' value='<c:out value="${cri.meeting }"/>'>
      <input type='hidden' name='filter' value='<c:out value="${cri.filter }"/>'>
	</form>



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
    
   /*   $(".chat").on("click" ,"li", function(e){
    	 var rno = $(this).data("rno");
    	 console.log(rno);
    	 replyService.get(rno, function(reply){
    	        repReply.val(reply.reply);
    	        repReplyer.val(reply.replyer);
    	        repReplyDate.val(replyService.displayTime(reply.replyDate))
    	        .attr("readonly","readonly");
    	        repository.data("rno", reply.rno);
    	    	
    	        console.log(repReply.val());
    	      });
     }); */
     
     $(document).on("click", '#rembtn', function(e){
    	    var rno = $(this).data("rno");
    	    
    		console.log(rno);
    		replyService.remove(rno,function(result){
    			alert(result);
    			showList(1);
    		});
    		
    		
    	});
     $(document).on("click", ".replyUpdateBtn", function(e){
    	 var rno = $(this).data("rno");
    	 var replyer = $(this).data("replyer");
    	 var reply = $(this).data("reply");
    	 repReply.val(reply);
    	 repReplyer.val(replyer);
    	 repReplyNo.val(rno);
    	 var replyData ={
         rno:repReplyNo.val(),
         replyer:repReplyer.val(),
         reply:repReply.val()
    	 };
		
		
	   var htmls = "";

	    htmls += '<div>'+replyer;
	    
	    htmls += '<button type="button" id="modbtn">  저장  </button>';

		htmls += '<button type="button" id="modCancel">취소</button>';
		htmls += '<div id="rno'+ rno + '">';
		
		htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';

		htmls += replyData.reply;

		htmls += '</textarea>';

		htmls += '</div>';
		
		$('#rno'+rno).replaceWith(htmls);	
		$('#rno'+rno+' #editContent').focus();
	    
  });
     
     $(document).on("click", "#modbtn", function(e){
    	 
    	var replyEditContent = $("#editContent").val();
    	 var reply = {rno:repReplyNo.val(), reply:replyEditContent} 
    	 
    	 replyService.update(reply, function(result){
 	    	alert(result);
 	    	showList(1); 
 	    	}); 
     })
     
  
  
  
	
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#no").remove();
    operForm.attr("action","/matefind/list")
    operForm.submit();
    
  });  
});




</script>



