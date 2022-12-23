<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<style type="text/css">
	li {list-style: none; display:inline; padding: 6px; }
	
	li a{
	color:white;
	font-size: 15px;
	}
</style>

<br>
<ul>
	<!-- <li><button type="button" class="btn btn-sm btn-success" onClick="location.href='/board/list'">목록</button></li> -->
	<c:if test="${userVO ne null }">
	<li><button type="button" class="btn btn-sm btn-success" onClick="location.href='/board/writeView'">글 작성</button></li>
	</c:if>	
</ul>

