<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#content{
		width: 80%;
		height: 500px;
		margin: auto;
	}
</style>
<body>
	<jsp:include page="header.jsp" />
	<div id="content">
	
		<h1>에러가 났네요,, ㅠ ㅠ</h1>
	
	 	
		에러 메세지 : ${errorMsg }<br>
		
		${url }를 호출하는 가정에서 에러가 발생
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
