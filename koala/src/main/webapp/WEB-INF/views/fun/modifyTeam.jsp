<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.hoju.koala.admin.model.vo.ModifyTeam, java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
.wrap{
	width: 100%;
 	height: 800px;
/* 	height: 925px; */
}
*{
	box-sizing: border-box;
}
.mainText, .text-label{
	color : white;
}
.input-text{
    display: table-cell; 
    width: 50%;
    padding: 8px;
    font-size: 1rem;
    color: white;
    border: none;
    border-bottom: 2px solid white;
    background-color: transparent;
    vertical-align: middle;
    outline: none;
    box-sizing: border-box;
}
.bigDiv{
	width: 100%;
}
.binDiv, #memberDiv{	
	box-sizing:border-box;
	float: left;
}
#memberDiv{
	padding-top:13px;
}

.info{
	width: 100%;
	height: 40px;
	
}
.imgclass, .idclass{
	height : 100%;
	box-sizing:border-box;
	float: left;
}
.idclass{
	width: 90%;
	height: 100%;
/* 	border: 1px solid red; */
	padding-left: 10px;
	padding-top : 5px;
}
.imgclass{
	width: 10%;
	height: 100%;
/*  	border: 1px solid red;  */
}
ul{
 list-style-type: none;
}
ul div{
	font-size: 18px;
}
li{
	padding-top: 5px;
}
.selecter, .memberShow{
	float : left;
}
.ownerArea{
	width: 30%;
	height: 100%;
	float: left;
	box-sizing: border-box;
	position: relative;
/* 	background-color: red; */
}
.ownerName{
	position: absolute;
	right: 0;
	top : 0;
	bottom : 0;
	margin:auto;
}
.ownerimg{
	width:130px;
	height: 130px;
	position: absolute;
	right: 0;
	top : 0;
	bottom : 0;
	margin:auto;
}
.lineArea{
	width: 10%;
/*  	border: 3px solid white; */
  	height: 100%;  
	float:left;
	box-sizing: border-box;
/* 	background-color: pink; */
/* 	margin-top: 350px; */
}
.memberArea{
  	position: relative; 
/*  	float:left; */
/* 	top : 0;C */
/* 	bottom : 0; */
/* 	left : 0; */
/*  	margin:auto; */
 	width : 60%;
 	height: 100%; 
	float: left;
	box-sizing: border-box;
}
.memberShow{
	position: relative;
}
.memberArea{
/* 	position: absolute;
/* 	left:390px;
	top : 0;
/* 	bottom : 2px; */
	margin:auto;
}
</style>
</head>
<body style="background-color: black;">
	<div class="wrap">
	<div class="selecter" style="padding : 50px; width: 50%; height: 100%; border-right: 1px solid white;">
		<h2 class="mainText" style="display:inline;">MODIFY TEAM</h2><button id="create" style="margin-left:550px;text-align:right; inline; background-color: transparent; border: 0; font-size:22px; color:white;"><i class="fa-solid fa-repeat fa-2xl" style="color: #ffffff;"></i></button>
		<br><br><br>
		<div class="input-box">
			<label class="text-label" for="teamName">TEAM NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
			<input id="teamName" name="teamName" class="input-text" type="text" value="${modify.getTeamName() }">
			<br><br><br>
			<label class="text-label" for="teamName">OWNER NAME&nbsp;&nbsp;&nbsp;&nbsp;</label>
			<input id="teamName" name="teamName" class="input-text" type="text" value="${modify.getCreatorId() }" readonly>
			<br><br><br>
			<label class="text-label" for="memberInvite">MEMBER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
			<input id="memberInvite" name="memberInvite" class="input-text" type="text" placeholder="member invite">
			<button type="button" id="addBtn" class="btn btn-info">+</button>
			<br><br>
			<div class="bigDiv">
				<div class="binDiv" style="width:120px; height:50px;"></div>
				<div id="memberDiv" style="display: none; background-color: white; width:50.5%;"></div>			
			</div>
		</div>
	</div>
	<div class="memberShow" style="padding : 50px; width: 50%; height: 100%;">
		<h2 class="mainText" style="display:inline;">CONTRIBUTORS</h2><button id="refer" style="margin-left:550px;text-align:right; inline; background-color: transparent; border: 0; font-size:22px; color:white;"><i class="fa-solid fa-xmark fa-2xl" style="color: #ffffff;"></i></button>
		<br><br>
		<div class="teamInfo" style="width:100%; height: 100%; display:none;">
		
		<div class="ownerArea">
			<c:choose>
			<c:when test="${not empty modify.getGithubId() }">
						<c:choose>
							<c:when test="${not empty modify.getFilePath() }">
								<div class="ownerName" style="width: 130px; height: 190px; text-align: center; margin: auto;">
									<div class="ownerimg"><img style="width: 100%; height: 100%; border: 5px solid green; height: 100%; border-radius: 300px;" src='"${modify.getFilePath()}" + "${modify.getChangeName()}"' alt="s"></div>
									<span style="font-size: 15px; font-weight:bold; color:white;">${modify.getNickName()} <i class="fa-solid fa-feather-pointed fa-bounce" style="color: #2bb106;"></i></span>
								</div>
							</c:when>
							<c:otherwise>
								<div class="ownerName" style="width: 130px; height: 190px; text-align: center; margin: auto;">
									<div class="ownerimg"><img style="width: 100%; height: 100%;  height: 100%; border-radius: 300px;" src='/koala/resources/memberImage/default.jpg' alt="s"></div>
									<span style="font-size: 15px; font-weight:bold; color:white;">${modify.getNickName()} <i class="fa-solid fa-feather-pointed fa-bounce" style="color: #2bb106;"></i></span>
								</div>
							</c:otherwise>
						</c:choose>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${not empty modify.getFilePath() }">
						<div class="ownerName" style="width: 130px; height: 190px; text-align: center; margin: auto;">
							<div class="ownerimg"><img style="width: 100%; height: 100%; border: 5px solid green; height: 100%; border-radius: 300px;" src='"${modify.getFilePath()}" + "${modify.getChangeName()}"' alt="s"></div>
							<span style="font-size: 15px; font-weight:bold; color:white;">${modify.getNickName()} <i class="fa-solid fa-feather-pointed fa-bounce" style="color: #2bb106;"></i></span>
						</div>
					</c:when>
					<c:otherwise>
						<div class="ownerName" style="width: 130px; height: 190px; text-align: center; margin: auto;">
							<div class="ownerimg"><img style="width: 100%; height: 100%; border-radius: 300px;" src='/koala/resources/memberImage/default.jpg' alt="s"></div>
							<span style="font-size: 15px; font-weight:bold; color:white;">${modify.getNickName()} <i class="fa-solid fa-feather-pointed fa-bounce" style="color: #2bb106;"></i></span>
						</div>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
			</c:choose>
			</div>
			<div class="lineArea">
				<div style="height: 50%; width: 100%; position: relative; border-bottom: 3px solid white">
					<div class="topL" style="position: absolute; bottom:0; margin:auto; width:100%; border-right: 3px solid white;" ></div>
				</div>
				<div style="height: 50%; width: 100%; position: relative;">
					<div class="bottomL" style="position: absolute; top:0; margin:auto; width:100%; border-right: 3px solid white;"></div>
				</div>
			</div>
			<div class="memberArea" style="position: relative;">
				<div class="matl" style="position: absolute; top:0; margin:auto; width: 100%; height: 50%;"></div>
				<div class="memberpick" style="width: 100%; height: 0px; position: absolute; top: 0; bottom: 0; margin:auto;">
				</div>
				<div class="mabl" style="position: absolute; bottom:0; margin:auto; width: 100%; height: 50%;"></div>
			</div>
		</div>
	</div>
	</div>
	<script>
		$(function(){
			console.log("${test}");
			
			var checkPoint = [];
			var consendarr = [];			
			consendarr.push("${owner.userNo}");
			checkPoint.push("${owner.userId}");
			$("#memberInvite").on("keyup", function(){
				var text = $("#memberInvite").val();
				if(text || text != ""){
					$.ajax({
						url : "searchMember",
						data : {
							text : text,
						},
						success : function(data){ // 배열로 넘어 온다.
							if(data.length > 0){
								var ele = "<ul>";
								for(var i = 0; i < data.length; i++){
									var filePath = "";
									var changeName = "";
									if(!checkPoint.includes(data[i].userId)){
										if(data[i].profile != null){
											filePath = data[i].profile.filePath;
											changeName = data[i].profile.changeName;
			 								ele += "<li><div class='ttt' style='display:none'>"+ data[i].userId +"</div><div class='info'><div class='imgclass'><img style='width:100%; height:100%;' src='"+ filePath + changeName + "' alt='" + data[i].userId + "'></div><div class='idclass'>" + data[i].userId + "</div></div></li>";
										}else{
											ele += "<li><div class='ttt' style='display:none'>"+ data[i].userId +"</div><div class='info'><div class='imgclass'><img style='width:100%; height:100%;' src='/koala/resources/memberImage/default.jpg' alt='" + data[i].userId + "'></div><div class='idclass'>" + data[i].userId + "</div></div></li>";
										}
									}
								}
								ele += "</ul>";
								$("#memberDiv").html(ele);
								if($("#memberDiv").children().children().length == 0){
									return;
								}else{
									$("#memberDiv").css("display", "block");									
								}
							}else{
								$("#memberDiv").css("display", "none");
							}
						},
						error : function(){
							console.log("error");
						}
					});
				}else{
					$("#memberDiv").css("display", "none");
				}
			});
			$(document).on("click", ".info", function() {
			   var clickId = $(this).eq(0).text();
			  $("#memberInvite").val(clickId);
			  $("#memberInvite").trigger("keyup");
			});
			
			$("#addBtn").on("click", function(){
				if($(".memberpick").children().children().length / 2+1 <= 5){
					if($("#memberInvite").val() == "" || $("#memberDiv").children().children().length != 1){
						return;
					}
					var clickUserId = $("#memberInvite").val();
					$("#memberInvite").val("");
					$("#memberInvite").trigger("keyup");
					var oneLine = ($(".memberpick").children().children().length / 2+1) * 140 / 2 ;
					if($(".memberpick").children().children().length / 2+1 > 1){
						$(".topL").css("height", 70 * ($(".memberpick").children().children().length / 2));
						$(".bottomL").css("height", 70 * ($(".memberpick").children().children().length / 2));
					}
					$(".matl").css("height", "calc(50% - " + oneLine + "px)");
					$(".mabl").css("height", "calc(50% - " + oneLine + "px)");
					$(".memberpick").css("height", oneLine*2);
					$.ajax({
						url : "userInfo",
						data : {
							userId : clickUserId,
						},
						success : function(data){
							// 성공시 필요한 것  : img, nickName, 서포터즈 유무
							checkPoint.push(data.userId);
							consendarr.push(data.userNo);
							var str  = "<div id='"+ data.userid +"' name='"+ data.userNo +"' class='membershow' style='width:300px; height:140px;'>";
								str	+= 		"<div style='width:30%; height:100%; float:left;'>";
								str	+= 			"<div class='test' style='width:100%; height:50%; border-bottom:3px solid white;'></div>";
								str	+= 		"</div>";
								str	+= 		"<div style='width:90px; height:100%; float:left; position:relative;'>";
								str	+= 			"<div style='width:100%; height:100%; position:absolute; margin:auto; text-align: center;'>";
								if(data.profile){
									// 이미지가 있을때
									str	+= "<div style='position:absolute; margin:auto; left:0; top:0; bottom:0; width:90px; height:90px;'><img style='width:100%; height:100%;border-radius: 300px;' src='"+ data.profile.filePath + data.profile.changeName +"' alt='error'></div>";								
								}else{
									// 이미지가 없을때
									str	+= "<div style='position:absolute; margin:auto; left:0; top:0; bottom:0; width:90px; height:90px;'><img style='width:100%; height:100%;border-radius: 300px;' src='/koala/resources/memberImage/default.jpg' alt='error'></div>"
								}
								if(data.githubId && data.githubId != " "){
									// 서포터즈
									str += "<span style='font-size: 15px; font-weight:bold; color:white;'>"+ data.nickName +" <i class='fa-solid fa-feather-pointed fa-bounce' style='color: #2bb106;'></i></span>"								
								}else{
									// 일반 회원
									str += "<span style='font-size: 15px; font-weight:bold; color:white;'>"+ data.nickName +"</span>"
								}
								str	+= 			"</div>";
								str	+= 		"</div>";
								str	+= "</div>";
							$(".memberpick").append(str);
							$(".teamInfo").css("display", "block");
						},
						error : function(){
							console.log("error");
						}
					})
				}else{
					alert("정원이 초과되었습니다.");
				}
			});
			
			$(document).on("click", ".membershow", function() {
				// 클릭해서 인원 뺴기.
				$(this).remove();
				checkPoint = checkPoint.filter((e) => e!== $(this).eq(0).attr("id"));
				console.log($(this).eq(0).attr("name"));
				console.log("제거 전");
				console.log(consendarr);
				consendarr = consendarr.filter((e) => e!== Number($(this).eq(0).attr("name")));
				console.log("제거 후");
				console.log(consendarr);
				if($(".memberpick").children().children().length != 0){
					var oneLine = ($(".memberpick").children().children().length / 2) * 140 / 2 ;
					$(".topL").css("height", 70 * ($(".memberpick").children().children().length / 2-1));
					$(".bottomL").css("height", 70 * ($(".memberpick").children().children().length /2-1));
					$(".matl").css("height", "calc(50% - " + oneLine + "px)");
					$(".mabl").css("height", "calc(50% - " + oneLine + "px)");
					$(".memberpick").css("height", oneLine*2);					
				}else{
					$(".teamInfo").css("display", "none");
					checkPoint.length=1;
					consenderarr.length=1;
				}
			});
			
			// 취소 버튼
			$("#refer").on("click", function(){
				location.href = document.referrer;
			});
			
			// 생성 버튼
			$("#create").on("mouseenter", function(){
				$(this).children().eq(0).addClass("fa-spin");
			}).on("mouseleave", function(){
				$(this).children().eq(0).removeClass("fa-spin");
			}).on("click", function(){
				if(consendarr.length < 2){
					alert("팀원이 1명 이상 있어야 합니다.");
					return;
				}
				if($("#teamName").val() == ""){
					alert("팀명을 지정해주세요.");
					return;
				}
					$.ajax({
						url : "createTeam",
						data : {
							teamName : $("#teamName").val(),
							team : consendarr.toString(),
						},
						success : function(data){
							alert(data);
							if(data > 0){
								location.href = "sqlCloud"								
							}
						},
						error : function(){
							console.log("error");
						}
					});
			});
		});
	</script>
</body>
</html>