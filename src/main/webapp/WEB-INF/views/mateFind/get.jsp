<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/resources/js/mateReply.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/mate-find.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">

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

<div class="repMod"></div>
<div class="reportMod"></div>  

<div class="my_modal" style="height:521" id="${mate.no}">
     <button class="modal_close_btn ${mate.no}">✖</button>   
<form action="/matefind/report" method="post" id="rep_form">	   
<input type="hidden" name="report_type" value=1> 
<input type="hidden" name="mate_id" value="${mate.no}">
<input type="hidden" name="report_writer" value="${userVO.id}">
	<div class="r-main">
		<div class="r-title">신고하기</div>
	
	<hr>

 	<table class="modtab">
 		
 		<tr>
	 		<td class="r-bold">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목 :&nbsp;</td>
	 		<td class="r-input"><p id="activityname" name="activityname" readonly>${mate.activityname}</p></td>
	 	
 		</tr>
 		<tr>
	 		<td class="r-bold">작&nbsp;성&nbsp;자 :&nbsp;</td>
	 		<td class="r-input"> ${mate.writer} </td>
 		</tr>
 	</table>
 	<hr style="margin-top:7px; margin-bottom:7px;">
 	<table class="modtab">	
 		<tr>
	 		<td class="r-bold">사유선택 :</td>
	 		<td class="r-input" style="font-size:14px">대표적인 사유 1개를 선택해 주세요.</td>
	 	</tr>
	 	<tr>
	 		<td></td>
	 		<td class="r-input" style="font-size:14px">기타 사유는 클릭 후 직접 작성해 주세요.</td>
 		<tr>
 	</table>
 	<hr style="margin-top:7px; margin-bottom:7px;">
 	
 	
 	<div><label><input type="radio" class="r_check" name="report_content" value="불법물 홍보"> 불법물 홍보</label></div>
    <div><label><input type="radio" class="r_check" name="report_content" value="동일내용의 게시글 반복(도배)"> 동일내용의 게시글 반복(도배)</label></div>
    <div><label><input type="radio" class="r_check" name="report_content" value="음란성 또는 청소년에게 부적합한 내용"> 음란성 또는 청소년에게 부적합한 내용</label></div>
    <div><label><input type="radio" class="r_check" name="report_content" value="" id="etc"> 기타</label></div>
    <div><textarea class="form-control r_content" name="report_content" id="etc_content"
     style="resize:none; width: -webkit-fill-available;" placeholder="기타 사유는 30자 내외로 작성해주세요."></textarea></div>
    <div style="text-align:center;"><button type="button" class="r_cancel ${mate.no}">취&nbsp;&nbsp;소</button><button type="button" class="r_rembtn">제&nbsp;&nbsp;출</button></div>
    
 	</div>
 </form>
</div>

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
	<c:if test="${mate.report_count > 0}"><span style="color:#ff5151; float:right;">신고가 누적된 활동입니다.</span></c:if>
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
        <c:choose>
	        <c:when test="${userVO.id eq mate.user_id}">
		        <button id='remove' type="button" class="modrem">삭제</button>	
				<button id='modify' type="button" class="modrem">수정</button>
			</c:when>
			<c:otherwise>
				<button id='report' type="button" class="siren_modrem"><img class="siren" src="/resources/img/siren.png">신고</button>
			</c:otherwise>
		</c:choose>
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
		<c:choose>
		<c:when test="${userVO ne null && join eq 1}">
			<div class="reply">	
				<div class="form-group replyform">
					<div class="nickname" name="replyer">${userVO.nickname}</div>
	                <textarea class="form-control" id='reply' name='reply' placeholder="댓글을 입력해보세요."></textarea>
	                 
	              </div>      
	     	 <button id='modalRegisterBtn' type="button" class="uploadBtn">댓글작성</button>
  
	      </div>
	      </c:when>
      
			
			<c:when test="${join eq 0 ||join eq null && userVO ne null}">
			<p style="text-align:center;">모임에 참여중인 인원만 댓글 작성이 가능합니다!</p>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
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
	var replyMod = $(".repMod");
	var reportMod = $(".reportMod");
	var clearfix = $(".left clearfix");
	showList(1);
	var userid = "<c:out value='${userVO.id}'/>";
	
	
	
	
	function showList(page){
		
		replyService.getList({no:noValue, page: page|| 1}, function(list){
			var mod="";
			var str="";
			var rep="";
			if(list == null || list.length == 0){
				replyUL.html("");
				return;
			}
			for(var i=0, len = list.length || 0; i<len; i++){
				str +="<div><li class='replyList'  id='rno"+list[i].rno+"' data-replyer="+list[i].replyer+" data-reply='"+list[i].reply+"' data-rno='"+list[i].rno+"'>";
				if(userid==list[i].user_id){
				str += "<button type='button' id='rembtn' data-rno='"+list[i].rno+"'>삭제</button>";
				str += "<button class='replyUpdateBtn' data-replyer="+list[i].replyer+" data-reply='"+list[i].reply+"' data-rno='"+list[i].rno+"'>수정</button>";
				}else if(userid != ''){
				str += "<button type='button' class='reply-report' id='reply-report' data-writer='${userVO.id}' data-rno='"+list[i].rno+"'>신고</button>";
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
					mod += "<div class='bold'>"+list[i].nickname+"님의 프로필</div>";
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
					mod += "<tr><td class='bold'>휴대폰</td>";		
				    mod += "<td class='profile-input'><textarea rows='1' name='phone' id='phone' class='form-control id' readonly>"+list[i].phone+"</textarea></td></tr>";		
				 	mod += "<tr><td class='bold'>성별</td>";
					mod += `<td class="profile-input"><textarea rows="1" name="phone" id="phone" class="form-control id" readonly><c:out value="${list[i].gender eq 'man' ? '남자':'여자' }"/></textarea></td>`;		
				 	mod += "</tr></table></div></div>";
				}else{
					mod +="<div class='my_modal' id='"+list[i].user_id+"'>"
				    mod +="<button class='modal_close_btn "+list[i].user_id+"'>✖</button>"    	
					mod +="<div class='main'><div class='bold'>"+list[i].user_id+"님의 프로필</div><hr>"
					mod +="<div style='text-align:center;'><img  src='/resources/img/404.png'><p class='private'>비공개 프로필입니다!</p></div></div></div>"   
				}
				
				for(var i=0, len = list.length || 0; i<len; i++){
					rep+='<div class="my_modal" style="height:521" id="'+list[i].rno+'">';
				    rep+='<button class="modal_close_btn '+list[i].rno+'">✖</button>';   
					rep+='<form  method="post" action="/matefind/repReport" id="'+list[i].rno+'" onsubmit="return test()">'	   
					rep+='<input type="hidden" name="report_type" value=2>' 
					rep+='<input type="hidden" name="report_writer" value="${userVO.id}">'
					rep+='<input type="hidden" name="mate_reply_id" value="'+list[i].rno+'">'
					rep+='<input type="hidden" name="mate_id" value="${mate.no}">'
					rep+='<div class="r-main">'
					rep+='<div class="r-title">신고하기</div><hr>'
					rep+='<table class="modtab">'
					rep+='<tr><td class="r-bold">작&nbsp;성&nbsp;자 :&nbsp;</td>'
					rep+='<td class="r-input"><p id="user_id" readonly>'+list[i].replyer+'</p></td></tr>'
					rep+='<tr><td class="r-bold">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용 :&nbsp;</td>'
					rep+= '<td class="r-input">'+list[i].reply+'</td></tr></table>'
				 	rep+='<hr style="margin-top:7px; margin-bottom:7px;">'
				 	rep+='<table class="modtab">'
				 	rep+='<tr><td class="r-bold">사유선택 :</td>'
					rep+= '<td class="r-input" style="font-size:14px">대표적인 사유 1개를 선택해 주세요.</td>'
					rep+='</tr><tr><td></td>'
					rep+='<td class="r-input" style="font-size:14px">기타 사유는 클릭 후 직접 작성해 주세요.</td>'
				 	rep+='<tr></table>' 
				 	rep+='<hr style="margin-top:7px; margin-bottom:7px;">'
				 	rep+='<div><label><input type="radio" class="r_r_check" name="r_report_content" value="욕설 또는 혐오발언"> 욕설 또는 혐오발언</label></div>'
				 	rep+='<div><label><input type="radio" class="r_r_check" name="r_report_content" value="동일내용의 댓글 반복(도배)"> 동일내용의 댓글 반복(도배)</label></div>'
				 	rep+='<div><label><input type="radio" class="r_r_check" name="r_report_content" value="음란성 또는 청소년에게 부적합한 내용"> 음란성 또는 청소년에게 부적합한 내용</label></div>'
				 	rep+='<div><label><input type="radio" class="r_r_check" name="r_report_content" value="" id="etc"> 기타</label></div>'
				 	rep+='<div><textarea class="form-control r_r_content" name="r_report_content" id="r_etc_content"'
				 	rep+='style="resize:none; width: -webkit-fill-available;" placeholder="기타 사유는 30자 내외로 작성해주세요."></textarea></div>'
				 	rep+='<div style="text-align:center;"><button type="button" class="r_cancel '+list[i].rno+'">취&nbsp;&nbsp;소</button><input type="submit" class="report_reply" data-rno="'+list[i].rno+'" value="제&nbsp;&nbsp;출"></div></div></form></div>'
				}
			}
			reportMod.html(rep);
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
			
			}else if(result.result=='mateFull'){
				
				alert('예약된 활동이 너무 많습니다. 다른 활동을 나간 뒤에 다시 시도해주세요.');
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
	    $('')
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
                    backgroundColor: 'rgba(0,0,0,0.1)'
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
            /** 참여중인인원 **/
            $('.userProfile').on("click",function(e){
            	var userid = $(this).data("user");
    			 modal(userid);
    		});	
            /** 댓글 **/
            $(document).on("click", '.repUserProfile',function(e){
             	var userid = $(this).data("user");
        			 modal(userid);
        		});
            
            $(document).on("click", '.reply-report',function(e){
            	 $('.r_r_content').hide();
            	var no = $(this).data("rno");
    			var writer = $(this).data("writer");
    			data = {
    						"mate_reply_id" : no,
    						"report_writer" : writer
    						};
    			$.ajax({
    				url : "/matefind/repReportChk",
    				type : 'post',
    				contentType: 'application/json',
    				data : JSON.stringify(data),
    				success : function(result){
    					
           				 modal(no);
    					
    				}, error : function(result){
    					alert("이미 신고가 접수되었습니다.");
    				}
    				
    				});
            	
            	
             	
        		});
            /** 신고하기 **/
      	  $("#report").on("click", function(){
      		  var reportChk = "<c:out value='${reportChk}'/>"
      		  console.log(reportChk);
      		  var no = "<c:out value='${mate.no}'/>"
      		  var userid = "<c:out value='${userVO.id}'/>";
      		console.log(userid);
      		console.log(reportChk);
      		   if(userid == null || userid== ''){
      			alert("먼저 로그인 해주세요.");
      		  }else if(reportChk >=1){
      			  alert("1개의 게시글에 1번만 신고가 가능합니다.");
      		  }else{
        		  modal(no);
      	  }
      	  });
			
        });
        </script>	
       
  <script type="text/javascript">
  function test(){
		var form = $(this).data('rno');
		var contentChk = $("input[name=r_report_content]:checked").val();
		var etc_content =$('#r_etc_content').val();
		if((contentChk=='' ||contentChk==null) &&etc_content==''){
			alert('신고사유를 선택 또는 내용을 입력해 주세요.');
			return false;
		}else{
			alert("신고 접수가 완료되었습니다.");
			return true;
		}
	};
	
  $(document).ready(function(){
	  
	    $('.r_content').hide();
		$("input[name='report_content']").change(function(){
			if($("input[name='report_content']:checked").val() == ''){
				$('.r_content').show();
			}else{
				$('.r_content').hide();
			}
			
		});
	
		 $(document).on("change", '.r_r_check',function(e){
				
				if($("input[name='r_report_content']:checked").val() == ''){
					$('.r_r_content').show();
				}else{
					$('.r_r_content').hide();
				}
	
			});
		
			
		
		
			
		
		$('.r_rembtn').on('click',function(){
			var reportChk = "<c:out value='${reportChk}'/>";
			var contentChk = $("input[name=report_content]:checked").val();
			
			if((contentChk==null||contentChk=='') && $('#etc_content').val()==''){
				alert('신고사유를 선택 또는 내용을 입력해 주세요.');
				return false;
			}else if(reportChk<1){
				alert("신고가 접수 되었습니다.");
				$('#rep_form').submit();
			}else{
				 alert("1개의 게시글에 1번만 신고가 가능합니다.");
			}
			
		});
	
		
	
		
		
		
	});
  </script>


<%@ include file="/WEB-INF/views/includes/footer.jsp" %>