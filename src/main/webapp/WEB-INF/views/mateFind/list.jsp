<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%-- <%@include file="../includes/header.jsp"%> --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<div class='row'>
		<div class="col-lg-12">

			<form id='searchForm' action="/list" method='get'>
				<select name='type'>
					<option value=""
						<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
					<option value="A"
						<c:out value="${pageMaker.cri.type eq 'A'?'selected':''}"/>>활동명</option>
					<option value="M"
						<c:out value="${pageMaker.cri.type eq 'M'?'selected':''}"/>>지역별</option>
				</select> <input type='text' name='keyword'
					value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
					type='hidden' name='pageNum'
					value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
					type='hidden' name='amount'
					value='<c:out value="${pageMaker.cri.amount}"/>' />
				<button class='btn btn-default'>찾기</button>
			</form>
		</div>
	</div> 

<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>활동명</th>
							<th>작성자</th>
							<th>활동일시</th>
							<th>장소</th>
							<th>모집인원</th>
							<th>모집최대</th>
							<th>업로드날짜</th>
						</tr>
					</thead>

          <c:forEach items="${list}" var="flash">
            <tr>
              
               <td><a class='move' href='<c:out value="${flash.activityname}"/>'>
               <c:out value="${flash.activityname}" /></a>
              
              <td><c:out value="${flash.writer}" /></td>
              <td><fmt:formatDate pattern="yyyy-MM-dd"
                  value="${flash.meetingtime}" /></td>
              <td><c:out value="${flash.meetingplace }"/></td>
              <td><c:out value="${flash.peoplenum }"/></td>
              <td><c:out value="${flash.peoplemaxnum }"/></td>
              <td><fmt:formatDate pattern="yyyy-MM-dd"
                  value="${flash.regdate}" /></td>
            </tr>
          </c:forEach>

				</table>

				 
 

				<div class='pull-right'>
					<ul class="pagination">

						 <c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>


					</ul>
				</div>
				<!--  end Pagination -->
			</div>

			<form id='actionForm' action="/board/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

				<input type='hidden' name='type'
					value='<c:out value="${ pageMaker.cri.type }"/>'> <input
					type='hidden' name='keyword'
					value='<c:out value="${ pageMaker.cri.keyword }"/>'>


			</form>
</html>