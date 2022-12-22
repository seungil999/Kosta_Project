<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="/resources/js/isotope/scripts.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/mate-find.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Yeon+Sung&display=swap" rel="stylesheet">

<%-- <%@include file="../includes/header.jsp"%> --%>    
<head>
<style>

body , #matefind{
	font-family: 'Yeon Sung', cursive;
}

#portfolio{
	margin-top : 150px;
	margin-left: 50px;
}

.search-container{
	margin-top: 50px;
}


</style>

</head>


<body>
<section id="portfolio" class="text-center">
		<ul id="portfolio_menu" class="portfolio_custom_menu">
		<c:choose>
         <c:when test="${active eq 'regular' }">
           <li>
               <button data-filter="*" class="my_btn" onclick="location.href='/matefind/list'">전체보기</button>
           </li>
        
           <li>
               <button  data-filter=".blue, .black, .green" class="my_btn btn_active regularmate" href="1">정기활동</button>
           </li>
           <li>
               <button   data-filter=".red, .green" class="my_btn flashmate" href="0">번개활동</button>
           </li>
         </c:when>
         <c:when test="${active eq 'flash' }">
           <li>
               <button  data-filter="*" class="my_btn" onclick="location.href='/matefind/list'">전체보기</button>
           </li>
        
           <li>
               <button   data-filter=".blue, .black, .green" class="my_btn regularmate" href="1">정기활동</button>
           </li>
           <li>
               <button  data-filter=".red, .green" class="my_btn btn_active flashmate" href="0">번개활동</button>
           </li>
         </c:when>
         <c:when test="${active eq 'all' }">
           <li>
               <button data-filter="*" class="my_btn btn_active" onclick="location.href='/matefind/list'">전체보기</button>
           </li>
        
           <li>
               <button  data-filter=".blue, .black, .green" class="my_btn regularmate" href="1">정기활동</button>
           </li>
           <li>
               <button  data-filter=".red, .green" class="my_btn flashmate" href="0">번개활동</button>
           </li>
         </c:when>
         </c:choose>
       </ul>
 </section>


	<div class="search-container" >
			<form id='searchForm' action="/matefind/list" method='get'>
			<table style="margin:0 auto;">
			<tr>
			<td>
				<select name='type' id='type' class='mate-select' style="margin-left:230px;">
					
					<option value="A" name="option" class="lang-option"
						<c:out value="${pageMaker.cri.type eq 'A'?'selected':''}"/>>활동명</option>
					<option value="M" class="lang-option"
						<c:out value="${pageMaker.cri.type eq 'M'?'selected':''}"/>>지역별</option>
				</select> 
			</td>	
				<td>
				<div class="mate-keyword">
                <input type="text" class="form-control" name="keyword" id="keyword" placeholder="검색어를 입력해주세요"
					value='<c:out value="${pageMaker.cri.keyword}"/>' /></div> <input
					type='hidden' name='pageNum'
					value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
					type='hidden' name='amount'
					value='<c:out value="${pageMaker.cri.amount}"/>' />
					<input type='hidden' name='meeting' value='<c:out value="${ pageMaker.cri.meeting }"/>'>
				</td>
				<td>
				<button class='find' id='matefind' >찾기</button>
				</td>
				</tr>
			</form>
			</table>
	</div> 
	



<section id="blog">

        <div class="container">
		<div class="col-md-12">
	       <ul id='filterstyle'>
			<li class="newest"><a href="newest" style="color:#198754 ;">최신순</a></li>
			<li class="soon"><a href="soon" style="color:#198754 ;">임박순</a></li>
			<li class="like"><a href="like" style="color:#198754 ;">좋아요순</a></li>
		   </ul>
	
                </div>
                
            
            <!--End of row-->
            
	
		               
             <c:forEach items="${list}" var="mate">
                <div class="col-md-3">
                    <div class="blog_news">
                        <div class="single_blog_item" style="margin-bottom:30px;">
                        
                            <div class="blog_img">
                                 <a class='move' href="${mate.mate_no}"><img style="height:200px;" src="/Mate/display?fileName=${mate.image}"/></a>
                            </div>
                            <div class="blog_content">
                               <h2 class="mate-title"><a class='move title' href="${mate.mate_no}">활동명:${mate.activityname }
                                </a><c:if test="${mate.report_count > 0}">
                                	<span class="help-tip"><img class="help-tip" src="/resources/img/caution.png">
                                		<p>신고가 누적된 활동</p>
                                	</span></c:if></h2>
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
                                        <span class="admin">활동장 : ${mate.writer}</span><br>
  											<span class="admin meetingplace">모임장소 : ${mate.meetingplace}</span><br>
  											<span class="admin">활동날짜 : ${mate.meetingdate} (${mate.dayofweek }) / </span>
  											<span class="admin meetingtime">${mate.meetingtime }</span><br>
  											<span class="admin">모임인원 :</span><span class="admin" style="color:orange;">${mate.peoplenum} </span>
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
						<c:if test="${pageMaker.next}">
						<li class="paginate_button next"><a
								href="${pageMaker.startPage +1 }">Next</a>	
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
								$('input').remove("#mate_no");
								actionForm.append("<input type='hidden' id='mate_no' name='no' value='"
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
						}else if(meetingtime==0){
							meetingtime="00:00";
						}else if(meetingtime.length==1 &&meetingtime!=0){
							meetingtime="00:0"+meetingtime;
						}else if(meetingtime.length==2){
							meetingtime="00:"+meetingtime;
						}
						else{
							meetingtime=meetingtime.slice(0,0) +"0"+meetingtime.slice(0,1)+":"+meetingtime.slice(1,4);	
						}
						$(item).html(meetingtime);
					});
					
					$(".content").each(function (index, item){
						var content = $(item).html();
						if(content.length>15){
						content=content.substring(0,15);
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
				/* 	$(".title").each(function (index, item){
						var title = $(item).html();
						console.log(title.length);
						console.log(title);
						if(title.length>=50){
							title=title.substring(0,13);
						$(item).html(title+"...");
						}
					});
					 */
					
				  	
				  	
					
				  };
</script>


</body>

			
<footer>		
	<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</footer>	

