<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[Koala] Library List</title>
</head>
<style>
	.tagName{
		width: 80%;
		margin:auto;
		height: 50px;
	}
	.wrap{
		width: 80%;
		height:1500px;
		margin: auto;
		box-sizing: border-box;
	}
	.binArea{
		width: 5%;
	}
	
	.twoArea{
		width: 100%;
		height: 8%;
	}
	.nobinArea{
		width: 42.5%;
  		background-color: black; 
  		border-radius : 20px;
	}
	.binArea, .nobinArea{
 		height: 100%;
		float:left;
		box-sizing: border-box;
		padding: 5px 10px;
	}
	.liName{
		width:70%;
		font-size: 25px;
		font-weight: bold;
	}
	.liCount{
		width: 30%;
		font-size: 25px;
		font-weight: bold;
		text-align: right;
		color: red;
	}
	.lidescrip{
		width: 100%;
		height:30%;
		font-size:15px;
		font-weight:lighter;
	}
	
	.nobinArea *{
		box-sizing: border-box;
		height: 50%;
	}
	.liName, .liCount{
		height:70%;
		line-height : 56px;
		float : left;
	}
	.noIssues{
		width : 100%;
		height: 100%;
		text-align: center;
	}
	.tit{
		color: rgb(255, 201,20);
		font-weight:bold;
	}
</style>
<body>
	<%@include file="../common/header.jsp" %>
	<div class="tagName" style="padding-top : 200px;">
		<h1 class="tit">@Library List</h1>
	</div>
	<br><br><br>
		<div class="wrap">
			<c:choose>
			<c:when test="${not empty slist }">
				<c:forEach var="i" begin="0" end="${slist.size()-1 }" step="2" >
					<div class="twoArea">
						<div class="binArea"></div>
						<div class="nobinArea ic">
							<input type="hidden" value="${slist.get(i).settingNo }">
							<div class="liName ii">&nbsp;${slist.get(i).settingTitle }</div>
							<div class="liCount">
							<c:if test="${(not empty loginUser) and (loginUser.type == 2)}">
								<button style="font-size: 15px; width: 60%; height: 60%;" class="btn btn-danger deletelib"  type="button">Delete</button>
							</c:if>
							</div>
							<div class="lidescrip ii">${slist.get(i).sortDescription}</div>
						</div>
						<div class="binArea"></div>
						<c:if test="${slist.size() > i+1 }">
							<div class="nobinArea ic">
								<input type="hidden" value="${slist.get(i).settingNo }">
								<div class="liName ii">&nbsp;${slist.get(i+1).settingTitle }</div>
								<div class="liCount">
								<c:if test="${(not empty loginUser) and (loginUser.type == 2)}">
									<button style="font-size: 15px; width: 60%; height: 60%;" class="btn btn-danger deletelib" type="button">Delete</button>
								</c:if>
								</div>
								<div class="lidescrip ii">${slist.get(i+1).sortDescription}</div>
							</div>
							<div class="binArea"></div>
						</c:if>
					</div>
					<br>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="noIssues" style="display: block; font-size: 50px; font-weight: bold;">Not Found Library...!</div>
			</c:otherwise>
			</c:choose>
		</div>
		<br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	
	<c:if test="${not empty deleteError }">
		<script>
			alert("${deleteError}");
		</script>
		<c:remove var="deleteError" scope="request"/>
	</c:if>
	<script>
		$(function(){
			$(document).on("mouseenter", ".nobinArea", function(){
				$(this).children().css("color", "rgb(255, 201, 20)");
			}).on("mouseleave", ".nobinArea", function(){
				$(this).children().css("color", "white");
			}).on("click", ".nobinArea", function(){
				alert("이동");
			});
			
			$(".deletelib").on("click", function(){
				if(confirm("삭제 하시겠습니끼?")){
					var settingNo = $(this).parent().parent().children().eq(0).val();
					location.href="/koala/setting/delete?settingNo="+settingNo;
					return false; // false로 하여 이벤트가 추가 되는걸 막는다.
				}else{
					return false; // false로 하여 이벤트가 추가 되는걸 막는다.
				}
			});
		});
	</script>
</body>
</html>