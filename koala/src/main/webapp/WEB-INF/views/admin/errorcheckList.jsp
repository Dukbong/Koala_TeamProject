<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[Koala] ErrorCheck</title>
</head>
<style>
	.tagName{
		width: 80%;
		margin:auto;
		height: 50px;
	}
	.wrap{
		width: 80%;
 		height:800px; 
		margin: auto;
		box-sizing: border-box;
	}
	.binArea{
		width: 5%;
	}
	
	.twoArea{
		width: 100%;
		height: 15%;
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
		color: rgb(255, 201,20);
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
	.noIssues{
		width : 100%;
		height: 100%;
		text-align: center;
		font-size : 50px;
		font-weight: bold;
	}
	.tit{
/* 		padding-left: 50px; */
		color: rgb(255, 201,20);
		font-weight: bold;
	}
</style>
<body>
	<%@include file="../common/header.jsp" %>
		<div class="tagName" style="padding-top : 200px;">		
			<h1 class="tit">@ErrorCheck</h1>
		</div>	
		<br><br><br>
		<div class="wrap">
			<c:choose>
			<c:when test="${not empty errorList }">
				<c:forEach var="i" begin="0" end="${errorList.size() }" step="2" >
					<div class="twoArea">
						<c:if test="${errorList.size() >= i+1 }">
						<div class="binArea"></div>
						<div class="nobinArea ic">
							<div class="liName ii">&nbsp;${errorList.get(i).settingTitle }</div>
							<div class="liCount">[ ${errorList.get(i).count} ]</div>
							<div class="lidescrip ii">${errorList.get(i).sortDescription}</div>
						</div>
						</c:if>
						<div class="binArea"></div>
						<c:if test="${errorList.size() > i+1 }">
							<div class="nobinArea ic">
								<div class="liName ii">&nbsp;${errorList.get(i+1).settingTitle }</div>
								<div class="liCount">[ ${errorList.get(i+1).count} ]</div>
								<div class="lidescrip ii">${errorList.get(i+1).sortDescription}</div>
							</div>
							<div class="binArea"></div>
						</c:if>
					</div>
					<br>
				</c:forEach>
			</c:when>
			</c:choose>
		</div>
		<br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<script>
		$(function(){
			$(".nobinArea").on("click", function(){
				var count = ($(this).children().eq(1).text()).split(" ")[1];
				if(count != 0){					
					var settingTitle = $(this).children().eq(0).text().trim();
					location.href = "/koala/admin/errorDetail?settingTitle="+settingTitle+"&page=1";
				}else{
					alert("현재 요청 들어온 에러가 없습니다.")
				}
			})
		})
	</script>
</body>
</html>