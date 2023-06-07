<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[koala]Block Ip List</title>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
	.cmd{
		margin:auto;
		width: 80%;
		height: 500px;
		padding:5px; 
	}
	.iplist{
		width: 100%;
		height: 80%;
	}
	.inputarea{
		width: 100%;
		height: 50px;
		box-sizing: border-box;
	}
	.inarea{
		width: 80%;
		height: 100%;
		box-sizing: border-box;
	}
	.btnarea{
		width: 20%;
		height: 100%;
		box-sizing: border-box;
	}
	.inputarea *{
		float: left;
	}
	.listShow{
		width: 100%;
		height: 60%;
	}
	.discr{
		width: 100%;
		height: 20%;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="wrap">
		<div class="cmd">
			<div class="iplist">
				<div class="listShow">				
					<c:forEach var="ipPack" items="${blackList }" varStatus="i">
						<span>${i.count }. ip : ${ipPack.ip } | count : ${ipPack.count } | status : ${ipPack.status }</span><br>
					</c:forEach>
				</div>
				<div class="discr">
					<span># command : No.[clear(int num) | action]</span><br>
					<span>@num(5>= num >= 0)</span><br>
					<span># move : prev | next</span>				
				</div>
				<hr>
				<div class="inputarea">
					<div class="inarea">
						<input name="command" type="text" placeholder="Please enter the command." style="width: 100%; height: 100%; border:none; background-color: rgb(30, 30, 30); color:white">
					</div>
					<div class="btnarea">
						<button class="btn btn-dark" type="button" id="cmdbtn" style="width:100%; height: 100%">Enter</button>				
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		$(function(){
			$("#cmdbtn").on("click", function(){
				var command = $("input[name=command]").val().toLowerCase();
				// 페이징 처리
				if(command == "next"){
					<c:choose>
                    	<c:when test="${pi.currentPage == pi.maxPage }">
                        	alert("마지막 리스트 입니다.")
                    	</c:when>
                    	<c:otherwise>
                    		location.href="/koala/admin/blockip.list?currentPage=${pi.currentPage + 1 }";
                    	</c:otherwise>
                	</c:choose>
				}
				if(command == "prev"){
					<c:choose>
                    	<c:when test="${pi.currentPage == 1 }">
                        	alert("지금이 처음 페이지 입니다.");
                    	</c:when>
                    	<c:otherwise>
                        	location.href="/koala/admin/blockip.list?currentPage=${pi.currentPage - 1 }";
                    	</c:otherwise>
                	</c:choose>
				}
				
			})
		})
	</script>
</body>
</html>