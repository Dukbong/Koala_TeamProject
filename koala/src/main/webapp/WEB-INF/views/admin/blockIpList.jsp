<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>[koala]Block Ip List</title>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
            <style>
                #supporterLine {
                    width: 80%;
                    height: 800px;
                    margin: auto;
                }

                #supporterLine * {
                    box-sizing: border-box;
                }

                #showLine {
                    width: 100%;
                    height: 80%
                }

                .topLine {
                    width: 24%;
                    height: 140px;
                    padding: 25px;
                    border-radius: 30px;
                }

                .supporterone,
                .supportertwo,
                
                .supporterlast {
                    width: 100%;
                    height: 25%;
                }

                .bin {
                    box-sizing: border-box;
                    width: 4.5%;
                    height: 25%;
                }

                .supporterone *,
                .supportertwo *,
                .supporterthree *,
                .supporterlast * {
                    box-sizing: border-box;
                    float: left;
                }

                .topLine {
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
            </style>
        </head>

        <body>
            <jsp:include page="/WEB-INF/views/common/header.jsp" />
            <div class="wrap">
                <div id="supporterLine">
                    <div id="showLine">
                        <div id="middleLine"></div>
                        <c:forEach begin="0" end="${blackList.size() }" step="1" var="i">
                            <c:if test="${blackList[i] != null }">
                           <!--  <div class="bin"></div> -->
                                <div class="bin"></div>
                                <div class="topLine">
                                    <div class="supporterone">
                                        <div class="left"
                                            style="width: 70%; height: 100%; font-size: 18px; font-weight: bold;">
                                            ${blackList[i].ip }
                                        </div>
                                        <div class="right" style="width: 30%; height: 100%; padding-right: 50px;">
                                            
                                             	<c:choose>
                                                	<c:when test="${blackList[i].status == 'Y' }">
                                            			<button class="btn btn-danger action" disabled name="action" style="width: 100px">action</button><br><br>                                                	
                                                	</c:when>
                                                	<c:otherwise>                                                		
                                            			<button class="btn btn-danger action" name="action" style="width: 100px">action</button><br><br>                                                  	
                                                	</c:otherwise>
                                                </c:choose>
                                                
                                                <c:choose>
                                                	<c:when test="${blackList[i].status == 'N' }">
                                            			<button class="btn btn-primary clear" name="clear" style="width: 100px; margin:auto;" disabled>clear</button>                                                	
                                                	</c:when>
                                                	<c:otherwise>                                                		
                                            			<button class="btn btn-primary clear" name="clear" style="width: 100px; margin:auto;">clear</button>                                                	
                                                	</c:otherwise>
                                                </c:choose>
                                        </div>
                                    </div>
                                    <div class="supportertwo">
                                        <div class="left"
                                            style="width: 99%; height: 100%; font-size: 18px; font-weight: bold;">
                                            	경고 횟수 : ${blackList[i].count }
                                        </div>
                                        <div class="right"
                                            style="width: 1%; height: 100%; font-size: 18px; font-weight: bold; text-align: right;">

                                        </div>
                                    </div>
                                    <div class="supporterthree">
                                        <div class="num1"
                                            style="width: 50%; height: 100%; font-size: 18px; font-weight: bold;">
                                            <p>Status : ${blackList[i].status }</p>
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
                                                href="/koala/admin/blockip.list?currentPage=${pi.currentPage - 1 }">Prev</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>

                                <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                                    <li class="page-item"><a class="page-link"
                                            href="/koala/admin/blockip.list?currentPage=${p }">${p }</a></li>
                                </c:forEach>

                                <c:choose>
                                    <c:when test="${pi.currentPage == pi.maxPage }">
                                        <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item"><a class="page-link"
                                                href="/koala/admin/blockip.list?currentPage=${pi.currentPage + 1 }">Next</a>
                                        </li>
                                    </c:otherwise>

                                </c:choose>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="/WEB-INF/views/common/footer.jsp" />
            <script>
                $(function () {
                	$(".action").on("click", function(){
                		var str = $(this).parent().parent().children(".left").text().trim(); // ip주소
                		// 경고 횟수 5회로 변경 후 상태값 변경 (트랜젝션사용)
                		$.ajax({
                			 url : "blockip.action",
                			 data : {
                				 blackIp : str
                			 },
                			 success : function(data){
                				 alert("해당 아이피 " + str + "는 이제 차단 되었습니다.");
                				 location.href="/koala/admin/blockip.list";
                			 },
                			 error : function(){
                				 console.log("blockList aJax Error");
                			 }
                		 })
                	})
                	
                	$(".clear").on("click", function(){
                		var str = $(this).parent().parent().children(".left").text().trim(); // ip주소
                		// 경고 횟수 초기화
                		 $.ajax({
                			 url : "blockip.clear",
                			 data : {
                				 blackIp : str
                			 },
                			 success : function(data){
                				 alert("해당 아이피 " + str + "의 경고 횟수를 초기화 하였습니다.");
                				 location.href="/koala/admin/blockip.list";
                			 },
                			 error : function(){
                				 console.log("blockList aJax Error");
                			 }
                		 })
                	})
                })
            </script>
        </body>

        </html>