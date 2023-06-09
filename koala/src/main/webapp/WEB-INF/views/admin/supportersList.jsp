<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                #supporterLine {
                    width: 80%;
                    height: 600px;
                    margin: auto;
/*                     background-color: white; */
                }

                #supporterLine * {
                    box-sizing: border-box;
                }

                #showLine {
                    width: 100%;
                    height: 80%
                }

                .topLine {
                    width: 40%;
                    height: 140px;
                    padding : 20px;
                    border-radius: 30px;
                    /* background-color: green; */
                }

                .supporterone,
                .supportertwo,
                .supporterthree,
                .supporterlast {
/*                     border: 1px solid black; */
                    width: 100%;
                    height: 25%;
                }

                .bin {
                    box-sizing: border-box;
                    width: 5%;
                    height: 25%;
                }

                .supporterone *,
                .supportertwo *,
                .supporterthree *,
                .supporterlast * {
                    box-sizing: border-box;
                    float: left;
/*                     border: 1px solid black; */
                }
                .topLine{
                	background-color: black;
                }

                #supporterLine .bin,
                #supporterLine .topLine,
                #supporterLine #middleLine {
                    box-sizing: border-box;
                    float: left;
                }

                #middleLine {
                    box-sizing: border-box;
                    width: 100%;
                    height: 10%;
                }

                #pagingArea {
                    width: fit-content;
                    margin: auto;
                }
                
                .supportertwo a{
                	text-decoration: none;
        			color: White;
                }
                .binsupport{
                	text-align: center;
                	font-size: 3rem;
                	font-weight: bold;
                	width: 100%;
                	height: 500px;
                	line-height: 500px;
                }
             
/*                 .supporterone .right, .supportertwo .left, .supportertwo .right{ */
/*                 	text-align: center; */
/*                 } */
            </style>
        </head>
        <!-- 드래그 우클릭  복사 등등 방지 -->
        <body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
            <jsp:include page="/WEB-INF/views/common/header.jsp" />
            <div class="wrapper">
            <c:if test="${supporterList.size()!= 0 }">
                <div id="supporterLine">
                    <div id="showLine">
                        <div id="middleLine"></div>
                        <c:forEach var="support" items="${supporterList}" varStatus="i">
                            <c:if test="${i.count == 1 || i.count == 2 }">

                                <div class="bin"></div>
                                <div class="topLine">
                                    <div class="supporterone">
                                        <div class="left" style="width: 70%; height: 100%">
                                            ${support.createDate }~
                                        </div>
                                        <div class="right" style="width: 30%; height: 100%; padding-left: 60px">
                                            <button class = "btn btn-danger demote" name="${support.userNo }">Demote</button>
                                        </div>
                                    </div>
                                    <div class="supportertwo">
                                        <div class="left" style="width: 99%; height: 100%; font-size: 18px; font-weight: bold;">
                                        	<!-- 주소만 연결 -->
                                            <a class="ii" href="#">${support.userId }</a> 
                                            <a class="ii" href="https://github.com/${support.githubId }" target='_blank'>&nbsp;&nbsp; / &nbsp;&nbsp;Github_ID : ${support.githubId }</a>
                                        </div>
                                        <div class="right" style="width: 1%; height: 100%; font-size: 18px; font-weight: bold; text-align: right;">
                                            
                                        </div>
                                    </div>
                                    <div class="supporterthree">
                                        <div class="num1" style="width: 50%; height: 100%">
                                          	<p>Email : ${(support.email).substring(0,((support.email).indexOf("@")))}</p>  
                                          	<p style="color:rgb(40, 151, 223);">&nbsp;[${(support.email).substring((support.email).indexOf("@")+1, (support.email).indexOf("@")+2).toUpperCase()}]</p>
                                        </div>
                                        <div class="num2" style="width: 10%; height: 100%">
                                            <!-- 빈 공간 -->
                                        </div>
                                        <div class="num3" style="width: 40%; height: 100%">
                                            Point : ${support.point }
                                        </div>
                                    </div>
                                    <div class="supporterlast">
                                        <div class="num1" style="width: 50%; height: 100%">
                                        	Level : ${support.userLevel }
                                        </div>
                                        <div class="num2" style="width: 10%; height: 100%">
                                            <!-- 빈 공간 -->
                                        </div>
                                        <div class="num3" style="width: 40%; height: 100%">
                                            NickName : ${support.nickName }
                                        </div>
                                    </div>
                                </div>
                                <div class="bin"></div>
                            </c:if>
                        </c:forEach>
                        <div id="middleLine"></div>

                        <c:forEach var="support" items="${supporterList}" varStatus="i">
                            <c:if test="${i.count == 3 || i.count == 4 }">
                                <div class="bin"></div>
                                <div class="topLine">
                                    <div class="supporterone">
                                        <div class="left" style="width: 70%; height: 100%">
                                            ${support.createDate }~
                                        </div>
                                        <div class="right" style="width: 30%; height: 100%; padding-left: 60px">
                                            <button class = "btn btn-danger demote" name="${support.userNo }">Demote</button>
                                        </div>
                                    </div>
                                    <div class="supportertwo">
                                        <div class="left" style="width: 99%; height: 100%; font-size: 18px; font-weight: bold;">
                                            <a href="#">${support.userId }</a> 
                                            <a href="https://github.com/${support.githubId }" target='_blank'>&nbsp;&nbsp; / &nbsp;&nbsp;Github_ID : ${support.githubId }</a>
                                        </div>
                                        <div class="right" style="width: 1%; height: 100%; font-size: 18px; font-weight: bold; text-align: right;">
                                            
                                        </div>
                                    </div>
                                    <div class="supporterthree">
                                        <div class="num1" style="width: 50%; height: 100%">
                                          	<p>Email : ${(support.email).substring(0,((support.email).indexOf("@")))}</p>  
                                          	<p style="color:rgb(40, 151, 223);">&nbsp;[${(support.email).substring((support.email).indexOf("@")+1, (support.email).indexOf("@")+2).toUpperCase()}]</p>
                                        </div>
                                        <div class="num2" style="width: 10%; height: 100%">
                                            <!-- 빈 공간 -->
                                        </div>
                                        <div class="num3" style="width: 40%; height: 100%">
                                            Point : ${support.point }
                                        </div>
                                    </div>
                                    <div class="supporterlast">
                                        <div class="num1" style="width: 50%; height: 100%">
                                        	Level : ${support.userLevel }
                                        </div>
                                        <div class="num2" style="width: 10%; height: 100%">
                                            <!-- 빈 공간 -->
                                        </div>
                                        <div class="num3" style="width: 40%; height: 100%">
                                            NickName : ${support.nickName }
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
                                        <li class="page-item"><a class="page-link"
                                                href="/koala/admin/supporters.list?currentPage=${pi.currentPage - 1 }">Prev</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>

                                <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                                    <li class="page-item"><a class="page-link"
                                            href="/koala/admin/supporters.list?currentPage=${p }">${p }</a></li>
                                </c:forEach>

                                <c:choose>
                                    <c:when test="${pi.currentPage == pi.maxPage }">
                                        <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item"><a class="page-link"
                                                href="/koala/admin/supporters.list?currentPage=${pi.currentPage + 1 }">Next</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                                
                            </ul>
                        </div>
                    </div>
                </div>
                </c:if>
                <c:if test="${supporterList.size()== 0 }">
                	<div class="binsupport">
                		현재 서포터즈 인원이 없습니다.
                	</div>
                </c:if>
            </div>
            <jsp:include page="/WEB-INF/views/common/footer.jsp" />
            <script>            
	            $(function(){
	            	$("body").bind("onseletstart", function(){
	            		return fasle;
	            	})
	            	
	            	$(".demote").click(function(){
	            		var userId = $(this).parent().parent().parent().children(".supportertwo").children(".left").children("a")[0].innerText
	            		$.ajax({
	            			url : "supporters.demote",
	            			data : {
	            				userId : userId,
	            			},
	            			success : function(data){
	            				alert(userId + "님의 등급이 강등되었습니다.");
	            				location.href = "/koala/admin/supporters.list"
	            			},
	            			error : function(){
	            				console.log("dmote button ajax error");
	            			}
	            		})
	            	})
	            })
            </script>
        </body>
        </html>