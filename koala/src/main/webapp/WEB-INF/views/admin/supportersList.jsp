<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Koala Admin[Supporters]</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
	/* supporters 보여주는 최종 창 */
	#supporterLine{
		width: 80%;
		height: 400px;
		margin:auto;
		background-color: white;
	}
	#supporterLine *{
		box-sizing: border-box;
	}
	#showLine{
		width: 100%;
		height: 80%
	}
	.topLine{
		width: 40%;
		height: 100px;
		/* background-color: green; */
	}
	.supporterone, .supportertwo, .supporterthree, .supporterlast{
		border : 1px solid black;
		width: 100%;
		height: 25%;
	}
	.bin{
		box-sizing: border-box;
		width: 5%;
		height: 25%;
	}
	.supporterone *,.supportertwo *, .supporterthree *, .supporterlast *{
		box-sizing:border-box;
		float: left;
		border: 1px solid black;
	}
 	#supporterLine .bin, #supporterLine .topLine, #supporterLine #middleLine{
		box-sizing: border-box;
		float: left;
	} 
	#middleLine{
		box-sizing: border-box;
		width: 100%;
		height: 10%;
	}
	#pagingArea {width:fit-content; margin:auto;}

	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div class="wrapper" style="background-color: blue;">
	
			<div id="supporterLine">
			<div id="showLine">
				<div id="middleLine"></div>
 					<c:forEach var="support" items="${supporterList}" varStatus="i" >
 					<c:if test="${i.count == 1 || i.count == 2 }">
 					
 					<div class="bin"></div>
 					<div class="topLine">
						<div class="supporterone">
							<div class="left" style="width: 70%; height: 100%">
								2022-11-12~
							</div>
							<div class="right" style="width: 30%; height: 100%">
								<button>Demote</button>
							</div>
						</div>						
						<div class="supportertwo" >
							<div class="left" style="width: 30%; height: 100%">
								ss
							</div>
							<div class="right" style="width: 70%; height: 100%">
								Github_ID : "${support.githubId }"
							</div>
						</div>						
						<div class="supporterthree">
							<div class="num1" style="width: 40%; height: 100%">
								총 게시글 수 : 35
							</div>
							<div class="num2" style="width: 20%; height: 100%">
								
							</div>
							<div class="num3" style="width: 40%; height: 100%">
								최근 7일 : 5
							</div>
						</div>						
						<div class="supporterlast">
							<div class="num1" style="width: 40%; height: 100%">
								총 댓글 수 : 150
							</div>
							<div class="num2" style="width: 20%; height: 100%">
								
							</div>
							<div class="num3" style="width: 40%; height: 100%">
								최근 7일 : 11
							</div>
						</div>
						</div>		
						<div class="bin"></div>	
						</c:if>	
				 	</c:forEach>
			<div id="middleLine"></div>
			
				
					<c:forEach var="support" items="${supporterList}" varStatus="i" >
 					<c:if test="${i.count == 3 || i.count == 4 }">
 					<div class="bin"></div>
 					<div class="topLine">
						<div class="supporterone">
							<div class="left" style="width: 70%; height: 100%">
								2022-11-12~
							</div>
							<div class="right" style="width: 30%; height: 100%">
								<button>Demote</button>
							</div>
						</div>						
						<div class="supportertwo" >
							<div class="left" style="width: 30%; height: 100%">
								ss
							</div>
							<div class="right" style="width: 70%; height: 100%">
								Github_ID : "${support.githubId }"
							</div>
						</div>						
						<div class="supporterthree">
							<div class="num1" style="width: 40%; height: 100%">
								총 게시글 수 : 35
							</div>
							<div class="num2" style="width: 20%; height: 100%">
								
							</div>
							<div class="num3" style="width: 40%; height: 100%">
								최근 7일 : 5
							</div>
						</div>						
						<div class="supporterlast">
							<div class="num1" style="width: 40%; height: 100%">
								총 댓글 수 : 150
							</div>
							<div class="num2" style="width: 20%; height: 100%">
								
							</div>
							<div class="num3" style="width: 40%; height: 100%">
								최근 7일 : 11
							</div>
						</div>
						</div>		
						<div class="bin"></div>	
						</c:if>	
				 	</c:forEach>
				 	<div id="middleLine"></div>
				 	</div>
				 	
				 	
			<div id="pagingArea">
			<div class="btnarea">
                <ul class="pagination">
                <c:choose>
                	<c:when test="${pi.currentPage == 1 }">
                    	<li class="page-item disabled"><a class="page-link" href="#">Prev</a></li>                		
                	</c:when>
                	<c:otherwise>
                    	<li class="page-item"><a class="page-link" href="/koala/admin/supporters.list?currentPage=${pi.currentPage - 1 }">Previous</a></li>                		                	
                	</c:otherwise>
                </c:choose>
                
                <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                    <li class="page-item"><a class="page-link" href="/koala/admin/supporters.list?currentPage=${p }">${p }</a></li>
                </c:forEach>
                
                <c:choose>
                	<c:when test="${pi.currentPage == pi.maxPage }">                		
                    	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                	</c:when>
                	<c:otherwise>                	
                    	<li class="page-item"><a class="page-link" href="/koala/admin/supporters.list?currentPage=${pi.currentPage + 1 }">Next</a></li>
                	</c:otherwise>
                	
                </c:choose>
                </ul>
            </div>

				 	
				 	</div>
			</div>	
			

	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>