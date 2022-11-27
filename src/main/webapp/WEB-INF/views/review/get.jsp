<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/resources/js/reviewReply.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/review.css" rel="stylesheet">
		
	
	<div class="review-title">후기</div> 
	<div class="main">
		<br><br>
		<input type="hidden" id="no" value="${review.no}">
		
		<div class="title-bold">제목</div>
		<div class="get-title">${review.title}</div>
		<div class="get-top">
			<div class="get-act" >${review.hit}</div><div class="act-bold">조회</div>
			<div class="get-writer">${review.writer}</div><div class="wri-bold">작성자</div>
			<div class="get-act" >${review.mate_no}</div><div class="act-bold">모임명</div>
		
			
		</div>
		<br>
		<hr style="background:#ccc; border:0; height:1px; ">
		<div class="get-writer">${review.regdate}</div><div class="act-bold">작성일</div>
	
		
		
		<br>
		<div class="title-bold">내용</div>
		<div class="content">${review.content}</div>
	
		<hr style="background:#ccc; border:0; height:1px; ">
				
	
       <br><br>
      
	
	<img id="reply" src="/resources/img/말풍선.png" alt="" width="30px" height="30px">
	댓글<span id='replycnt'>${review.replycnt}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<c:choose>
		<c:when test="${like ==0}">
			<a href='javascript: like_func();'><img id="likeImg" src="/resources/img/빈하트.png" alt="" width="30px" height="30px"></a>좋아요
			<span id='likecnt'>${review.likecnt}</span>
			<input type="hidden" id="likecheck" value="${like }">
		</c:when>					
		<c:when test="${like ==1}">
			<a href='javascript: like_func();'><img id="likeImg" src="/resources/img/꽉찬하트.png" alt="" width="30px" height="30px"></a>좋아요
			<span id='likecnt'>${review.likecnt}</span>
			<input type="hidden" id="likecheck" value="${like }">
		</c:when>
	</c:choose>		
				
		<hr style="background:#ccc; border:0; height:1px; ">
	
	
<div class='row'>

	<div class="col-lg-12">

		<!-- /.panel -->

				<ul class="chat">

				</ul>
	
			
				<!-- ./ end ul -->
			</div>
		<div class="reply">	
			<div class="form-group replyform">
				<div class="nickname" name="replyer">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;닉네임</div>
                <textarea class="form-control" id='reply' name='reply' placeholder="댓글을 입력해보세요."></textarea>
                 
              </div>      
     	 <button id='modalRegisterBtn' type="button" class="uploadBtn">댓글작성</button>
       
       
      </div>
			<!-- /.panel-heading -->
			
		</div>	
	
<div class="repository">
	  <input type='hidden' name='repReply' value='<c:out value=""/>'>  
  	  <input type='hidden' name='repReplyer' value='<c:out value=""/>'>
      <input type='hidden' name='repReplyDate' value='<c:out value=""/>'>
      <input type='hidden' name='repReplyNo' value='<c:out value=""/>'>
      
</div>		




</div>

<script type="text/javascript">
$(document).ready(function() {
	
	var noValue = '<c:out value="${review.no}"/>';
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
				str +="<div><li class='replyList'  id='rno"+list[i].rno+"' data-replyer="+list[i].replyer+" data-reply='"+list[i].reply+"' data-rno='"+list[i].rno+"'>";
				str += "<button type='button' id='rembtn' data-rno='"+list[i].rno+"'>삭제</button>"
				str += "<button class='replyUpdateBtn' data-replyer="+list[i].replyer+" data-reply='"+list[i].reply+"' data-rno='"+list[i].rno+"'>수정</button>";
				str +="<div class='header'><strong class= 'primary-font'>"
						+list[i].replyer+"</strong>";
						
				str +="<small class='pull-right text-musted'>"+replyService.displayTime(list[i].replyDate)+"</small>";
				
				str +="<p class='repContent'>"+list[i].reply+"</p></div></li></div><hr>";
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
              no:noValue
            };
        replyService.add(reply, function(result){
          
          
          replyForm.find("input").val("");
   		  
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
    	    			url : "/reviewReplies/repCntUpdate",
    	    			type : 'PUT',
    	    			contentType: 'application/json',
    	    			data : JSON.stringify(noValue),
    	    			success :
    	    				console.log("성공")	
    	    			, error : 
    	    				console.log("에러") 
    	    			});
    			}
    			alert(result);
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
 	    	alert(result);
 	    	repReply.val("");
 	    	showList(1);
 	    	}); 
     })
     
     $(document).on("click", "#modCancel", function(e){
    	 	repReply.val("");
 	    	showList(1); 
 	    	 
     });
    
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
	url : "/reviewLike/likeUpdate",
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


</script>
</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
