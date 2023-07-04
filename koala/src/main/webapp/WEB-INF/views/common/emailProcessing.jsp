<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<script>
	    $(function() {
	        var msg = "${msg}";
	        if (msg) {
	            alert(msg);
	            window.close();
	        }
	    });
	</script>
</body>
</html>