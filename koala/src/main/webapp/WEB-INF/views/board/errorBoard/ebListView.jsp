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
		<table border="1px">
			<thead>
				<tr>
					<th>글번호</th>
					<th>종류</th>
					<th>제목</th>
					<th>닉네임</th> <!-- 닉네임으로 바꾸기 -->
					<th>해결여부</th>
					<th>작성날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="eb" items="${ebList}">
					<tr>
						<td>${eb.board.boardNo }</td>
						<td>${eb.createSetting.settingTitle }</td>
						<td>${eb.board.title }</td>
						<td>${eb.board.boardWriter }</td>
						<td>${eb.errorBoard.solved }</td>
						<td>${eb.board.createDate }</td>
						<td>${eb.board.count }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>

	<jsp:include page="../../common/footer.jsp" />
</body>
</html>