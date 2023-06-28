<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<h2>ㅎㅇ</h2>
	
	<c:if test="${empty slist }">
		<span>조회된 게시글이 없습니다.</span>
	</c:if>
	
	<c:forEach var="s" items="${slist }" varStatus="status">
		<table class="setting-box">
			<input type="hidden" value="${s.settingNo }">
			<tr>
				<th>${s.settingTitle }</th>
			</tr>
			<tr>
				<th>${s.sortDescription }</th>
			</tr>
		</table>
	</c:forEach>
	
	<script>
		$(function(){
			$(".setting-box").on("click", function(){
				console.log($(this).find("input[type=hidden]").val());
				
				var settingNo = $(this).find("input[type=hidden]").val();
				
				location.href="/koala/setting/detail?settingNo="+settingNo;
				
			});
		});
	</script>
</body>
</html>