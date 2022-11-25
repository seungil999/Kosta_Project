<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
		src="/resources/js/isotope/scripts.js"></script>

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


<div>
		

			<form id='searchForm' action="/matefind/list" method='get'>
				<select name='type' id='type' class='mate-select'>
					
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
	

	

<section id="blog">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="latest_blog text-left">
                    <c:choose>
	                    <c:when test="${active eq 'all' }">
	                        <h2>전체활동</h2>
	                    </c:when>
	                    <c:when test="${active eq 'regular' }">
	                        <h2>정기활동</h2>
	                    </c:when>
	                    <c:when test="${active eq 'flash' }">
	                        <h2>번개활동</h2>
	                    </c:when>
                    </c:choose>
                    </div>
                     <ul id='filterstyle'>
	<li class="newest"><a href="newest" style="color:#43a906;">최신순</a></li>
	<li class="soon"><a href="soon" style="color:#43a906;">임박순</a></li>
	<li class="like"><a href="like" style="color:#43a906;">좋아요순</a></li>
	</ul>
                </div>
                
            </div>
            <!--End of row-->
            
               
            <div class="row">
             <c:forEach items="${list}" var="mate">
                <div class="col-md-4">
                    <div class="blog_news">
                        <div class="single_blog_item">
                        
                            <div class="blog_img">
                                 <a class='move' href="${mate.no}"><img style="width:360px; height:300px;" src="/Mate/display?fileName=${mate.image}"/></a>
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
  											<span class="admin">모임장소 : ${mate.meetingplace}</span><br>
  											<span class="admin">활동날짜 : ${mate.meetingdate} (${mate.dayofweek }) / </span>
  											<span class="admin meetingtime">${mate.meetingtime }</span><br>
  											<span class="admin">모임인원 :</span><span class="admin" style="color:orange;">${mate.peoplenum } </span>
  											/<span class="admin">${mate.peoplemaxnum } 명</span><br>                             
                                            <span class="admin">작성일 : ${mate.regdate }</span><br>
                                            <span class="admin">내용 : </span><span class="content">${mate.content }</span>
                                            
                                        </p>
                                        <br><br>
                                        <p class="right_side text-right">
                                           <span class="right_msg text-right"><i class="fa fa-comments-o"></i></span>
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
            
            <!--End of row-->
        </div>
        <!--End of container-->
        
    </section>



<div class="panel-body">

				<div style="text-align: center";>
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
					
					
					
				  	
				  	
					
				  };
</script>
			
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
			