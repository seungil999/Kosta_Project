<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ include file="/WEB-INF/views/includes/sidebar.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html>
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap" rel="stylesheet">
<head>
<style>
body{
	font-family: 'Yeon Sung', cursive;
}
</style>
</head>
<div class="myp-title">내글관리</div>
	<div class="main">
		<span class="bold">자유게시판</span>
 
	<div class="row" >
	<div class="col-lg-12" >
		<div class="panel panel-default" style="border-color :#42DF2B;">
			<!-- /.panel-heading -->
			<div class="panel-body" >
				<table class="table table-striped table-bordered table-hover" style="border-color :#42DF2B;">
					<thead>
						<tr >
							<th style="border-color :#42DF2B;">제목</th>
							<th style="border-color :#42DF2B;">등록일</th>
							<th style="border-color :#42DF2B;">조회수</th>
						</tr>
					</thead>

          <c:forEach items="${list}" var="free">
            <tr >
               <td style="border-color :#42DF2B;"><a href="/board/readView?fno=${free.fno}">
                  <c:out value="${free.title}" />
                  </a> 
              <td style="border-color :#42DF2B;"><fmt:formatDate pattern="yyyy-MM-dd"
                  value="${free.regdate}" /></td>
              <td style="border-color :#42DF2B;">${free.hit}</td>
            </tr>
          </c:forEach>

				</table>
	
			</div>

		</div>
	</div>
		<div class="panel-body ">

				<div style="text-align: center;">
					<ul class="pagination">

						 <c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>
	
						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""} " >
								<a href="${num}">${num}</a>
							</li>
							
						</c:forEach>
						<c:if test="${pageMaker.next}">
						<li class="paginate_button next"><a
								href="${pageMaker.startPage +1 }">Next</a>	
						</c:if>

					</ul>
				</div>
				<!--  end Pagination -->
			</div>
	</div>
	
	</div>
	

<script type="text/javascript">
</script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">	



















</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>