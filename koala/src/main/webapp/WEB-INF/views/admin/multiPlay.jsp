<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[Koala] Multi Quiz</title>
</head>
<body>
	<%@include file="../common/header.jsp" %>
	<div id="testShow" style="margin:auto; width: 80%; height: 200px; color:white;">
		
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		$(function(){
			// 웰컴 메시지 뿌리기
				var playComment = "Welcome to GitHub! Let's begin the adventure";
				var showComment = playComment.split("");
				var str = "";
				var showCount = 0;
				var it = setInterval(function(){
				  if(showCount < showComment.length){
					  str += showComment[showCount];
					  showCount++;
					  if(showComment[showCount-1] == "!"){						  
				      	str += "<br>";
					  }
				      $("#testShow").html(str);
				  }else{
				    clearInterval(it);
				    str += "<br><button> 입장 하기 </button>";
				    $("#testShow").html(str);
				  }
				}, 40);
		});
	</script>
</body>
</html>