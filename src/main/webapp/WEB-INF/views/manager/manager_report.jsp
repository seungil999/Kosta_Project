<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 2. 관리자 검색 페이지 --%>
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
   var searchForm = $("#searchForm");
   
    $(".page-item a").on("click",
               function(e) {

                  e.preventDefault();
                  actionForm.attr("action",
                  "/admin/search/list");
                  console.log('click');

                  actionForm.find("input[name='pageNum']")
                        .val($(this).attr("href"));
                  actionForm.submit();
                  
               });
    
	// 검색 키워드, 유형 선택 X시 체크용 
    $("#searchBtn").on("click",
          function(e) {

             if (!searchForm.find("option:selected")
                   .val()) {
                alert("검색종류를 선택하세요");
                return false;
             }

             if (!searchForm.find(
                   "input[name='keyword']").val()) {
                alert("키워드를 입력하세요");
                return false;
             }
             actionForm.attr("action",
             "/admin/search/list");
             searchForm.find("input[name='pageNum']").val("1");
             searchForm.find("input[name='amount']").val("10");
             e.preventDefault();
             searchForm.submit();

          });
	
  
 
});


// 체크박스 회원 삭제 > alert, confirm 모달로 바꿔야함
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

      var confirmAlert = confirm('정말로 탈퇴처리 하겠습니까?');

   if(confirmAlert){
  
     $.ajax({
       type : 'POST'
      ,url : '/admin/search/list/delete'
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
         <a href="/admin/search/main" class="w3-margin-left"><b>zupGozupUp</b>
              관리자 페이지</a></li>
         
         
         <!-- Float links to the right. Hide them on small screens -->
         <li class="w3-right w3-hide-small"> 
         <a href="/admin/main/list" class="w3-left">사용자 홈페이지로</a> 
         <a href="" class="w3-left w3-margin-right">접속 종료</a></li>
      </ul>
   </div>
<!-- navbar end -->
</header>

<div  id="ContentDiv" class="container mt-3">
 
  <br>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
   <li class="nav-item">
      <a class="nav-link " data-bs-toggle="tab" ><a href="/admin/main/list" class="btn">&nbsp;전체 회원&nbsp;</b></a></a>
    </li>
    <li class="nav-item">
      <a class="nav-link " data-bs-toggle="tab" href="/admin/search/main"><a href="/admin/search/main" class="btn">&nbsp;회원 검색&nbsp;</a></a>
    </li>
     <li class="nav-item">
      <a class="nav-link active" data-bs-toggle="tab" ><a href="/admin/report/main" class="btn">&nbsp;<b>신고 내역 확인&nbsp;</b></a></a>
    </li>
    
     <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" ><a href="/admin/write/main" class="btn">&nbsp;공지사항&nbsp;</a></a>
    </li>
     <li class="nav-item">
      <a class="nav-link  " data-bs-toggle="tab" ><a href="/admin/question/main" class="btn">&nbsp;자주묻는 질문&nbsp;</a></a>
    </li>
  </ul>

  </ul>
<!-- Nav tabs end -->
	
	<!-- Tab panes -->
  <div class="tab-content">
    <div id="home" class="container tab-pane active"><br>
  	<h3>신고 내역 확인</h3>
	</div>
	
<!-- 검색 -->
  <div class="search-container" >
     <br>  
         <form id="searchForm" action="/admin/search/list" method="get">
         <table>
            <tr>
         <td><button type="button" class="btn btn-success">
 				 Count <span class="badge bg-dark">${total}</span>
			</button></td>
            <td>
            <select name='type' id='type' class='form-select form-select' style="width: 100px;">
               <option value="ID"  class="lang-option"
                  <c:out value="${pageMaker.cri.type eq 'ID'?'selected':''}"/>>아이디</option>
               <option value="NICK" class="lang-option"
                  <c:out value="${pageMaker.cri.type eq 'NICK'?'selected':''}"/>>닉네임</option>
               <option value="UNAME" class="lang-option"
                  <c:out value="${pageMaker.cri.type eq 'UNAME'?'selected':''}"/>>이름</option>
            </select>
            </td>
            <td>
                <input type="text" class="form-control" name="keyword" id="keyword" placeholder="검색어를 입력해주세요" style="width: 200px;"
               value='<c:out value="${pageMaker.cri.keyword}"/>' /> 
            <input  type="hidden" type="number" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
            <input  type="hidden" type="number" name="amount" value='<c:out value="${pageMaker.cri.amount}"/>' /> 
            
            </td>
            <td>
               <button class="btn btn-success" id="searchBtn">찾기</button>
            </td>
            </tr>
         </table>
         </form>  
   </div> 
 <!-- 검색 end --> 
    
         
    <!--  검색 결과에 따라 페이징 처리를 하기 위함. -->   
	<form id='searchForm' action="/admin/search/list" method='get'>
  		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
       	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
		<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'>
       	<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
   	</form>
     <!-- form end -->    
     
   <form id='actionForm' action="/admin/search/list" method='get'>
        <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
        <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
		<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'>
        <input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
  </form> 	

   <!--  테이블  -->
  <table class="table table-hover" style="margin-top: 50px;">
    <thead>
      <tr>
        <th><input type="checkbox" id="allChk" class="chk"></input></th>
         <th>번호</th>
        <th>카테고리</th>
        <th>글쓴이</th>
        <th>작성자</th> 
        <th>신고내용</th>
        <th>신고일</th>
        <th>비고</th>
      </tr>
    </thead>
    
    
    <!-- 회원정보 들어갈 부분 -->
    <tbody id="allMemList" >
            <c:forEach items="${reportlist}" var="reportlist" varStatus="idx">
             <tr>
               	<th><input type="checkbox" id="allChk" class="chk" name="chk" value="${reportlist.report_no}"></input></th>
              	<th>${idx.count}</th>
               	<th>${reportlist.reltype}</th>
        		<th>${reportlist.writer}</th>
        		<th>${reportlist.report_type}</th>
        		<th>${reportlist.regdate}</th>
        		<th> <button type="button" class="btn btn-sm btn-outline-success modify"  data-bs-toggle="modal" data-bs-target="#${reportlist.id}" 
        		data-id="${reportlist.id}" data-name="${reportlist.username}" data-nick="${reportlist.nickname}" data-pwd="${reportlist.pwd}" data-email="${reportlist.email}"  >회원 수정</button> </th>
      		</tr>
     		</c:forEach>
    </tbody>
  
  </table><!-- 테이블 end -->
  
   <span>
      <button type="button" id="deleteBtn" style="float: right;" onclick="userDelete();"class="btn btn-success btn-sm ">회원 삭제</button> 
      <button type="button" id="registBtn" style="float: right; margin-right: 10px;" class="btn btn-sm btn-outline-success"  data-bs-toggle="modal" data-bs-target="#registMem">회원 등록</button> 
   </span>
     
   

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
        <form id="insertForm" action="/admin/search/list/add" method="post">
               
               
               <div class="form-group">
                     <label for="sid1">아이디 :</label> <input type="text"
                        class="form-control" id="id" name="id">
                  </div>
                  <br>
                  <div class="form-group">
                     <label for="sid1">이름:</label> <input type="text"
                        class="form-control" id="username" name="username">
                  </div>
                  <br>
                  <div class="form-group">
                     <label for="sid1">닉네임:</label> <input type="text"
                        class="form-control" id="nickname" name="nickname" >
                  </div>
                  <br>
                  <div class="form-group">
                     <label for="sid1">비밀번호 :</label> <input type="text"
                        class="form-control" id="pwd" name="pwd">
                  </div>
                  <br>
                  <div class="form-group">
                  <label for="sid1">이메일:</label> <input type="text"
                        class="form-control" id="email" name="email">
                  </div>
                  <br>
                  <div class="form-group">
                  <label for="sid1">휴대폰 :</label> <input type="text"
                        class="form-control" id="phone" name="phone" >
                  </div>
                  
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
 <c:forEach items="${reportlist}" var="reportlist" varStatus="idx">
<div class="modal fade" id="${reportlist.id}">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">회원 수정</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form class="updateForm" action="/admin/search/list/update" method="post">
			<!--   -->
			<input type="hidden" id="id" value="${reportlist.id}" name="id" />
			   <br>
                  <div class="form-group">
                     <label for="username">이름:</label> <input type="text"
                         class="form-control" id="username" name="username" value="" placeholder="${reportlist.username}">
                  </div>
                  <br>
                  <div class="form-group">
                     <label for="nickname">닉네임:</label> <input type="text"
                       class="form-control" id="nickname" name="nickname" value="" placeholder="${reportlist.nickname}">
                  </div>
                  <br>
                  <div class="form-group">
                     <label for="pwd">비밀번호 :</label> <input type="text"
                         class="form-control" id="pwd" name="pwd"  value="" placeholder="${reportlist.pwd}">
                  </div>
                  <br>
                  <div class="form-group">
                  <label for="email">이메일:</label> <input type="text"
                      class="form-control" id="email" name="email"  value="" placeholder="${reportlist.email}">
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

</div></div>

</body>
</html>