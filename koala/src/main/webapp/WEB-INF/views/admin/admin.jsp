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
		height: 500px;
/* 		border: 1px solid red; */
	}
	.adminMainTop{
		width: 100%;
		height: 40%;
/* 		border: 1px solid red; */
		box-sizing: border-box;
	}
	.din{
		width: 5%;
		height: 100%;
/* 		background-color: red; */
	}
	.waitingLibrary, .supportes{
		width: 40%;
		height: 100%;
/* 		border : 1px solid blue; */
	}
	.adminMainTop * {
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
		box-sizing: border-box;
		font-size: 3rem;
		text-align: center;
/* 		line-height : height; */
		padding-top: 50px;
/* 		background-color: brown; */
		font-weight: bold;
		color:#ffc90f;
	}
	.adminMainTop *{
		float:left;
	}
	.libImg, .supImg{
		width: 30%;
		height: 100%;
/*  		background-color: red;  */
		
		display: flex;
		justify-content: center;
	}
	.ii{
		margin:auto;
/* 		width: 100%; */
		display: block;
	}
	.libStr, .supStr{
		width: 70%;
		height: 100%;
/* 		border: 1px solid; */
	}
	.mainStr{
		width: 100%;
		height: 50%;
		font-size: 35px;
		font-weight: bold;
		padding-top: 50px;
	}
	.subStr{
		width: 100%;
		height: 50%;
		font-size: 20px;
		padding-top:10px;
	}
	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="adminMain">
			<div class="adminMainTop">
				<div class="din"></div>
				<div class="waitingLibrary">
					<div class="waitingLibraryTitle">
						<div class="libImg">
							<i class="fa-solid fa-arrow-rotate-right fa-7x ii" style="color: #ffffff;"></i>
						</div>
						<div class="libStr">
							<div class=mainStr>Waiting Settings</div>
							<div class=subStr>Made in Supporters...</div>
						</div>
					</div>
					<div class=waitingLibraryValue>
						${allCount.createSetting }
					</div>
				</div>
				<div class="din"></div>
				<div class="din"></div>
				<div class="supportes">
					<div class="supportesTitle">
						<div class="supImg">
							<i class="fa-solid fa-people-group fa-7x ii" style="color: #ffffff;"></i>
						</div>
						<div class="supStr">
							<div class=mainStr>&nbsp;Supporters</div>
							<div class=subStr>&nbsp;&nbsp;&nbsp;We are Team...</div>
						</div>
					</div>
					<div class=supportesValue>
						${allCount.supporters }
					</div>
				</div>
				<div class="din"></div>
			</div>
			<hr>
			error issues user 꺼 만들고  네모신경쓰기
		
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
	$(function(){
		$(".waitingLibrary").on("click", function(){
			// Settings jsp 파일로 이동
			location.href="";
		}).on("mouseenter", function(){
			$(this).css("cursor","pointer");
		});
		
		$(".supportes").on("click", ()=>{
			location.href = "/koala/admin/supporters.list";
		}).on("mouseenter", function(){
			$(this).css("cursor","pointer");
		});
	})
	</script>
</body>
</html>