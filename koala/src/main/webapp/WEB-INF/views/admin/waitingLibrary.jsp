<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[Koala] WaitingLib</title>
</head>
<style>
	.tagName{
		width: 80%;
		margin:auto;
		height: 50px;
	}
	.wrap{
		width: 65%;
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
		font-size:15px;
		font-weight:lighter;
	}
	
	.nobinArea *{
		box-sizing: border-box;
		height: 50%;
	}
	.liName, .liCount{
		
		line-height : 56px;
		float : left;
	}
	.nolist{
		width : 100%;
		height: 100%;
		text-align: center;
		font-size : 50px;
		font-weight: bold;
	}
	.tit{
		color: rgb(255, 201,20);
		font-weight:bold;
	}
</style>
<body>
	<%@include file="../common/header.jsp" %>
	<div class="tagName" style="padding-top : 200px;">
		<h1 class="tit">@Waiting Library</h1>
	</div>
	<br><br><br>
		<div class="wrap">
			<c:choose>
			<c:when test="${not empty list }">
				<c:forEach var="i" begin="0" end="${list.size()-1 }" step="2" >
					<div class="twoArea">
						<div class="binArea"></div>
						<div class="nobinArea ic">
							<div id="settingNo" style="display: none">${list.get(i).settingNo }</div>
							<div class="liName ii">&nbsp;${list.get(i).settingTitle }</div>
							<div class="liCount"></div>
							<div class="lidescrip ii">${list.get(i).sortDescription}</div>
						</div>
						<div class="binArea"></div>
						<c:if test="${list.size() > i+1 }">
							<div class="nobinArea ic">
								<div class="liName ii">&nbsp;${list.get(i+1).settingTitle }</div>
								<div class="liCount"></div>
								<div class="lidescrip ii">${list.get(i+1).sortDescription}</div>
							</div>
							<div class="binArea"></div>
						</c:if>
					</div>
					<br>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="nolist" style="display: block">Not Found Issue...!</div>
			</c:otherwise>
			</c:choose>
		</div>
		<br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<script>
		$(function(){
			$(".nobinArea").on("click", function(){
				var title = $(this).children().eq(0).text().trim();
				var no = $("#settingNo").text();
				location.href="listDetail?settingNo="+no;					
			});
		});
	</script>
</body>
</html>