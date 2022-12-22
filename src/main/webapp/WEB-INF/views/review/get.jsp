<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/resources/js/reviewReply.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/review.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mate-find.css" rel="stylesheet">		
<style>
body{
	font-family: 'Yeon Sung', cursive;
}
</style>
<!--   모달창   -->



<div class="repMod"></div> 


	
	<div class="review-title" style="margin-top:60px;">후기</div> 
	<div class="review_main" style="width:1150px;">
		<br><br>
		<input type="hidden" id="no" value="${review.rev_no}">
		
		<div class="title-bold">제목</div>
		<div class="get-title">${review.title}</div>
		<div class="get-top">
			<div class="get-act" >${review.hit}</div><div class="act-bold">조회</div>
			<div class="get-writer">${review.writer}</div><div class="wri-bold">작성자</div>
			<div class="get-act" >${review.mate_activity}</div><div class="act-bold">모임명</div>
		
			
		</div>
		<br>
		<hr style="background:#ccc; border:0; height:1px; ">
		<div class="get-writer">${review.regdate}</div><div class="act-bold">작성일</div>
	
		
		
		<br>
		<div>
		<div class="title-bold"	>내용</div>
		<div class="content" style="min-height:300px;">${review.content}</div>
	
		<hr style="background:#ccc; border:0; height:1px; ">
				
	</div>
       <br><br>
      
	
	<img id="reply" src="/resources/img/말풍선.png" alt="" width="30px" height="30px">
	댓글<span id='replycnt'>${review.replycnt}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<c:choose>
		<c:when test="${like ==0 || like eq null}">
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
	<c:if test="${userVO.id eq review.user_id}">
	<button id='remove' type="button" class="modrem">삭제</button>		
	<button id='modify' type="button" class="modrem">수정</button>
	</c:if>
		<hr style="background:#ccc; border:0; height:1px; ">
	
	
<div class='row'>

	<div class="col-lg-12">

		<!-- /.panel -->

				<ul class="chat">

				</ul>
	
			
				<!-- ./ end ul -->
			</div>
	<c:if test="${userVO ne null }">
		<div class="reply">	
			<div class="form-group replyform">
				<div class="nickname" name="replyer">${userVO.nickname }</div>
                <textarea class="form-control" id='reply' name='reply' placeholder="댓글을 입력해보세요."></textarea>
                 
              </div>      
     	 <button id='modalRegisterBtn' type="button" class="uploadBtn">댓글작성</button>
       
      </div>
    </c:if>
			<!-- /.panel-heading -->
			
		</div>	
	
<div class="repository">
	  <input type='hidden' name='repReply' value='<c:out value=""/>'>  
  	  <input type='hidden' name='repReplyer' value='<c:out value=""/>'>
      <input type='hidden' name='repReplyDate' value='<c:out value=""/>'>
      <input type='hidden' name='repReplyNo' value='<c:out value=""/>'>
</div>		

<form id='operForm'>
  <input type='hidden' id='rev_no' name='rev_no' value='<c:out value="${review.rev_no}"/>'>
  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
  <input type='hidden' name='filter' value='<c:out value="${cri.filter}"/>'>  
</form>



</div>

<script type="text/javascript">
$(document).ready(function() {
	
	var noValue = '<c:out value="${review.rev_no}"/>';
	var replyUL = $(".chat");
	var replyMod = $(".repMod");
	var clearfix = $(".left clearfix");
	showList(1);
	var userid = "<c:out value='${userVO.id}'/>";

	function showList(page){
		
		replyService.getList({rev_no:noValue, page: page|| 1}, function(list){
			var mod="";
			var str="";
			if(list == null || list.length == 0){
				replyUL.html("");
				return;
			}
			for(var i=0, len = list.length || 0; i<len; i++){
				str +="<div><li class='replyList'  id='rev_rno"+list[i].rev_rno+"' data-replyer="+list[i].replyer+" data-reply='"+list[i].reply+"' data-rev_rno='"+list[i].rev_rno+"'>";
				if(userid==list[i].user_id){
				str += "<button type='button' id='rembtn' data-rev_rno='"+list[i].rev_rno+"'>삭제</button>";
				console.log(list[i].rev_rno);
				str += "<button class='replyUpdateBtn' data-replyer="+list[i].replyer+" data-reply='"+list[i].reply+"' data-rev_rno='"+list[i].rev_rno+"'>수정</button>";
				}
				str +="<div class='header'><strong class= 'primary-font'>"+"<a class='repUserProfile' data-user='"+list[i].user_id+"'><img class='user-img' src='/Mate/display?fileName="+list[i].profile+"'/></a>"
						+list[i].replyer+"</strong>";
				str +="<small class='repDate'>"+replyService.displayTime(list[i].replyDate)+"</small>";
				
				str +="<p class='repContent'>"+list[i].reply +"</p></div></li></div><hr>";
			}
			for(var i=0, len = list.length || 0; i<len; i++){
				
				if(list[i].profile_open == 'Y'){
					mod += "<div class='my_modal' id='"+list[i].user_id+"'>";
					mod += "<button class='modal_close_btn "+list[i].user_id+"'>✖</button>";    	
					mod += "<div class='main'>";
					mod += "<div class='bold'>"+list[i].nickname+"님의 프로필";
					if(list[i].grade==3){
						mod+=`<img class="grade" src="/resources/img/3grade.png"></div>`;
					}else if(list[i].grade==2){
						mod+=`<img class="grade" src="/resources/img/2grade.png"></div>`;
					}else{
						mod+=`<img class="grade" src="/resources/img/1grade.png"></div>`;
					}
					
					mod +="<hr>";
					mod += "<table class='modtab'><tr>";
				 	mod += "<td class='bold'>이름</td>";
					mod += "<td class='profile-input'><textarea rows='1' id='username' name='username' class='form-control id' readonly>"+list[i].username+"</textarea></td>";
					mod += "<td rowspan='2'><div class='uploadResult'>";
					mod += "<img class='profileImg' id='profileImg' src='/Mate/display?fileName="+list[i].profile+"'></div> </td></tr>";
					mod += "<tr><td class='bold'>닉네임</td>";
				 	mod += "<td class='profile-input'><textarea rows='1' name='nickname' id='nickname' class='form-control id' readonly>"+list[i].nickname+"</textarea></td></tr>";
					mod += "<tr><td class='bold'>이메일</td>";
					mod += "<td class='profile-input'><textarea rows='1' name='email' id='email' class='form-control id' readonly>"+list[i].email+"</textarea></td></tr>";
				 	mod += "<tr><td class='bold'>성별</td>";
					mod += `<td class="profile-input"><textarea rows="1" name="phone" id="phone" class="form-control id" readonly><c:out value="${list[i].gender eq 'man' ? '남자':'여자' }"/></textarea></td>`;		
				 	mod += "</tr></table></div></div>";
				}else{
					mod +="<div class='my_modal' id='"+list[i].user_id+"'>";
				    mod +="<button class='modal_close_btn "+list[i].user_id+"'>✖</button>";
					mod +="<div class='main'><div class='bold'>"+list[i].user_id+"님의 프로필</div><hr>";
					mod +="<div style='text-align:center;'><img  src='/resources/img/404.png'><p class='private'>비공개 프로필입니다!</p></div></div></div>";
					
					    	   
				           
				}	
			}
			replyUL.html(str);
			replyMod.html(mod);
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
              user_id: userid,
              rev_no:noValue
            };
        replyService.add(reply, function(result){
          
          
          replyForm.find("textarea").val("");
   		  
          var repcnt = $("#replycnt").html();
          
          $("#replycnt").html(parseInt(repcnt)+1);
          
          showList(1);
          
          
        });
        
      });
    

     $(document).on("click", '#rembtn', function(e){
    	    var rev_rno = $(this).data("rev_rno");
    		console.log(rev_rno);
    		replyService.remove(rev_rno,function(result){
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
    	 
    	 
    	 repReplyNo.val($(this).data("rev_rno"));
    	 repReplyer.val($(this).data("replyer"));
    	 repReply.val($(this).data("reply"));
    	 
    	 var replyData ={
         rev_rno:repReplyNo.val(),
         replyer:repReplyer.val(),
         reply:repReply.val()
    	 };
		
		
	   var htmls = "";
	    htmls += '<button type="button" id="modCancel" class="rembtn">취소</button>';
	    htmls += '<button type="button" id="modbtn" class="replyUpdateBtn">  저장  </button>';
	    htmls += '<div class="header"><strong class="primary-font" id="mod">'+replyData.replyer+"</strong>";
	   

		
		htmls += '<div id="rev_rno'+ replyData.rev_rno + '">';
		
		htmls += '<textarea name="editContent" id="editContent" rows="3">';

		htmls += replyData.reply;

		htmls += '</textarea>';

		htmls += '</div>';
		
		$('#rev_rno'+replyData.rev_rno).replaceWith(htmls);	
		$('#rev_rno'+replyData.rev_rno+' #editContent').focus();
	    
  });
     
     $(document).on("click", "#modbtn", function(e){
    	 
    	
    	var replyEditContent = $("#editContent").val();
    	console.log(replyEditContent);
    	 var reply = {rev_rno:repReplyNo.val(), reply:replyEditContent} 
    	 
    	 replyService.update(reply, function(result){
 	    	
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
	
	rev_no = $('#rev_no').val(),
	count = $('#likecheck').val(),
	data = {
			"user_id": "${userVO.id}",
			"rev_no" : rev_no,
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
		console.log(result.result);
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


</script>

<script type="text/javascript">
$(document).ready(function() {
	  var operForm = $("#operForm"); 

	  $("button[id='modify']").on("click", function(e){
		  operForm.attr("action","/review/modify");
		  operForm.attr("method","get");

		  operForm.submit();
	    
	  });
	  
	    
	  $("button[id='remove']").on("click", function(e){
		  if (!confirm("정말로 삭제하시겠습니까?")) {
			     return false;
			    } else {
	    operForm.attr("action","/review/remove");
	    operForm.attr("method","post");
	    operForm.submit();
		}
	  });  
	});

</script>
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
			
            $(document).on("click", '.repUserProfile',function(e){
             	var userid = $(this).data("user");
        			 modal(userid);
        		});
			
			
        });
        </script>
</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
