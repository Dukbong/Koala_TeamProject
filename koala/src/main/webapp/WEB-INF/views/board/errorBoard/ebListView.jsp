<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../../common/header.jsp"%>
	<%-- 	<jsp:include page="../../common/header.jsp"/> --%>
	<div style="margin: auto; width: 80%; height: 500px;">
		에러게시판 리스트
		<table>
			<c:forEach var="eb" items="${ebList}">
				<tr>
					<td>${eb.boardNo }</td>
				</tr>
			</c:forEach>
		</table>

	</div>

	<jsp:include page="../../common/footer.jsp" />
</body>
</html>