<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div style="padding-tpp:200px">
		<c:forEach var="test" begin="0" end="${issueDetail.size()-1 }">
			<div style="width: 500px; height: 900px">
				${issueDetail.get(test) }
			</div>
		</c:forEach>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>