<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[Koala] ErrorCHeck</title>
</head>
<style>
	.outLine{
		margin:auto;
		width: 80%;
		height: 800px;
		background-color: 
	}
</style>
<body>
	<%@include file="../common/header.jsp" %>
	<div class="outLine">
		<h1>여긴 오류 페이지꺼 축약해서 가져올꺼임 </h1>
		<h1>한번 생각 좀 해봅시다 색깔 구분하는거..................ㅋ</h1>
		<div class="test" style="width:50%; font-size: 18px">
			hihihihi;
		</div>
		<div class="test" style="width:50%; font-size: 18px">
			hihihihi;
		</div>

		<c:if test="${errorList.size() == 0 }">
		
		</c:if>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	<script>
		$(function(){
			$(".test").on("click", function(){
				$(this).append("<br><input type='text' style='color:red; border:none; background-color:black'>")
			})
		})
	</script>
</body>
</html>