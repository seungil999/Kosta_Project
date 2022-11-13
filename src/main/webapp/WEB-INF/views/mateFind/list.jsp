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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document)
		.ready(
				function() {

					history.replaceState({}, null, null);
					var actionForm = $("#actionForm");

					$(".paginate_button a").on("click",
							function(e) {

								e.preventDefault();

								console.log('click');

								actionForm.find("input[name='pageNum']")
										.val($(this).attr("href"));
								actionForm.submit();
							});
					
					$(".regularmate a").on("click",
							function(e) {

								e.preventDefault();

								console.log('click');

								actionForm.find("input[name='meeting']")
										.val($(this).attr("href"));
								actionForm.find("input[name='pageNum']")
								.val("1");
								actionForm.find("input[name='filter']")
								.val("");
								actionForm.find("input[name='keyword']")
								.val("");
								
								actionForm.submit();
							});
					$(".flashmate a").on("click",
							function(e) {

								e.preventDefault();

								console.log('click');

								actionForm.find("input[name='meeting']")
										.val($(this).attr("href"));
								actionForm.find("input[name='pageNum']")
								.val("1");
								actionForm.find("input[name='filter']")
								.val("");
								actionForm.find("input[name='keyword']")
								.val("");
								actionForm.submit();
							});

					$(".soon a").on("click",
							function(e) {

								e.preventDefault();

								console.log('click');

								actionForm.find("input[name='filter']")
										.val($(this).attr("href"));
								actionForm.find("input[name='pageNum']")
								.val("1");
								actionForm.find("input[name='keyword']")
								.val("");
								actionForm.submit();
							});
					$(".like a").on("click",
							function(e) {

								e.preventDefault();

								console.log('click');

								actionForm.find("input[name='filter']")
										.val($(this).attr("href"));
								actionForm.find("input[name='pageNum']")
								.val("1");
								actionForm.find("input[name='keyword']")
								.val("");
								actionForm.submit();
							});
					$(".move")
							.on("click", function(e) {

								e.preventDefault();
								actionForm.append("<input type='hidden' name='no' value='"
										+ $(this).attr("href")+"'>");
								actionForm.attr("action", "/matefind/get");
								actionForm.submit();
							});

					var searchForm = $("#searchForm");

					$("#searchForm button").on("click",
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
								searchForm.find("input[name='pageNum']")
										.val("1");
								e.preventDefault();

								searchForm.submit();

							});

				});
</script>
<div class='row'>
		<div class="col-lg-12">

			<form id='searchForm' action="/matefind/list" method='get'>
				<select name='type'>
					
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
	<input type="text" value="분류"/>
	
	<ul>
	
	<li class="regularmate">
		<a href="1">정기모임</a></li>
	<li class="flashmate">
		<a href="0">단기모임</a></li>
	<li class="allmate">	
		<a href="/matefind/list">전체보기</a>	</li>
	</ul>
	
	
	<ul>
	<li class="soon"><a href="soon">임박순</a></li>
	<li class="like"><a href="like">좋아요순</a></li>
	</ul>

<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>활동명</th>
							<th>분류</th>
							<th>작성자</th>
							<th>활동일시</th>
							<th>장소</th>
							<th>모집인원</th>
							<th>모집최대</th>
							<th>업로드날짜</th>
						</tr>
					</thead>

          <c:forEach items="${list}" var="mate">
            <tr>
              
               <td><a class='move' href='<c:out value="${mate.no}"/>'>
               <c:out value="${mate.activityname}" /></a>
              <td><c:choose>
              <c:when test="${mate.regular eq '1' }">
              	정기활동
              </c:when>
              <c:otherwise>
              	번개활동
              </c:otherwise>
              </c:choose></td>
              <td><c:out value="${mate.writer}" /></td>
              <td><fmt:formatDate pattern="yyyy-MM-dd"
                  value="${mate.meetingtime}" /></td>
              <td><c:out value="${mate.meetingplace }"/></td>
              <td><c:out value="${mate.peoplenum }"/></td>
              <td><c:out value="${mate.peoplemaxnum }"/></td>
              <td><fmt:formatDate pattern="yyyy-MM-dd"
                  value="${mate.regdate}" /></td>
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

			<form id='actionForm' action="/matefind/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

				<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'>
			    <input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
				
				<input type='hidden' name='meeting' value='<c:out value="${ pageMaker.cri.meeting }"/>'>

				<input type='hidden' name='filter' value='<c:out value="${ pageMaker.cri.filter }"/>'>
				
				
			</form>
			

			
</html>