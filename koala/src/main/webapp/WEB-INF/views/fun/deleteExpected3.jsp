<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
			integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
			crossorigin="anonymous" referrerpolicy="no-referrer" />
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	</head>
	<style>
		.toolbar{
			width:80%;
			height: 50px;
			margin: auto;
		}
		.topName{
			width: 13%;
			height: 100%;
			box-sizing: border-box;
 			background-color: black;
 			border-top : 1px solid rgb(248, 185, 147);
 			border-top-width : 5px;
			float:left;
		}
		.topimg{
			width:50%;
			height: 100%;
			box-sizing: border-box;
			float:left;
		}
		.soname{
			width: 50%;
			height: 100%;
			box-sizing: border-box;
			float:left;
			padding-right: 20px;
		}
		
/* 			<div class="topimg"></div> */
/* 				<div class="soname"></div> */
		.topbinarea{
			width: 38%;
			height: 100%;
			box-sizing: border-box;
/* 			background-color: blue; */
			float:left;
		}
		.savearea,.loadarea, .downarea{
			width: 13%;
			height: 100%;
			box-sizing: border-box;
/* 			background-color: pink; */
			float:left;
			text-align: center;
			padding-top:5px;
			font-weight: bold;
			font-size : 22px;
		}
		.loadarea, .downarea{
			padding-left: 25px;
		}
		
		.lastbin{
			width: 10%;
			height: 100%;
			box-sizing: border-box;
/* 			background-color: red; */
			float:left;
			text-align: center;
			padding-top:5px;
			font-weight: bold;
			font-size : 22px;
			
		}
/* 					<div class="topName"></div> */
/* 			<div class="topbinarea"></div> */
/* 			<div class="savearea"></div> */
		.togeSql {
			width: 80%;
			height: 1000px;
			margin: auto;
		}

		.sqlArea {
			width: 90%;
			height: 100%;
			box-sizing: border-box;
			float: left;
		}
		#testnum{
			width: 4%;
			height: 100%;
			box-sizing: border-box;
			float:left;
		}
		.middlebin{
			width: 1%;
			height: 100%;
			box-sizing: border-box;
			float:left;
		}
		#textare{
			width: 95%;
			height: 100%;
			box-sizing: border-box;
			float: left;
/* 			border: none; */
			outline: none; 
		}

		.userConarea {
			width: 10%;
			height: 100%;
			box-sizing: border-box;
			float: left;
		}

		.CodeMirror {
			width: 100%;
			height: 100%;
			box-sizing: border-box;
		}
		span{
			color : red;
		}
		.userIn{
			width: 100%;
			height: 85%;
			background-color: rgb(50, 50, 50);
			box-sizing: border-box;
		}
		.btnsarea{
			width: 100%;
			height: 10%;
			background-color: rgb(50, 50, 50);
		}
		.userInarea {
			width: 100%;
			height: 5%;
			text-align:center;
			padding-top:10px;
			box-sizing: border-box;
			background-color: rgb(50, 50, 50);
		}
		
		#testnumin {
    		-ms-overflow-style: none; /* IE and Edge */
    		scrollbar-width: none; /* Firefox */
    		background-color: gray;
		}
		#testnumin::-webkit-scrollbar {
    		display: none; /* Chrome, Safari, Opera*/
		}
	</style>

	<body>
	
		
<!-- 

		해당 jsp >> text area로 만들기 >> 완벽하게 다 된다.
 -->
	
		<script>
			
		
		
		
			
			/*
				목표
				1. 입장시 : 방을 만든다 / 방을 찾는다.
					1-1. 방을 찾을 경우 만든 방이름을 정확히 알아야한다.
					1-2. 
			*/
			var socket;
// 			var context = "";
			function connect() {
				if (!socket) {
					socket = new WebSocket("ws://localhost:8888/koala/ssss");
				}
				socket.onopen = function () {
// 					console.log(context);
					console.log("Connect Success");
				}
				socket.onclose = function () {
					console.log("disconnnect Success");
					$("#testnumin").val("1 ");
					$(".userInarea").html("현재 접속자<br>")
					$("#testarea").val(" >> 접속이 종료되었습니다.");
// 					var test = $("#testarea").val().split("\n");
// 					var test = $("#testarea").html().replace("</div>","").split("<div>");
// 					var str = "";
// 					if(test.length > 0){
// 						for(var i = 1; i <= test.length; i++){
// 							str += i + "&nbsp;&nbsp;<br>";
// 							str += i + " \n";
// 						}
// 							$("#testnumin").html(str);
// 					}
				}
				socket.onmessage = function (e) {
					// 조건을 걸어서 회원정보라면 접속자에 넣어주고 아니라면 Textarea에 넣어준다.
					// 비회원은 들어오지 못하게 interceptor로 지정한다.
					var str = e.data;
// 					console.log("onmessage >> "+str);
					if(str.includes("###")){
						// 회원 정보
						var user = "현재 접속자<br>";
						var userPack = ((e.data).replace("###","")).split("///"); // 0번째는 회원 1번째는 현재까지 작성된 문자
						var userInfo = userPack[0].split(",");
						for(var u in userInfo){
// 							user += userInfo[u] + "<br>";
							user += userInfo[u] + "\n";
						}
						$(".userInarea").html(user);
						if(userPack[1] != "null"){							
							$("#testarea").val(userPack[1]); // 접속 직전의 정보를 토대로 뿌려준다.
// 							$("#testarea").html(userPack[1]); // 접속 직전의 정보를 토대로 뿌려준다.
							
							var test = $("#testarea").val().split("\n");
// 							var test = $("#testarea").html().replace("</div>","").split("<div>");
							var str = "";
							if(test.length > 0){
								for(var i = 1; i <= test.length; i++){
// 									str += i + "&nbsp;&nbsp;<br>";
									str += i + " \n";
								}
// 									$("#testnum").html(str);
									$("#testnumin").val(str);
							}
						}
					}
// 					else if(str.includes("***"){
// 						var user = "현재 접속자<br>";
// 						var userPack = ((e.data).replace("###","")).split("///"); // 0번째는 회원 1번째는 현재까지 작성된 문자
// 						var userInfo = userPack[0].split(",");
// 						for(var u in userInfo){
// 							user += userInfo[u] + "<br>";
// 						}
// 						$(".userInarea").html(user);
// 					}
					else{
						// sql 내용
						$("#testarea").val(e.data);
// 						$("#testarea").html(e.data);
						var test = $("#testarea").val().split("\n");
// 						var test = $("#testarea").html().split("\n");
						var str = "";
						if(test.length > 0){
							for(var i = 1; i <= test.length; i++){
// 								str += i + "&nbsp;&nbsp;<br>";
								str += i + " \n";
							}
// 								$("#testnum").html(str);
								$("#testnumin").val(str);
						}
					}
				}
			}
			function disconnect() {
				try {
					socket.close();
					socket = ""; 
				} catch (e) {
				}
			}
			
			$(function(){
				$("#testarea").on("keyup", function(){
// 					console.log("this.text >> "+$(this).text());
					
					if(!socket){
						$(this).val("");
// 						$(this).html("");
						alert("접속 하지 않았습니다.");
					}else{						
						var test = $(this).val().split("\n");
// 						var test = $(this).html().replace("</div>","").split("<div>");
// 						console.log("tset > " + test);
						var str = "";
						if(test.length > 0){
							for(var i = 1; i <= test.length; i++){
// 								str += i + "&nbsp;&nbsp;<br>";
								str += i + " \n";
							}
// 								$("#testnum").html(str);
								$("#testnumin").val(str);
						}
						var testing = $("#testarea").val().split("\n");
// 						var testing = $("#testarea").html().replace("</div>","").split("<div>");
// 						console.log(testing);
// 						var testing = $("#testarea").html().replace("</div>","").split("<div>");
						var testingStr = "";
						for(var i = 0; i < testing.length; i++){
							if(i+1 != testing.length){	
// 								var oneLine = testing[i].split(" ");
// 								if(oneLine.includes("select")){
// 									for(var j = 0; j < oneLine.length; j++){
// 										if(oneLine[j] == "select"){
// // 											testingStr += "<span style='color:red;'>"+oneLine[j]+"<span>"
// 											testing[i].replace("select", "<span style='color:red;'>"+oneLine[j]+"<span>");
// 										}
// 									}									
// 								}			

// 								if(testing[i] == "<br>"){
// 									testingStr += "<br>";
// 								}else{									
// 									testingStr += testing[i]+"<br>";
// // 									console.log("이거 되는게 맞나? ")
// 								}
								
							}else{
								testingStr += testing[i];
							}
						}
// 						console.log("keyUp >> " + testingStr);
// 						$(".pasteTest").html(testingStr);
						socket.send($(this).val());
// 						socket.send(testingStr);
					}
				});	
				
				
				
				$("#testarea").scroll(function () {
				    $("#testnumin").scrollTop($("#testarea").scrollTop());
				    $("#testnumin").scrollLeft($("#testarea").scrollLeft());
				});
				$("#testnumin").scroll(function () {
				    $("#testarea").scrollTop($("#testnumin").scrollTop());
				    $("#testarea").scrollLeft($("#testnumin").scrollLeft());
				});
				

				
				$("#ttt").on("click", function(){
				        var text = document.getElementById('testarea').value;
				        var fileBlob = new Blob([text], { type: 'text/plain' });

				        var a = document.createElement('a');
				        a.href = URL.createObjectURL(fileBlob);
				        a.download = 'koalaSQL.sql';
				        a.click();
				})
				
				$("#sss")
				 
				
				
			})

		</script>
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<br>
		<div class="toolbar">
			<div class="topName">
				<div class="topimg ic" style="text-align: center; padding-top: 10px;">
					<i class="fa-solid fa-database fa-2xl"></i>
				</div>
				<div class="soname ic ii" style="text-align: center; padding-top: 5px; font-weight: bold; font-size:23px;">SQL</div>
			</div>
			<div class="topbinarea"></div>
			<div class="downarea">
				<i class="fa-solid fa-file-arrow-down fa-2xl ii ic" style="color: #ffffff;"></i>
				<button class="ii ic" type="button" id="ttt" style="background-color: transparent;  border: 0; text-decoration: underline; text-decoration-thickness:5px;text-decoration-color: rgb(40, 151, 223);">Download</button>
			</div>
			<div class="loadarea">
				<i class="fa-solid fa-file-arrow-down fa-2xl ii ic" style="color: #ffffff;"></i>
				<button class="ii ic" type="button" id="ttt" style="background-color: transparent;  border: 0; text-decoration: underline; text-decoration-thickness:5px;text-decoration-color: rgb(40, 151, 223);">LoadFile</button>
			</div>
			<div class="savearea">
				<i class="fa-solid fa-floppy-disk fa-2xl ii ic" style="color: #ffffff;"></i>
				<button class="ii ic" type="button" id="sss" style="background-color: transparent;  border: 0; text-decoration: underline; text-decoration-thickness:5px;text-decoration-color: rgb(40, 151, 223);">SaveFile</button>
			</div>
			<div class="lastbin">
				
			</div>
		</div>
<!-- 		<div contenteditable='true'>내용</div> -->
<!-- 		<div class="pasteTest">내용</div> -->
		<div class="togeSql">
			<div class="sqlArea">
				<div  id="testnum" style="text-align: right;font-size: 22px;">
					<textarea class="ic ii" id="testnumin" style="width:100%; height: 100%; text-align: right; box-sizing: border-box; border:none; border-right: 1px solid gray;" disabled></textarea>
				</div>
				<div class="middlebin ic ii" style="background-color: black"></div>
				<div id="textare">
<!-- 					<div contenteditable='true' id="testarea" class="ic ii" style="width: 100%; height: 100%; font-size: 22px;"> -->
<!-- 						내용 -->
<!-- 					</div> -->
					
					<textarea class="ic ii" id="testarea" class="testarea"
 						style="width: 100%; height: 100%; font-size: 22px; resize: none; outline:none; border:none;"></textarea>
				</div>
			</div>
			<div class="userConarea">
				<div class="btnsarea ii ic">
					<button type="button" onclick="connect();" class="btn btn-success"
						style="width: 100%; height: 45%;">접속</button>
					<br>
					<div style="height: 10%; width: 100%;"></div>
					<button type="button" onclick="disconnect();" class="btn btn-danger"
						style="width: 100%; height: 45%;">종료</button>
				</div>
				<div class="userInarea ii ic">
					현재 접속자
				</div>
				<div class="userIn ii ic">
					
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</body>

	</html>