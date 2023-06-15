<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>

<c:if test="${not empty client }">
	<script>
		$.ajax({
			url : "http://github.com/login/oauth/access_token",
			data : {
				client_id : "${client.clientId}",
				client_secret : "${client.clientSecret}",
				code : "${client.code}"
			},
			type:"POST",
			success : function(data){
				console.log(data);
			},
			error : function(){
				console.log("error");
			}
		})
	</script>
</c:if>
</body>
</html>