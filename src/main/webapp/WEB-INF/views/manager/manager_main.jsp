<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 1. 관리자 메인 페이지 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>&#128421; 관리자 페이지 &#128421;</title>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
#ContentDiv{
   padding-top: 100px;
}

/* 페이징 css */
.page-link {
  color: #000; 
  background-color: #fff;
  border: 1px solid #ccc; 
}

.page-item.active .page-link {
 z-index: 1;
 color: #fff;
 font-weight:bold;
 background-color: #198754 ;
 border-color: #ccc;
 
}

.page-link:focus, .page-link:hover {
  color: #000;
  background-color: #fafafa; 
  border-color: #ccc;
}
</style>

<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(document).ready(function(){
	
   // 전체 선택 
   $("#allChk").change(function(){
        if($("#allChk").is(":checked")){
           $(".chk").prop("checked", true);
        }else{
           $(".chk").prop("checked", false);
        }
   });
   
   var actionForm = $("#actionForm");
   
	// 가입된 회원만 조회
	$("#regSelectMemBtn").on("click", function(e) {
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val("1");
		actionForm.find("input[name='amount']").val("10");
		actionForm.find("input[name='filter']").val("가입");
		actionForm.submit();
		
	});
	
	// 탈퇴한 회원만 조회
	$("#delSelectMemBtn").on("click", function(e) {
		console.log('click');
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val("1");
		actionForm.find("input[name='amount']").val("10");
		actionForm.find("input[name='filter']").val("탈퇴");
		$('tbody tr').remove();
		actionForm.submit();
		
	});

   
});

//체크박스 회원 삭제 > alert, confirm 모달로 바꿔야함
function userDelete(){

   console.log("회원 삭제 갈겨2")
   var userIdxArray = [];

   $("input:checkbox[name=chk]:checked").each(function(){
     userIdxArray.push($(this).val());
   });

   console.log(userIdxArray);

   if(userIdxArray == ""){
     alert("탈퇴시킬 회원을 선택해주세요.");
     return false;
   }

   var confirmAlert = confirm('탈퇴처리 하겠습니까?');

if(confirmAlert){

  $.ajax({
    type : 'POST'
   ,url : '/admin/main/list/delete'
   ,dataType : 'json'
   ,data : JSON.stringify(userIdxArray)
   ,contentType: 'application/json'
   ,success : function(result) {
     alert("선택한 회원이 탈퇴 처리 되었습니다.");
     location.reload(); // 새로고침 한거임~!
   },
   error: function(request, status, error) {
     
   }
})   
}
}
</script>
</head>

<body>

<header>
<!-- navbar --> 
   <div class="w3-top">
      <ul class="w3-navbar w3-white w3-wide w3-padding-8 w3-card-2">
          <li><img src="${pageContext.request.contextPath}/resources/img/logo1.png" style="width: 152px; height: 45px;"></li>
         <li>
         <a href="/admin/main/list" class="w3-margin-left"><b>zupGozupUp</b>
              관리자 페이지</a></li>
         
         
         <!-- Float links to the right. Hide them on small screens -->
         <li class="w3-right w3-hide-small"> 
         <a href="/main" class="w3-left">사용자 홈페이지로</a> 
         <a href="" class="w3-left w3-margin-right">접속 종료</a></li>
      </ul>
   </div>
<!-- navbar end -->
</header>

<div  id="ContentDiv" class="container mt-3">

<div><b>${sessionScope.ManagerVO.id}님이 접속중입니다.</b></div><br>

<br>

<!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
   <li class="nav-item">
      <a class="nav-link active" data-bs-toggle="tab" ><a href="/admin/main/list" class="btn">&nbsp;<b>전체 회원&nbsp;</b></a></a>
    </li>
    <li class="nav-item">
      <a class="nav-link " data-bs-toggle="tab" href="/admin/search/main"><a href="/admin/search/main" class="btn">&nbsp;회원 검색&nbsp;</a></a>
    </li>
     <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" ><a href="/admin/report/main" class="btn">&nbsp;신고 내역 확인&nbsp;</a></a>
    </li>
     <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" ><a href="/admin/write/main" class="btn">&nbsp;공지사항&nbsp;</a></a>
    </li>
     <li class="nav-item">
      <a class="nav-link  " data-bs-toggle="tab" ><a href="/admin/question/main" class="btn">&nbsp;자주묻는 질문&nbsp;</a></a>
    </li>
  </ul>
<!-- Nav tabs end -->
	
	<!-- Tab panes -->
  <div class="tab-content">
    <div id="home" class="container tab-pane active"><br>
  		<h3>전체 회원 보기</h3>
	</div>
	
	<br>
	
	<div>
	   <button type="button" id="regSelectMemBtn" style="float: left; margin-right: 10px;" class="btn btn-lg btn-outline-success">가입 회원 조회</button> 
       <button type="button" id="delSelectMemBtn" style="float: left; " class="btn btn-lg btn-outline-success" >탈퇴 회원 조회</button> 
       <button type="button" class="btn btn-success btn-lg" style="float: right; " > Count <span class="badge bg-dark">${total}</span>
			</button>
	</div>
	
	<br>
	
   <!--  테이블  -->
  <table class="table table-hover" style="margin-top: 50px;">
    <thead>
      <tr>
        <th><input type="checkbox" id="allChk" class="chk"></input></th>
        <th>번호</th>
        <th>아이디</th>
        <th>이름</th>
        <th>닉네임</th>
        <th>가입일</th>
        <th>수정일</th>
        <th>탈퇴일</th>
        <th>상태</th>
        <th>관리</th>
      </tr>
    </thead>
    
     <!-- 회원정보 들어갈 부분 -->
    <tbody id="allMemList" >
            <c:forEach items="${userlist}" var="userlist" varStatus="idx">
             <tr>
               	<th><input type="checkbox" id="allChk" class="chk" name="chk" value="${userlist.id}"></input></th>
              	<th>${idx.count}</th>
               	<th>${userlist.id}</th>
        		<th>${userlist.username}</th>
        		<th>${userlist.nickname}</th>
        		<th>${userlist.regdate}</th>
        		<c:choose>
                	<c:when test="${userlist.status eq '가입' && userlist.regdate == userlist.updatedate }">
    					<th>-</th>								
					</c:when>	
					<c:when test="${userlist.updatedate > userlist.regdate}">
    					<th>${userlist.updatedate}</th>							
					</c:when>	
					<c:when test="${userlist.status eq '탈퇴' && userlist.regdate == userlist.updatedate }">
    					<th>-</th>							
					</c:when>				         
				</c:choose>
				
				<c:choose>
    				<c:when test="${userlist.status eq '탈퇴'}">
    					<th>${userlist.deletedate}</th>							
					</c:when>    
					<c:when test="${userlist.deletedate <= userlist.regdate}">
						<th>-</th>		
				</c:when>    
				</c:choose>
        		<th>${userlist.status}</th>
        		<th> <button type="button" class="btn btn-sm btn-outline-success modify"  data-bs-toggle="modal" data-bs-target="#${userlist.id}" 
        		data-id="${userlist.id}" data-name="${userlist.username}" data-nick="${userlist.nickname}" data-pwd="${userlist.pwd}" data-email="${userlist.email}"  >회원 수정</button> </th>
      		</tr>
     		</c:forEach>
    </tbody>
  
  </table><!-- 테이블 end -->
              
  <form id="actionForm" action="/admin/main/list" method='get' >
        <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
        <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
 		<input type='hidden' name='filter' value='${pageMaker.cri.filter}'>
 
  </form> 	
  
  
  
   <span>
       <button type="button" id="deleteBtn" style="float: right;" onclick="userDelete();"class="btn btn-success btn-sm ">회원 삭제</button> 
       <button type="button" id="registBtn" style="float: right; margin-right: 10px;" class="btn btn-sm btn-outline-success"  data-bs-toggle="modal" data-bs-target="#registMem">회원 등록</button> 
   </span>
     
    <!--  페이징 -->
    <ul class="pagination" >
        <c:if test="${pageMaker.prev}">
        	<li class="page-item previous"><a class="page-link" href="/admin/main/list?pageNum=${pageMaker.startPage-1}&amount=${pageMaker.cri.amount}&filter=${pageMaker.cri.filter}">Previous</a></li>
        </c:if>
        
        
       	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
             <li class="page-item active  ${pageMaker.cri.getPageNum() == num} " ><a class="page-link" href="/admin/main/list?pageNum=${num}&amount=${pageMaker.cri.amount}&filter=${pageMaker.cri.filter}">${num}</a></li>
        </c:forEach>
                  
        <c:if test="${pageMaker.next}">
        	<li class="page-item next"><a class="page-link" href="/admin/main/list?pageNum=${pageMaker.startPage +10}&amount=${pageMaker.cri.amount}&filter=${pageMaker.cri.filter}">Next</a>   
        </c:if>
	</ul>
    <!-- 페이징 end-->

  <!-- The Modal / 회원 등록 -->
<div class="modal fade" id="registMem">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">회원등록</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form id="insertForm" action="/admin/main/list/add" method="post">
               
               
               <div class="form-group">
                     <label for="sid1">아이디 :</label> <input type="text"
                        class="form-control" id="id" name="id">
                  </div>
                  <br>
                  <div class="form-group">
                     <label for="username">이름:</label> <input type="text"
                        class="form-control" id="username" name="username">
                  </div>
                  <br>
                  <div class="form-group">
                     <label for="nickname">닉네임:</label> <input type="text"
                        class="form-control" id="nickname" name="nickname" >
                  </div>
                  <br>
                  <div class="form-group">
                     <label for="pwd">비밀번호 :</label> <input type="text"
                        class="form-control" id="pwd" name="pwd">
                  </div>
                  <br>
                  <div class="form-group">
                  <label for="sid1">이메일:</label> <input type="text"
                        class="form-control" id="email" name="email">
                  </div>
                  <br>
                  
                 <div class="form-group">
                     	<label for="root">성별</label> 
                     	<select id="root" name="gender" class='form-select form-select'>
                        <option value="choice">선택</option>
                        <option value="man">남자</option>
                        <option value="woman">여자</option>
                        <option value="not_choice">선택 안함</option>
                     </select>
                     </div>
                  <br>
                      <button type="submit" id="submitMem" class="btn btn-outline-success"  style="float:right;">등록</button> 
               </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
  
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div><!-- modal end -->


<!-- The Modal / 회원 수정 -->
 <c:forEach items="${userlist}" var="userlist" varStatus="idx">
<div class="modal fade" id="${userlist.id}">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">회원 수정</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form class="updateForm" action="/admin/main/list/update" method="post">
				
					<input type="hidden" id="uid" value="${userlist.id}" name="id" />
                  <br>
                  <div class="form-group">
                     <label for="username">이름:</label> <input type="text"
                         class="form-control" id="username" name="username" value="" placeholder="${userlist.username}">
                  </div>
                  <br>
                  <div class="form-group">
                     <label for="nickname">닉네임:</label> <input type="text"
                       class="form-control" id="nickname" name="nickname" value="" placeholder="${userlist.nickname}">
                  </div>
                  <br>
                  <div class="form-group">
                     <label for=""pwd"">비밀번호 :</label> <input type="text"
                         class="form-control" id=""pwd"" name="pwd"  value="" placeholder="${userlist.pwd}">
                  </div>
                  <br>
                  <div class="form-group">
                  <label for="email">이메일:</label> <input type="text"
                      class="form-control" id="email" name="email"  value="" placeholder="${userlist.email}">
                  </div>
                  <br>
                 
            
                  <br>
                      <button type="submit" id="updateMem" class="btn btn-outline-success"  style="float:right;">수정</button> 
                      
           			
               </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div> </c:forEach>  <!-- modal end -->

</div>
</div>
</body>
</html>