<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
.toolbar {
	width: 80%;
	height: 50px;
	margin: auto;
}

.topName {
	width: 13%;
	height: 100%;
	box-sizing: border-box;
	background-color: black;
	border-top: 1px solid rgb(248, 185, 147);
	border-top-width: 5px;
	float: left;
}

.topimg {
	width: 50%;
	height: 100%;
	box-sizing: border-box;
	float: left;
}

.soname {
	width: 50%;
	height: 100%;
	box-sizing: border-box;
	float: left;
	padding-right: 20px;
}

.topbinarea {
	width: 51%;
	height: 100%;
	box-sizing: border-box;
	float: left;
	font-size: 20px;
	padding-top: 13px;
}

.savearea, .loadarea {
	width: 13%;
	height: 100%;
	box-sizing: border-box;
	float: left;
	text-align: center;
	padding-top: 5px;
	font-weight: bold;
	font-size: 22px;
}

.loadarea, .downarea {
	padding-left: 25px;
}

.lastbin {
	width: 10%;
	height: 100%;
	box-sizing: border-box;
	float: left;
	text-align: center;
	padding-top: 5px;
	font-weight: bold;
	font-size: 22px;
}

.togeSql {
	width: 80%;
	height: 800px;
	margin: auto;
}

.sqlArea {
	width: 100%;
	height: 100%;
	box-sizing: border-box;
	float: left;
	margin:auto;
}

#testnum {
	width: 4%;
	height: 100%;
	box-sizing: border-box;
	float: left;
}

.middlebin {
	width: 1%;
	height: 100%;
	box-sizing: border-box;
	float: left;
}

#textare {
	width: 95%;
	height: 100%;
	box-sizing: border-box;
	float: left;
	outline: none;
}

span {
	color: red;
}

.userInarea {
	width: 100%;
	height: 5%;
	text-align: center;
	padding-top: 10px;
	box-sizing: border-box;
	background-color: rgb(50, 50, 50);
}

#testnumin {
	-ms-overflow-style: none;
	scrollbar-width: none;
	background-color: gray;
}

#testnumin::-webkit-scrollbar {
	display: none;
}
.teamOne{
	width:8%;
	height:20px;
	float:left;
}
.mlbanbinarea{
	width: 4.25%;
	height: 80px;
	float: left;
	margin-top:20px;
}
.mlarea{
	width: 22%;
	height: 80px;
	float: left;
	margin-top:20px;
}
.mlinfo, mlsup{
	width: 100%;
	height: 50%;
	box-sizing: border-box;
}
.mlmain{
	width: 40%;
	height: 100%;
	float: left;
	text-align: right;
	box-sizing: border-box;
}
.concheck{
	width:20%;
	height:100%;
	float:left;
	text-align: center;
	box-sizing: border-box;
}
.mlemail{
	width: 70%;
	height: 100%;
	float:left;
	box-sizing: border-box;
	padding-top:8px; 
	font-size:15px;
}
.mlgrant{
	width: 30%;
	height: 100%;
	float: left;
	box-sizing: border-box;
 	text-align:right;
}

</style>
</head>
<!-- 
	06.26 : 접속자 표시 및 통신 완료
	06.27 : sql문 표시 및 통신, DB저장 및 불러오기
-->
		<script>
			var socket;
			var teamNo;
			
			function sendEnter(teamNo, type){
				var text = {
						type : type,
						teamNo : "${teamNo}",
						userId : "${loginUser.userId}"
				}
				socket.send(JSON.stringify(text));
			}
			
			function connect() {
				if (!socket) {
					socket = new WebSocket("ws://localhost:8888/koala/sqlcloud");
				}
				socket.onopen = function (e) {
					sendEnter(teamNo, "Enter")
					alert("Connect Success");
				}
				socket.onclose = function () {
					
					alert("disconnnect Success");
				}
				socket.onmessage = function (e) {
					if(e.data.includes("SEND:")){
						// 메시지 전송을위한 경우
						$("#testarea").val(e.data.replace("SEND:",""));
						var test = $("#testarea").val().split("\n");
						var str = "";
						if (test.length > 0) {
							for (var i = 1; i <= test.length; i++) {
								str += i + " \n";
							}
							$("#testnumin").val(str);
						}
					}else{
						if(e.data.includes("MSG:")){
							var idAndMsg = e.data.split("MSG:");
							// 글이 이미 작성 된 이후 접속
							var idArr = idAndMsg[0].substring(1,idAndMsg[0].length-1).split(",");
							$(".mlid").each(function(){ // 접속 시
								if(idArr.includes($(this).text())){
									$(this).parent().children().eq(1).children().eq(0).css("color", "green");
								}else{
									$(this).parent().children().eq(1).children().eq(0).css("color", "#d9d9d9");
								}
								$("#testarea").val(idAndMsg[1]);
								var test = idAndMsg[1].split("\n");
								var str = "";
								if (test.length > 0) {
									for (var i = 1; i <= test.length; i++) {
										str += i + " \n";
									}
									$("#testnumin").val(str);
								}
							});						
						}else if(e.data.includes("SAVE:")){
							var modifyDate = e.data.split("SAVE:");
							$(".topbinarea").html("&nbsp;&nbsp;&nbsp;&nbsp;Last Save : "+modifyDate);
						}else{
							// 접속
							var idArr = e.data.substring(1,e.data.length-1).split(",");
							$(".mlid").each(function(){ // 접속 시
								if(idArr.includes($(this).text())){
									$(this).parent().children().eq(1).children().eq(0).css("color", "green");
								}else{
									$(this).parent().children().eq(1).children().eq(0).css("color", "#d9d9d9");
								}
							});						
						}
					}
				}
			}
			function disconnect() {
				sendEnter(teamNo, "Out");
				socket.close();
				$(".mlid").each(function(){ // 접속 종료시
					$(this).parent().children().eq(1).children().eq(0).css("color", "#d9d9d9");
				});
				// 종료시 창 비우기.
				$("#testarea").val("");
				$("#testnumin").val("");
			}
			
			$(function(){
				
				$(".teamButton").on("click", function(){
					teamNo = $(this).parent().children().eq(2).val();
					location.href="sqlCloud?teamNo="+teamNo;
				});
				
				$("#conbtn").on("click", function(){
					connect();
				});
				
				
				$("#disconbtn").on("click", function(){
					disconnect();
					socket = "";
				});
				
				// Scroll 동기화
				$("#testarea").scroll(function() {
					$("#testnumin").scrollTop($("#testarea").scrollTop());
					$("#testnumin").scrollLeft($("#testarea").scrollLeft());
				});
				$("#testnumin").scroll(function() {
					$("#testarea").scrollTop($("#testnumin").scrollTop());
					$("#testarea").scrollLeft($("#testnumin").scrollLeft());
				});
				
				// Download (.sql 확장자로 다운로드)
				$("#downBtn").on("click", function() {
					var text = document.getElementById('testarea').value;
					var fileBlob = new Blob([ text ], {
						type : 'text/plain'
					});

					var a = document.createElement('a');
					a.href = URL.createObjectURL(fileBlob);
					a.download = 'koalaSQL.sql';
					a.click();
				});
				
				// Save (DB에 저장할 내용)
				$("#sss").on("click", function() {
					console.log($("testarea").val());
					$.ajax({
						url : "sqlSave",
						data : {
							teamNo : "${teamNo}",
							sqlContent : $("#testarea").val()
						},
						type : "POST",
						success : function(data){
							console.log(data);
							if(data > 0){
								alert("저장되었습니다.");
								var text = {
										type : "SAVE",
										teamNo : "${teamNo}"
								}
								socket.send(JSON.stringify(text)); // 구분하기 위해
							}
						},
						error : function(){
							console.log(error);
						}
					})
				});
				
				// 팀 만들기
				$("#createTeam").on("click", function(){
					location.href="ShowcreateTeam";
				});
				
				// 팀원 초대하기
				$("#teamInvite").on("click", function(){
					console.log("teamInvite");
				});
				
				// 입력 (접속시 입력창 생성)
				$("#testarea").on("keyup", function() { // 보강 필요
						var test = $(this).val().split("\n");
						var str = "";
						if (test.length > 0) {
							for (var i = 1; i <= test.length; i++) {
								str += i + " \n";
							}
							$("#testnumin").val(str);
						}
						
						var testing = $("#testarea").val().split("\n");
						var testingStr = "";
						for (var i = 0; i < testing.length; i++) {
							testingStr += testing[i];
						}
						
						var text = {
								type : "SEND",
								teamNo : "${teamNo}",
								userId : "${loginUser.userId}",
								msg : $(this).val()
						}
						socket.send(JSON.stringify(text)); // 구분하기 위해
				});
			});
		</script>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<br>
		<div class="ii " style="width:80%; margin:auto; font-size: 22px; font-weight:bold; padding-bottom:8px; text-align: center">
		TEAM
		<button id="createTeam" class="ii" type="button" 
				style="background-color: transparent; border: 0;"><i class="fa-solid fa-circle-plus fa-lg ii ic" style="color: #ffffff;"></i></button>
	</div>
	<hr style="width: 80%; margin:auto; background-color: red;  height:5px; border: 0px;">
	<div id="teamList" class="ii" style="width:80%; margin:auto; font-size: 22px; font-weight:bold; padding-bottom:8px; text-align: center">
	<br>
		<c:choose>
			<c:when test="${not empty teamList }">
				<c:forEach var="t" begin="0" end="${teamList.size()-1 }">
					<c:choose>
					<c:when test="${teamNo == teamList.get(t).getTeamNo() }">
						<div class="teamOne" style="color:red">
							<button type="button" class="teamButton">${teamList.get(t).getTeamName().substring(0,1) }</button><br>
							<input type="hidden" value="${teamList.get(t).getTeamNo() }">
							${teamList.get(t).getTeamName() }
						</div>
					</c:when>
					<c:otherwise>
						<div class="ii teamOne">
							<button type="button" class="teamButton">${teamList.get(t).getTeamName().substring(0,1) }</button><br>
							<input type="hidden" value="${teamList.get(t).getTeamNo() }">
							${teamList.get(t).getTeamName() }
						</div>
					</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<h1>Not Found Team...!</h1>
			</c:otherwise>
		</c:choose>
	</div>
	<br><br>
	<c:choose>
	<c:when test="${not empty memberList }">
	<div id="tttest" class="ii " style="width:80%; margin:auto; font-size: 22px; font-weight:bold; padding-bottom:8px; text-align: center">
		TEAM MEMBER
		<button id="teamInvite" class="ii" type="button" 
				style="background-color: transparent; border: 0;"><i class="fa-solid fa-circle-plus fa-lg ii ic" style="color: #ffffff;"></i></button>
	</div>
	<hr style="width: 80%; margin:auto; background-color: red;  height:5px; border: 0px;">
	<div id="memberList" class="ii" style="width:80%; margin:auto; font-size: 22px; font-weight:bold; padding-bottom:8px; text-align: center">
		<br>
		<c:forEach var="m" begin="0" end="${memberList.size() - 1 }">
			<c:choose>
			<c:when test="${m % 3 == 0 }">
				<div class="mlbanbinarea"></div>
				<div class="mlbanbinarea"></div>
				<div class="mlarea">
					<div class="mlinfo">
						<div class="mlid mlmain">${memberList.get(m).getUserId() }</div>
						<div class="concheck"><i class="fa-solid fa-circle fa-2xs pingCheck" style="color: #d9d9d9;"></i></div>
						<div class="mlmain">${memberList.get(m).getNickName() }</div>					
					</div>
					<div class="mlsup">
						<div class="mlemail">${memberList.get(m).getEmail() }</div>
						<c:if test="${creatorNo == memberList.get(m).getUserNo() }">
							<div class="mlgrant" style="color:green;">Creator</div>					
						</c:if>
						<c:if test="${creatorNo != memberList.get(m).getUserNo() }">
							<div class="mlgrant">User</div>					
						</c:if>
					</div>
				</div>
				<div class="mlbanbinarea"></div>
			</c:when>
			<c:when test="${m % 3 == 2 }">
					<div class="mlbanbinarea"></div>
					<div class="mlarea">
					<div class="mlinfo">
						<div class="mlid mlmain">${memberList.get(m).getUserId() }</div>
						<div class="concheck"><i class="fa-solid fa-circle fa-2xs pingCheck" style="color: #d9d9d9;"></i></div>
						<div class="mlmain">${memberList.get(m).getNickName() }</div>					
					</div>
					<div class="mlsup">
						<div class="mlemail">${memberList.get(m).getEmail() }</div>
						<c:if test="${creatorNo == memberList.get(m).getUserNo() }">
							<div class="mlgrant" style="color:green;">creator</div>					
						</c:if>
						<c:if test="${creatorNo != memberList.get(m).getUserNo() }">
							<div class="mlgrant">user</div>					
						</c:if>
					</div>
				</div>
				<div class="mlbanbinarea"></div>
				<div class="mlbanbinarea"></div>
			</c:when>
			<c:otherwise>
				<div class="mlbanbinarea"></div>
				<div class="mlarea">
					<div class="mlinfo">
						<div class="mlid mlmain">${memberList.get(m).getUserId() }</div>
						<div class="concheck"><i class="fa-solid fa-circle fa-2xs pingCheck" style="color: #d9d9d9;"></i></div>
						<div class="mlmain" >${memberList.get(m).getNickName() }</div>					
					</div>
					<div class="mlsup">
						<div class="mlemail">${memberList.get(m).getEmail() }</div>
						<c:if test="${creatorNo == memberList.get(m).getUserNo() }">
							<div class="mlgrant" style="color:green">creator</div>				
						</c:if>
						<c:if test="${creatorNo != memberList.get(m).getUserNo() }">
							<div class="mlgrant">user</div>					
						</c:if>
					</div>
				</div>
				<div class="mlbanbinarea"></div>
			</c:otherwise>
			</c:choose>
		</c:forEach>
		<hr style="width: 100%; margin:auto; background-color: red;  height:5px; border: 0px;">
		<br>
	<div style="width: 80%; height: 50px; margin:0 auto; padding-top: 5px;">
		<button id="conbtn" class="btn btn-success" type="button" style="font-size: 22px;">open</button>
		<button id="disconbtn" class="btn btn-danger" type="button" style="font-size: 22px;">close</button>
	</div>
	</div>
	</c:when>
	<c:otherwise>
		<div>
			&nbsp;&nbsp;&nbsp;
		</div>
	</c:otherwise>
	</c:choose>
	
		<div class="toolbar">
		<div class="topName">
			<div class="topimg ic" style="text-align: center; padding-top: 10px;">
				<i class="fa-solid fa-database fa-2xl"></i>
			</div>
			<div class="soname ic ii"
				style="text-align: center; padding-top: 5px; font-weight: bold; font-size: 23px;">SQL</div>
		</div>
		<div class="topbinarea">&nbsp;&nbsp;&nbsp;&nbsp;Last Save : ${sqlInfo.getModifyDate() }</div>
<!-- 		<div class="downarea"> -->
<!-- 		</div> -->
		<div class="lastbin"></div>
		<div class="loadarea">
			<i class="fa-solid fa-file-arrow-down fa-2xl ii ic"
				style="color: #ffffff;"></i>
			<button class="ii" type="button" id="downBtn"
				style="background-color: transparent; border: 0; text-decoration: underline; text-decoration-thickness: 5px; text-decoration-color: rgb(40, 151, 223);">Download</button>
		</div>
		<div class="savearea">
			<i class="fa-solid fa-floppy-disk fa-2xl ii ic"
				style="color: #ffffff;"></i>
			<c:choose>
			<c:when test="${not empty loginUser }">
				<button class="ii" type="button" id="sss"
					style="background-color: transparent; border: 0; text-decoration: underline; text-decoration-thickness: 5px; text-decoration-color: rgb(40, 151, 223);">SaveFile</button>
			</c:when>
			<c:otherwise>
				<button class="ii" type="button" 
					style="background-color: transparent; border: 0; text-decoration: underline; text-decoration-thickness: 5px; text-decoration-color: rgb(40, 151, 223); disabled">SaveFile</button>			
			</c:otherwise>
			</c:choose>
		</div>
		
	</div>
	<div class="togeSql">
		<div class="sqlArea">
			<div id="testnum" style="text-align: right; font-size: 22px;">
				<!-- 줄 번호 -->
				<textarea class="ic ii" id="testnumin"
					style="width: 100%; height: 100%; text-align: right; box-sizing: border-box; border: none; border-right: 1px solid gray; resize: none;"
					disabled></textarea>
			</div>
			<!-- sql 입력창 -->
			<div class="middlebin ic ii" style="background-color: black"></div>
			<div id="textare">
				<textarea class="ic ii" id="testarea" class="testarea"
					style="width: 100%; height: 100%; font-size: 22px; resize: none; outline: none; border: none;"></textarea>
			</div>
		</div>
	</div>
	<br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>