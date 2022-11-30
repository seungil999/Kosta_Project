<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
		src="/resources/js/isotope/scripts.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/mate-find.css" rel="stylesheet">

<%-- <%@include file="../includes/header.jsp"%> --%>    


<section id="portfolio" class="text-center">
		<ul id="portfolio_menu" class="portfolio_custom_menu">
		<c:choose>
         <c:when test="${active eq 'regular' }">
           <li>
               <button data-filter="*" class="my_btn" onclick="location.href='/matefind/list'">전체보기</button>
           </li>
        
           <li>
               <button data-filter=".blue, .black, .green" class="my_btn btn_active regularmate" href="1">정기활동</button>
           </li>
           <li>
               <button data-filter=".red, .green" class="my_btn flashmate" href="0">번개활동</button>
           </li>
         </c:when>
         <c:when test="${active eq 'flash' }">
           <li>
               <button data-filter="*" class="my_btn" onclick="location.href='/matefind/list'">전체보기</button>
           </li>
        
           <li>
               <button data-filter=".blue, .black, .green" class="my_btn regularmate" href="1">정기활동</button>
           </li>
           <li>
               <button data-filter=".red, .green" class="my_btn btn_active flashmate" href="0">번개활동</button>
           </li>
         </c:when>
         <c:when test="${active eq 'all' }">
           <li>
               <button data-filter="*" class="my_btn btn_active" onclick="location.href='/matefind/list'">전체보기</button>
           </li>
        
           <li>
               <button data-filter=".blue, .black, .green" class="my_btn regularmate" href="1">정기활동</button>
           </li>
           <li>
               <button data-filter=".red, .green" class="my_btn flashmate" href="0">번개활동</button>
           </li>
         </c:when>
         </c:choose>
       </ul>
 </section>


	<div class="search-container" >
			<form id='searchForm' action="/matefind/list" method='get'>
				<select name='type' id='type' class='mate-select' style="margin-left:75px;">
					
					<option value="A" name="option" class="lang-option"
						<c:out value="${pageMaker.cri.type eq 'A'?'selected':''}"/>>활동명</option>
					<option value="M" class="lang-option"
						<c:out value="${pageMaker.cri.type eq 'M'?'selected':''}"/>>지역별</option>
				</select> <div class="mate-keyword">
                <input type="text" class="form-control" name="keyword" id="keyword" placeholder="검색어를 입력해주세요"
					value='<c:out value="${pageMaker.cri.keyword}"/>' /></div> <input
					type='hidden' name='pageNum'
					value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
					type='hidden' name='amount'
					value='<c:out value="${pageMaker.cri.amount}"/>' />
				<button class='find' id='matefind'>찾기</button>
			</form>
	</div> 
	
<br><br><hr>	
<section id="blog">

        <div class="container">
		<div class="col-md-12">
	       <ul id='filterstyle'>
			<li class="newest"><a href="newest" style="color:#43a906;">최신순</a></li>
			<li class="soon"><a href="soon" style="color:#43a906;">임박순</a></li>
			<li class="like"><a href="like" style="color:#43a906;">좋아요순</a></li>
		   </ul>
	
                </div>
                
            
            <!--End of row-->
            
	<div class="infinite">
		<div class="list">
		               
             <c:forEach items="${list}" var="mate">
                <div class="col-md-3">
                    <div class="blog_news">
                        <div class="single_blog_item" style="margin-bottom:30px;">
                        
                            <div class="blog_img">
                                 <a class='move' href="${mate.no}"><img style="height:200px;" src="/Mate/display?fileName=${mate.image}"/></a>
                            </div>
                            <div class="blog_content">
                               <h2 class="mate-title"><a class='move' href="${mate.no}">활동명 : ${mate.activityname }</a></h2>
                                <div class="expert">
                                    <div class="left-side text-left">
                                        <p class="left_side">
                                        <span class="admin">
                                         <c:choose>
                   						<c:when test="${mate.regular eq 1 }">
    											<span style="color:#60e44c;">정기활동</span>
								            </c:when>
								            <c:when test="${mate.regular eq 0 }">
								               <span style="color:#ff8a8a;">번개활동</span>
								            </c:when>
										</c:choose></span><br>
                                        <span class="admin">활동장 : ${mate.writer }</span><br>
  											<span class="admin meetingplace">모임장소 : ${mate.meetingplace}</span><br>
  											<span class="admin">활동날짜 : ${mate.meetingdate} (${mate.dayofweek }) / </span>
  											<span class="admin meetingtime">${mate.meetingtime }</span><br>
  											<span class="admin">모임인원 :</span><span class="admin" style="color:orange;">${mate.peoplenum } </span>
  											/<span class="admin">${mate.peoplemaxnum } 명</span><br>                             
                                            <span class="admin">작성일 : ${mate.regdate }</span><br>
                                            <span class="admin">내용 : </span><span class="content">${mate.content }</span>
                                            
                                        </p>
                                        <br><br>
                                        <p class="" style=" float: none; margin 0 auto;">
                                           <span style="float: none; margin-left:62px;"><i class="fa fa-comments-o"></i></span>
                                                <span class="count">${mate.replycnt } </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <i class="fa fa-heart"></i>
                                                 <span class="count">${mate.likecnt }</span>
                                        </p>
                                    </div>
                                </div>
                                <p class="blog_news_content"></p>
                                <a href="" class="blog_link"></a>
                            </div>
                        </div>
                    </div>
                </div>
               </c:forEach>
            </div>
          </div>
		<!-- list end -->  
		</div>
       <!-- infinite end -->
	   </section>
	

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

						<li><a href="/matefind/list?pageNum=2&amount=12&type=&keyword=&meeting=&filter=" class="nextPage" id="">▶</a></li>
						
							<li class="paginate_button next"><a
								href="${pageMaker.startPage +1 }">Next</a></li>
						


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
					
					$(".regularmate").on("click",
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
					$(".flashmate").on("click",
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
					$(".newest a").on("click",
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
				
				typeChange();
				function typeChange(){
					$(".meetingtime").each(function (index, item){
						var meetingtime = $(item).html();
						if(meetingtime.length==4){
						meetingtime=meetingtime.slice(0,2) +":"+meetingtime.slice(2,4);
						}else{
							meetingtime=meetingtime.slice(0,0) +"0"+meetingtime.slice(0,1)+":"+meetingtime.slice(1,4);	
						}
						$(item).html(meetingtime);
					});
					
					$(".content").each(function (index, item){
						var content = $(item).html();
						if(content.length>20){
						content=content.substring(0,20);
						$(item).html(content+"...");
						}
					});
					
					$(".meetingplace").each(function (index, item){
						var meetingplace = $(item).html();
						if(meetingplace.length>20){
							meetingplace=meetingplace.substring(0,20);
						$(item).html(meetingplace+"...");
						}
					});
					
					
				  	
				  	
					
				  };
</script>
<script type="text/javascript">
$(document)
.ready(
		function() {
function YesScroll () {
		
	
	const pagination = document.querySelector('.paginaiton'); // 페이지네이션 정보획득
	const fullContent = document.querySelector('.infinite'); // 전체를 둘러싼 컨텐츠 정보획득
	const screenHeight = screen.height; // 화면 크기
	const nextLink = document.querySelector('.nextPage');
	const nextURL = nextLink.getAttribute('href');

	let oneTime = false; // 일회용 글로벌 변수
	document.addEventListener('scroll',OnScroll,{passive:true}) // 스크롤 이벤트함수정의
	 function OnScroll () { //스크롤 이벤트 함수
	   const fullHeight = fullContent.clientHeight; // infinite 클래스의 높이   
	   const scrollPosition = pageYOffset; // 스크롤 위치
	   if (fullHeight-screenHeight/2 <= scrollPosition && !oneTime) { // 만약 전체높이-화면높이/2가 스크롤포지션보다 작아진다면, 그리고 oneTime 변수가 거짓이라면
	     oneTime = true; // oneTime 변수를 true로 변경해주고,
	     madeBox(); // 컨텐츠를 추가하는 함수를 불러온다.
	   }
	 }
	function madeBox(){ 
	    const xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() { 
		  if (xhr.readyState === xhr.DONE) { 
		    if (xhr.status === 200 || xhr.status === 201) {
		      const data = xhr.response; // 다음페이지의 정보
		      const addList = data.querySelector('.list'); // 다음페이지에서 list아이템을 획득
		      fullContent.appendChild(addList); // infinite에 list를 더해주기
		      oneTime = false; // oneTime을 다시 false로 돌려서 madeBox를 불러올 수 있게 해주기
		    } else {
		      console.error(xhr.response);
		    }
		  }
		};
		xhr.open('GET', nextURL); // 다음페이지의 정보를 get
		xhr.send();
		xhr.responseType = "document";

	 }
	}
	YesScroll();
	
});
</script>			
			
			
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
			

