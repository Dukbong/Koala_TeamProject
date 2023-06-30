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
		height: 700px;
		padding: 50px 0px;
/* 		border: 1px solid red; */
	}
	.adminMainTop{
		width: 100%;
		height: 40%;
/*  		border: 1px solid red;  */
		box-sizing: border-box;
	}
	.adminMainbuttom{
	margin:auto;
		width: 100%;
		height: 60%;
/*  		border: 1px solid red;  */
		box-sizing: border-box;	
	}

	.dint{
		width: 5.5%;
		height: 100%;
/*  		background-color: red;  */
	}
	.din{
		width: 5%;
		height: 100%;
/*  		background-color: red;  */
	}
	.waitingLibrary, .supporters{
		width: 40%;
		height: 100%;
/* 		border : 1px solid blue; */
	}
	.adminMainTop *, .adminMainbuttom * {
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
	.errorcheck, .issuearea, .member{
		width: 23%;
		height: 100%;
/* 		border: 1px solid red; */
	}
	.errorStr, .issueStr, .memberStr{
		width: 33%;
		height: 100%;
/* 		border: 1px solid blue; */
		font-size: 35px;
/* 		font-size: 3rem; */
		font-weight: bold;
		text-align:center;
		padding-top: 120px;
	}
	.errorCount, .issueCount, .memberCount{
		width: 33%;
		height: 100%;
		color:#ffc90f;
		box-sizing: border-box;
		font-weight: bold;
		font-size: 3rem;
		padding-top: 110px;
		text-align:center;
	}
	.errorImg, .issueImg, .memberImg{
		width: 34%;
		height: 100%;
		display: flex;
		justify-content: center;
		
	}
	
</style>
</head>
<body >
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="adminMain" style="padding-top : 200px;"> 
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
				<div class="supporters">
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
			
			<div class="adminMainbuttom ii">
			<div class="dint"></div>
				<div class="errorcheck">
					<div class="errorImg">
						<i class="fa-solid fa-bug fa-7x ii" style="color: #ffffff;"></i>					
					</div>
					<div class="errorStr">
						&nbsp;&nbsp;Error
					</div>
					<div class="errorCount">
						${allCount.errorBoard }
					</div>
				</div>
				<div class="din"></div>
				<div class="din"></div>
				<div class="issuearea">
					<div class="issueImg">
						<i class="fa-solid fa-triangle-exclamation fa-7x ii" style="color: #ffffff;"></i>
					</div>
					<div class="issueStr">
						&nbsp;&nbsp;Issue
					</div>
					<div class="issueCount">
						${allCount.issue }
					</div>
				</div>
				<div class="din"></div>
				<div class="din"></div>
				<div class="member">
					<div class="memberImg">
						<i class="fa-solid fa-users fa-6x ii" style="color: #ffffff;"></i>
					</div>
					<div class="memberStr">
						&nbsp;&nbsp;User
					</div>
					<div class="memberCount">
						${allCount.member }
					</div>
				</div>
				<div class="dint"></div>
			</div>
		
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
	$(function(){
		
		clickAndView(".waitingLibrary");
		clickAndView(".supporters");
		clickAndView(".errorcheck");
		clickAndView(".issuearea");
		clickAndView(".member");
		
		function clickAndView(str){
			let made = $("" + str).on("click", function(){
				location.href="/koala/admin/" + str.substring(1) + ".list";
			}).on("mouseenter", function(){
				$(this).css("cursor", "pointer");
			});
			return made;
		}
	});
	</script>
</body>
</html>