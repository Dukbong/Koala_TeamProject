<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%@include file="../../common/header.jsp" %>
    <form action="updateboard" method="POST" enctype="multipart/form-data">
    	<input id="browse" name="upfiles" type="file" multiple="multiple" />
    	<button type="submit">제출</button>
    </form>
    <jsp:include page="../../common/footer.jsp"/>
</body>
</html>