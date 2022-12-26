<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ include file="/WEB-INF/views/includes/sidebar.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>zupzup</title>
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">	

<style>
body{
	font-family: 'Yeon Sung', cursive;
}
.modal{
	background-color:rgba(0,0,0,0.1) !important;
    }
</style>
</head>

<body>


<div class="myp-title">관심 목록</div>
	<div class="main">
		<span class="bold">찜한 추천장소</span>
	<hr>
	<c:if test="${empty list}">
		<div style="text-align:center;">찜한 추천장소가 없습니다.</div>
	</c:if>
	
	<div class="row" >
	<div class="col-lg-12" >
		<div class="panel panel-default" style="border-color :#198754 ;">
			<!-- /.panel-heading -->
			<div class="panel-body" >
				<table class="table table-striped table-bordered table-hover" style="border-color :#198754 ;">
					<thead>
						<tr >
							<th style="border-color :#198754 ;">관광지명</th>
							<th style="border-color :#198754 ;">주소</th>
							<th style="border-color :#198754 ;"></th>
						</tr>
					</thead>

          <c:forEach items="${list}" var="recom">
            <tr>
               <td style="border-color :#198754 ;">${recom.recname}</td>
              <td style="border-color :#198754 ;">${recom.address}</td>
              <td style="border-color :#198754 ; width:0px;"> <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-name="${recom.recname}"  data-desc="${recom.simpledesc}" data-bs-target="#${recom.recname}">자세히</button></td>    
            </tr>
          </c:forEach>
 
				</table>
	
			</div>

		</div>
	</div>
	
	
</div>

	<div class="panel-body">

	<div style="text-align: center; margin-right:250px">
		<ul class="pagination">

			 <c:if test="${pageMaker.prev}">
				<li class="paginate_button previous"><a
					href="${pageMaker.startPage -1}">Previous</a></li>
			</c:if>

			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} " >
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next}">
				<li class="paginate_button next"><a
					href="${pageMaker.endPage +1 }">Next</a></li>
			</c:if>


		</ul>
	</div>
	</div>
</div>


<form id='actionForm' action="/mypage/likeRecom" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

</form>






<script type="text/javascript">
$(document) .ready(function() {

	remove();
	function remove(){
	$('.content').find($('img')).remove();
	};
			var actionForm = $("#actionForm");
			
	    	$(".paginate_button a").on("click",
					function(e) {
			    		e.preventDefault();

						actionForm.find("input[name='pageNum']")
								.val($(this).attr("href"));
						actionForm.submit();
						
					});
		
			
		});
		
		
		
</script>
<c:forEach items="${list}" var="recom">

<!-- The Modal -->

<div class="modal" id="${recom.recname}">
	<div class="modal-dialog">
	  <div class="modal-content">
  
		<!-- Modal Header -->
		<div class="modal-header">
		 	${recom.recname}
		</div>
  
		<!-- Modal body -->
		<div class="modal-body">
			${recom.simpledesc}
		</div>
  
	 <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>
  
	  </div>
	</div>
  </div>
</c:forEach>
<script>
$('.modal-backdrop').remove();
</script>



</body>
</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>