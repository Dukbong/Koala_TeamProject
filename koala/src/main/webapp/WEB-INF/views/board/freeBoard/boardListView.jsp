<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
	<%@include file="../../common/header.jsp" %>
	<div class="bulletin-outer" align="center">
		<h1 align="center">BULLETIN_BOARD</h1>
		<div id="search-area">
			<form action="search" method="get">
				<!-- <input type="hidden" name="currentPage" value="1"> -->
				<select name="types">
					<option value="writer">작성자</option>
					<option value="content">내용</option>
					<option value="title">제목</option>
				</select>
				<input type="text" name="keyword" value="${keyword }">
				<button type="submit">검색</button>
			</form>
			<c:if test="${not empty loginUser }">
				<button  onclick="location.href='enroll?boardNo=${b.boardNo}'">글작성</button>
			</c:if>
		</div>
		<br>
		<c:if test="${not empty status }">
			<script>
				$(function(){
					$("#search-area").each(function(){
						if($(this).val()=='${status}'){
							$(this).attr("selected",true);
						}
					})
				});
			</script>
		</c:if>
		<table id="list-area">
			<thead>
				<tr>
					<th>글번호</th>
					<th width="400">제목</th>
					<th>코드</th>
					<th>첨부파일</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="b" items="${bbList }">
					<tr onclick="location.href='detail?boardNo=${b.boardNo}'">
						<td>${b.boardNo }</td>
						<td>${b.title }</td>
						<c:choose>
							<c:when test="${not empty b.contentCode }">
								<td><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>code-tags</title><path d="M14.6,16.6L19.2,12L14.6,7.4L16,6L22,12L16,18L14.6,16.6M9.4,16.6L4.8,12L9.4,7.4L8,6L2,12L8,18L9.4,16.6Z" /></svg></td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${not empty b.fileNo }">
								<td><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>file-document-outline</title><path d="M6,2A2,2 0 0,0 4,4V20A2,2 0 0,0 6,22H18A2,2 0 0,0 20,20V8L14,2H6M6,4H13V9H18V20H6V4M8,12V14H16V12H8M8,16V18H13V16H8Z" /></svg></td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
						<td>${b.boardWriter }</td>
						<td>${b.count }</td>
						<td>${b.createDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<div id="paging-area">
			<a href="list.bo?currentPage=${pi.currentPage-1 }">이전</a>
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }" step="1">
				<c:choose>
					<c:when test="${empty types }">
						<a href="list.bo?currentPage=${p }">${p }</a>
					</c:when>
					<c:otherwise>
						<a href="koala/bulletinBoard/search?currentPage=${p }&status=${types}&keyword=${keyword}">${p }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<a href="list.bo?currentPage=${pi.currentPage+1 }">다음</a>
		</div>
		<br><br>
	</div>
	<jsp:include page="../../common/footer.jsp"/>
</body>
</html>