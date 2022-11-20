<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%-- <%@include file="../includes/header.jsp"%> --%>    
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<div class="border-end bg-white" id="sidebar-wrapper">
    <div class="sidebar-heading border-bottom bg-light">Start Bootstrap</div>
    <div class="list-group list-group-flush">
        <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Dashboard</a>
        <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Shortcuts</a>
    </div>
</div>










<div class='row'>
		<div class="col-lg-12">

			<form id='searchForm' action="/matefind/list" method='get'>
				<select name='type' id='type'>
					
					<option value="A" name="option"
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
							<th>활동시간</th>
							<th>활동날짜</th>
							<th>장소</th>
							<th>모집인원</th>
							<th>모집최대</th>
							<th>업로드날짜</th>
						</tr>
					</thead>

          <c:forEach items="${list}" var="mate">
            <tr>
          
               <td><a class='move' href='<c:out value="${mate.no}"/>'>
               <img src="/matefind/img/${mate.image}" id="productImage"/>
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
              <td><c:out value="${mate.meetingtime}"/></td>
              <td><c:out value="${mate.meetingdate}"/></td>
              <td><c:out value="${mate.meetingplace }"/></td>
              <td><c:out value="${mate.peoplenum }"/></td>
              <td><c:out value="${mate.peoplemaxnum }"/></td>
              <td><c:out value="${mate.regdate}" /></td>
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
			
<script type="text/javascript">
$(document)
		.ready(
				function() {
	
					history.replaceState({}, null, null);
					var actionForm = $("#actionForm");
					var searchForm = $("#searchForm");
					
					$(".paginate_button a").on("click",
							function(e) {

								e.preventDefault();
								actionForm.attr("action",
								"/matefind/list");
								console.log('click');

								actionForm.find("input[name='pageNum']")
										.val($(this).attr("href"));
								$('input').remove("#no");
								actionForm.submit();
								
							});
					
					$(".regularmate a").on("click",
							function(e) {

								e.preventDefault();

								console.log('click');
								actionForm.attr("action",
								"/matefind/list");
								actionForm.find("input[name='meeting']")
										.val($(this).attr("href"));
								actionForm.find("input[name='pageNum']")
								.val("1");
								actionForm.find("input[name='filter']")
								.val("");
								actionForm.find("input[name='keyword']")
								.val("");
								actionForm.find("input[name='type']")
								.val("");
								
								$('input').remove("#no");
								
								actionForm.submit();
							});
					$(".flashmate a").on("click",
							function(e) {

								e.preventDefault();

								console.log('click');
								actionForm.attr("action",
								"/matefind/list");
								actionForm.find("input[name='meeting']")
										.val($(this).attr("href"));
								actionForm.find("input[name='pageNum']")
								.val("1");
								actionForm.find("input[name='filter']")
								.val("");
								actionForm.find("input[name='keyword']")
								.val("");
								actionForm.find("input[name='type']")
								.val("");
								
								$('input').remove("#no");
								
								actionForm.submit();
							});
					$(".move") .on("click", function(e) {
								e.preventDefault();
								$('input').remove("#no");
								actionForm.append("<input type='hidden' id='no' name='no' value='"
										+ $(this).attr("href")+ "'>");
								actionForm.attr("action", "/matefind/get");
								actionForm.submit();

							});
					$(".soon a").on("click",
							function(e) {

								e.preventDefault();

								console.log('click');
								actionForm.attr("action",
								"/matefind/list");
								actionForm.find("input[name='filter']")
										.val($(this).attr("href"));
								actionForm.find("input[name='pageNum']")
								.val("1");
								actionForm.find("input[name='keyword']")
								.val("");
								searchForm.find("option:selected")
								.val("");
								actionForm.find("input[name='type']")
								.val("");
								if(actionForm.find("input[name='no']")){
									$('input').remove("#no");
									}
								
								actionForm.submit();
							});
					$(".like a").on("click",
							function(e) {

								e.preventDefault();

								console.log('click');
								actionForm.attr("action",
								"/matefind/list");
								actionForm.find("input[name='filter']")
										.val($(this).attr("href"));
								actionForm.find("input[name='pageNum']")
								.val("1");
								actionForm.find("input[name='keyword']")
								.val("");
								searchForm.find("option:selected")
								.val("");
								if(actionForm.find("input[name='no']")){
								$('input').remove("#no");
								}
								actionForm.submit();
							});
					

					

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
								actionForm.attr("action",
								"/matefind/list");
								searchForm.find("input[name='pageNum']")
										.val("1");
								e.preventDefault();
								$('input').remove("#no");
								searchForm.submit();

							});

				});
</script>
			
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
			