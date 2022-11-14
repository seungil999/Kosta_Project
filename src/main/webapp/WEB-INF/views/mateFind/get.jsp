<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var operForm = $("#operForm"); 

  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#no").remove();
    operForm.attr("action","/matefind/list")
    operForm.submit();
    
  });  
});
</script>

<c:choose>
	<c:when test="${mate.regular eq '1'}">
		정기모임
	</c:when>
	<c:otherwise>
		단기모임
	</c:otherwise>
</c:choose>
<br>
	${mate.activityname}<br>
	${mate.writer}
	<div>
	<label>작성일</label><input value='<c:out value="${mate.regdate}"/>' readonly="readonly">
	</div>
	<div>
	<label>업데이트 날짜</label><input value='<c:out value="${mate.updatedate}"/>' readonly="readonly">
	</div>
	
	
		 <div class="form-group">
          <label>이미지</label> <input class="form-control" name='image'
            value='<c:out value="${mate.image}"/>' readonly="readonly">
        </div>

		 <div class="form-group">
          <label>활동명</label> <input class="form-control" name='activityname'
            value='<c:out value="${mate.activityname }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>활동일시</label> <input class="form-control" name='meetingtime'
            value='<c:out value="${mate.meetingtime}(${mate.dayofweek })"/>' readonly="readonly">
        </div>
         <div class="form-group">
          <label>활동시간</label> <input class="form-control" name='time'
            value='<c:out value="${mate.starttime}~${mate.endtime}"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>모임인원</label>
          <textarea class="form-control" rows="3" name='peoplenum'
            readonly="readonly"><c:out value="${mate.peoplenum}명 / ${mate.peoplemaxnum}명"/></textarea>
        </div>
        <button type="button">참여하기</button>
		<button data-oper='list' class="btn btn-info">목록</button>
		<div class="form-group">
          <label>활동장소</label> <input class="form-control" name='startzone'
            value='<c:out value="${mate.startzone }"/>' readonly="readonly">
           					   <input class="form-control" name='endzone'
            value='<c:out value="${mate.endzone }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>안내사항</label> <input class="form-control" name='content'
            value='<c:out value="${mate.content }"/>' readonly="readonly">
        </div>
        <div>
        현재 모임 참여중인 인원(${mate.peoplenum })
        </div>
        ${cri.pageNum }
        
    <form id='operForm' action="/mate/modify" method="get">
	  <input type='hidden' id='no' name='no' value='<c:out value="${mate.no}"/>'>
	  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
	  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
  	  <input type='hidden' name='meeting' value='<c:out value="${cri.meeting }"/>'>
      <input type='hidden' name='filter' value='<c:out value="${cri.filter }"/>'>
	</form>
        
        
