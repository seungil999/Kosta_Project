<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ include file="/WEB-INF/views/includes/sidebar.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html>
<div class="myp-title">내 활동 내역</div>
	<div class="main">
		<span class="bold">플로깅 다이어리</span>
	<hr>
	<div class="row" >
	<div class="col-lg-12" >
		<div class="panel panel-default" style="border-color :#42DF2B;">
			<!-- /.panel-heading -->
			<div class="panel-body" >
				<table class="table table-striped table-bordered table-hover" style="border-color :#42DF2B;">
					<thead>
						<tr >
							<th style="border-color :#42DF2B;">제목</th>
							<th style="border-color :#42DF2B;">활동시간</th>
							<th style="border-color :#42DF2B;">작성일</th>
						</tr>
					</thead>

          <c:forEach items="${list}" var="mate">
            <tr>
               <td style="border-color :#42DF2B;"><a href="/matefind/get?no=${mate.no}">
                  <c:out value="${mate.activityname}" />
                  </a>
              <td style="border-color :#42DF2B;"><fmt:formatDate pattern="yyyy-MM-dd"
                  value="${mate.regdate}" /></td>
              <td style="border-color :#42DF2B;">${mate.peoplenum}명 / ${mate.peoplemaxnum}명</td>    
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