<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<!DOCTYPE html>
<html>
<link href="${pageContext.request.contextPath}/resources/css/review.css" rel="stylesheet">	
<link href="${pageContext.request.contextPath}/resources/css/mate-find.css" rel="stylesheet">	
	<div class="search-container">
		<form id='searchForm' action="/review/list" method='get'>
			<select name='type' id='type' class='review mate-select' style="margin-left:180px;">
				<option value="T" name="option" class="lang-option"
					<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
				<option value="C" class="lang-option"
					<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
				<option value="W" class="lang-option"
					<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
				<option value="R" class="lang-option"
					<c:out value="${pageMaker.cri.type eq 'R'?'selected':''}"/>>날짜</option>
				<option value="A" class="lang-option"
					<c:out value="${pageMaker.cri.type eq 'A'?'selected':''}"/>>활동명</option>
			</select> 
			<div class="mate-keyword">
               <input type="text" class="form-control" name="keyword" id="keyword" placeholder="검색어를 입력해주세요"
				value="${pageMaker.cri.keyword}" />
			</div>
				 <input type='hidden' name='pageNum' value="${pageMaker.cri.pageNum}" />
				 <input type='hidden' name='amount' value="${pageMaker.cri.amount}" />
			<button class='find' >찾기</button>
		</form>
		
	</div>
	<br><br><hr><br><br>
	<div class="review-title">후기</div> 
	<div class="main">
		<span class="filter replycnt"><a href="replycnt">댓글순</a></span>
		<span class="filter like"><a href="like">좋아요순</a></span> 	
		<span class="filter newest"><a href="newest">최신순</a></span>
	
		<br><br>
		<hr>
	<c:forEach items="${list}" var="review">
	<a class="move" href="${review.no}">
	<c:choose>
	
		<c:when test="${empty review.thumbnail }">
			<span class="image"><img class="activity-Img" src="/resources/img/logo2.png" width=250; height=200;></span>
		</c:when>
		<c:otherwise>
			<span class="image">${review.thumbnail }</span>
		</c:otherwise>
	</c:choose>
		<span class="titleInfo">${review.title}</span></a>
		<span class="date">${review.regdate }</span>
		<br>
		<div class="content">${review.content }</div>
		<div class="content">작성자:${review.writer}</div>
		<div class="content">조회 ${review.hit} 좋아요 ${review.likecnt }</div>
		<div class="content" style="color:#42df2b; font-weight:bold;">모임명:${review.mate_no}</div>
		<hr>
		</c:forEach>		
	</div>
	
	
<div class="panel-body">

	<div style="text-align: center;">
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
	<!--  end Pagination -->
</div>

<form id='actionForm' action="/matefind/list" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

	<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'>
    <input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
	
	<input type='hidden' name='filter' value='<c:out value="${ pageMaker.cri.filter }"/>'>
	
</form>

<script type="text/javascript">
$(document) .ready(function() {

	remove();
	function remove(){
	$('.content').find($('img')).remove();
	};
	
			history.replaceState({}, null, null);
			var actionForm = $("#actionForm");
			var searchForm = $("#searchForm");
			
	    	$(".paginate_button a").on("click",
					function(e) {

						e.preventDefault();
						actionForm.attr("action",
						"/review/list");
						console.log('click');

						actionForm.find("input[name='pageNum']")
								.val($(this).attr("href"));
						$('input').remove("#no");
						actionForm.submit();
						
					});
			
			$(".move") .on("click", function(e) {
						e.preventDefault();
						$('input').remove("#no");
						actionForm.append("<input type='hidden' id='no' name='no' value='"
								+ $(this).attr("href")+ "'>");
						actionForm.attr("action", "/review/get");
						actionForm.submit();

					});
			$(".newest a").on("click",
					function(e) {

						e.preventDefault();

						console.log('click');
						actionForm.attr("action",
						"/review/list");
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
						"/review/list");
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
			$(".replycnt a").on("click",
					function(e) {

						e.preventDefault();

						console.log('click');
						actionForm.attr("action",
						"/review/list");
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
						"/review/list");
						searchForm.find("input[name='pageNum']")
								.val("1");
						e.preventDefault();
						$('input').remove("#no");
						searchForm.submit();

					});

			
			typeChange();
			function typeChange(){
				$(".content").each(function (index, item){
					var content = $(item).html();
					if(content.length>40){
					content=content.substring(0,40);
					$(item).html(content+"...");
					}
				});
				
			  };
		});
		
		
		
</script>


</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
