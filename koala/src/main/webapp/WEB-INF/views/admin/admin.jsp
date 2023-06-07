<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>Koala Admin[Main]</title>
<style>
	.adminMain{
		margin: auto;
		width: 80%;
		height: 1000px;
		border: 1px solid red;
	}
	.adminMainTop{
		width: 100%;
		height: 20%;
		border: 1px solid red;
		box-sizing: border-box;
	}
	.waitingLibrary, .supportes{
		width: 50%;
		height: 100%;
		border : 1px solid blue;
		box-sizing: border-box;
		float: left;
	}
	.waitingLibraryTitle, .supportesTitle{
		width: 80%;
		height: 100%;
		box-sizing: border-box;
		/* border: 1px solid red; */
	}
	.waitingLibraryValue, .supportesValue{
		width: 20%;
		height: 100%;
		/* border: 1px solid red; */
		box-sizing: border-box;
		font-size: 3rem;
		text-align: center;
		line-height : height;
	}
	.adminMainTop *{
		float:left;
	}
	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="adminMain">
			<div class="adminMainTop">
				<div class="waitingLibrary">
					<div class="waitingLibraryTitle">
						Waiting Library
					</div>
					<div class=waitingLibraryValue>
						12
					</div>
				</div>
				<div class="supportes">
					<div class="supportesTitle">
						Waiting Library
					</div>
					<div class=supportesValue>
						12
					</div>
				</div>
			</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	
	
	<script>
		$(function(){
			var str = "${path}";
			console.log("주소 : "+"${path}");
		})
	</script>
</body>
</html>