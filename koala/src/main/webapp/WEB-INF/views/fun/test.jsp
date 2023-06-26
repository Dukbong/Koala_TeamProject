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
	width: 38%;
	height: 100%;
	box-sizing: border-box;
	float: left;
	font-size: 20px;
	padding-top: 13px;
}

.savearea, .loadarea, .downarea {
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
	height: 1000px;
	margin: auto;
}

.sqlArea {
	width: 90%;
	height: 100%;
	box-sizing: border-box;
	float: left;
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

span {
	color: red;
}

.userIn {
	width: 100%;
	height: 85%;
	background-color: rgb(50, 50, 50);
	box-sizing: border-box;
}

.btnsarea {
	width: 100%;
	height: 10%;
	background-color: rgb(50, 50, 50);
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
	width: 50%;
	height: 100%;
	float: left;
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
 
	text-align:center;
}

</style>
</head>
		<script>
			var socket;
			var teamNo;
			
			function connect() {
				if (!socket) {
					console.log("재시작");
					socket = new WebSocket("ws://localhost:8888/koala/sqlcloud");
				}
				socket.onopen = function (e) {
					console.log("Connect Success");
				}
				socket.onclose = function () {
					console.log("disconnnect Success");
				}
				socket.onmessage = function (e) { 

				}
			}
			function disconnect() {
				socket.close();
			}
			
			$(function(){
				$(".teamButton").on("click", function(){
					teamNo = $(this).parent().children().eq(2).val(); // 팀번호 부여
					location.href="sqlCloud?teamNo="+teamNo;
				});
				
			});
			$("#conbtn").on("click", function(){
				connect();
				socket.send("Enter:" + teamNo + "/${loginUser.userId}");
			});
			
			
			
		</script>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<br>
<!-- 		<button type="button" id="d">send</button> -->
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
			</c:when>
			<c:when test="${m % 3 == 2 }">
					<div class="mlbanbinarea"></div>
					<div class="mlarea">
					<div class="mlinfo">
						<div class="mlid mlmain">${memberList.get(m).getUserId() }</div>
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
		<hr style="width: 80%; margin:auto; background-color: red;  height:5px; border: 0px;">
	<div style="width: 80%; height: 50px; margin:0 auto; padding-top: 5px;">
		<button id="conbtn" class="btn btn-success" type="button">Connect</button>
	</div>
	</div>
	<br><br><br><br>
	</c:when>
	<c:otherwise>
		<div>
			&nbsp;&nbsp;&nbsp;
		</div>
	</c:otherwise>
	</c:choose>
	<br><br><br><br><br><br><br>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>