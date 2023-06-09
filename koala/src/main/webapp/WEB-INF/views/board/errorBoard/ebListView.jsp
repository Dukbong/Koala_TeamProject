<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="" rel="stylesheet" type="text/css"> <!-- 어떻게 가져오지 -->
</head>
<style>
	.ebList{
		margin: auto;
		width: 80%;
		height: 500px;
	}

</style>
<body>

	<%@include file="../../common/header.jsp"%>
	<div class="ebList">
	
	
		에러게시판 리스트
		
		<button><a href="enrollForm">글쓰기</a></button>
		
		<table>
			<thead>
				<tr>
					<th>글번호</th>
					<th>라이브러리</th>
					<th>제목</th>
					<th>작성자</th>
					<th>해결여부</th>
					<th>작성일</th>
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
	<%@include file="../../common/footer.jsp"%>
</body>
</html>