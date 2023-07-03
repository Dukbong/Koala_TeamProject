<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    #outer{
        height: 1300px;
        width: 80%;
    	margin: auto;
    	padding-top: 200px;
    }
    
    #content{
    	height: 100%;
    	width: 100%;
    }
    
    #content1, #content2{
    	margin: auto;
    	width: 80%;
    	margin-bottom: 5%;
    	background-color: rgb(45, 45, 45);
    	padding: 20px;
    	
    }
    
    #content1{
    	height: 350px;
    }
    
    #content2{
    	height: 650px;
    }
    
    /* content1영역 */
    
    #con1-area, #con2-area, #con3-area{
    	float: left;
    	height: 80%;
    	border-bottom: 3px solid lightgray;
    	padding: 10px;
    }
    
    #select-list{
    	height: 10%;
    }

	#select-list>ul{
	
		width:100%;
		height:100%;
		list-style-type:none;
		margin:auto;
		padding:0;
	}
	
    #select-list>ul>li {float:left; width:10%; height:100%; text-align:center; margin:10px;}
    #select-list>ul>li a {text-decoration:none;}
	#select-list>ul>li:hover{
		cursor: pointer;
		border: 1px solid gray;
		border-radius: 30px;
	}

	
	
	
	
	
	
	    
    #con1-area{
    	width: 30%;
    	text-align: center;
    }
    
   	#con2-area{
   		width: 30%;
   	}
   	
   	#con3-area{
   		width: 40%;
   	}
   	
	
	#introduce-box textarea{
		background-color: rgb(52, 73, 94);
		width: 100%;
		color: white;
		resize: none;
		border: 1px solid gray;
		border-radius: 10px;
	}
	
	#nickname{
		margin-top: 15px;
		width: 100%;
	}
	#nickname-box{
		width: 60%;
		margin: auto;
		background-color: rgb(52, 73, 94);
		font-size: 20px;
		padding: 5px;
		border: 1px solid gray;
		border-radius: 10px;
		
	}
   	
   	/* content2영역 */
   	
   	#content2>#select-list{
   		
   	}
   	
   	#content2>#select-list>ul>li:hover{
   		cursor: pointer;
   		color: gray;
   	}
   	
   	
   	
   	.rel-board tbody>tr>td{
   		color: black;
   	}
   	
   	
   	


	.rel-board {
		border: 1px #a39485 solid;
		font-size: .9em;
		box-shadow: 0 2px 5px rgba(0,0,0,.25);
		width: 100%;
		border-collapse: collapse;
		border-radius: 5px;
		overflow: hidden;
	}

	.rel-board th {
		text-align: left;
	}
  
	.rel-board thead {
		font-weight: bold;
		color: #fff;
		background: #73685d;
	}
  
	.rel-board td,.rel-board th {
		padding: 1em .5em;
		vertical-align: middle;
	}
	
	.rel-board>tbody>tr>th{
		background: #fff;
		color: black;
	}
  
	.rel-board td {
		border-bottom: 1px solid rgba(0,0,0,.1);
		background: #fff;
	}
	
	.rel-board tbody>tr:hover{
		opacity: 0.8;
		cursor: pointer;
	}
	
	
	
	
	.rel-user{
		text-align: center;
		float: left;
	}
	
	.rel-user:hover{
		cursor: pointer;
		opacity: 0.7;
	}
	
	#content2>div{
		width: 100%;
	}
	
	#content2>#result-area{
		height: 90%;
	}
	
	#ccontent2>.bottom-area{
		height: 10%;
	}
	
	#followList-area{
		height: 100%;
		width: 95%;
		margin: auto;
	}
	
	
   	.profile{
	    width: 120px;
	    height: 120px;
	    border-radius: 70%;
	    overflow: hidden;
	    position: relative;
	    margin: 0 30px;
	}
	
	
	/* =====================================설희 작성 */
	.contributions-outer div{border: 1px solid pink;}
	.contributions-outer{width: 1200px; height: 400px; margin: auto;}
	.contributions-area{width: 100%; height: 90%;}
	.level-area{width: 100%; height: 10%; position:relative;}
	.level-area>div{width: 230px; height: 30px; position:absolute; right:0; bottom:0;}
	.level-area>div>*{height: 100%; float:left; margin: 0px 5px;}
	.level-area>div>div{width:20px; height: 20px;}
	
	
	
	.bottom_area{
        display: flex;
        justify-content: center;
        margin-top: 40px;
        cursor: pointer;
    }
    .bottom_area>ul>li{
        font-weight: bold;
        list-style: none;
        float: left;
        margin-right: 10px;
    }
    .bottom_area>ul>li>a{
        color: white;
        text-decoration : none;
    }
    .bottom_area>ul>li>a:hover{
        color: rgb(255, 201,20);
    }

    .bottom_area > ul{
        margin: 0;
        padding: 0;
    }

    
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	
    <div id="outer" >

        <div id="content">
            <div id="content1">
                <div id="con1-area">
                    <div id="profile">
	       				<c:choose>
							<c:when test="${not empty user.profile }">
							    <img class="profile" src="${pageContext.request.contextPath}${user.profile.filePath}${user.profile.changeName}">
							</c:when>
							<c:otherwise>
							    <img class="profile" src="${pageContext.request.contextPath}/resources/memberImage/default.jpg">									
							</c:otherwise>
						</c:choose>
                    </div>
                    <div id="nickname">
                    	<div id="nickname-box">
	                        <span>${user.nickName }</span>
                    	</div>
                    </div>
                </div>
                <div id="con2-area">
                	<table>
                		<tr>
                			<th>
                				Lv.${user.userLevel }
                			<c:if test="${user.userLevel == 1 }">
                				브론즈
                			</c:if>
                			<c:if test="${user.userLevel == 2 }">
                				실버
                			</c:if>
                			<c:if test="${user.userLevel == 3 }">
                				골드
                			</c:if>
                			<c:if test="${user.userLevel == 4 }">
                				플레티넘
                			</c:if>
                			<c:if test="${user.userLevel == 5 }">
                				다이아
                			</c:if>
                			</th>
                		</tr>
                		
                		<tr>
                			<th>Points : ${user.point }pts</th>                			
                		</tr>
                		
                		<tr>
                			<th>Followers : ${followCnt }</th>
                		</tr>
                		<tr>
                			<c:if test="${user ne loginUser }">
                				<th><button id="follow" class="btn btn-secondary">Follow</button></th>
                			</c:if>
                		<tr>
                	</table>
                	
                	<c:if test="${not empty loginUser && not empty user }">
                	<script>
                		$(function(){
                			$("#follow").on("click", function(){
                				console.log("hi");
                				$.ajax({
                					url:"/koala/member/follow",
                					data:{
                						fromUser:"${loginUser.userNo}",
                						toUser:"${user.userNo}"
                					},
                					success:function(result){
                						if(result == 1){
                							alert("이 유저를 팔로우합니다.");
                							
                							
                						}else if(result == 2){
                							alert("팔로우를 취소합니다.");
                						}
                					},
                					error:function(){
                						alert("통신 실패!");
                					},
                					complete:function(){
                						location.reload();
                					}
                				});
                			});
                		});
                	
                	</script>
                	</c:if>
                	<c:if test="${empty loginUser }">
                	<script>
                		$(function(){
                			$("#follow").on("click", function(){
                				alert("로그인 후 이용해 주세요.");
                			});
                		})
                	</script>
                	</c:if>
                    
                </div>
                <div id="con3-area">
                    <div id="introduce-box">
                    	<c:choose>
                    		<c:when test="${user eq loginUser }">
		                        <form action="update.intro" method="post">
		                            <textarea name="introduce" id="introduce" cols="30" rows="5">${user.introduce }</textarea><br>
		                            <button type="submit" class="btn btn-primary" style="float:right">Update</button>
		                        </form>	
                    		</c:when>
                    		<c:otherwise>
                    			<textarea name="introduce" id="introduce" cols="30" rows="5" readonly placeholder="작성된 소갯말이 없습니다.">${user.introduce }</textarea><br>
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                </div>
                
                <script>
                	
                </script>
                
                <div id="select-list">
                    <ul>
                        <li style="list-style-type: none;"><a id="boardList">Board</a></li>
                        <li style="list-style-type: none;"><a id="replyList">Reply</a></li>
                        <li style="list-style-type: none;"><a id="likedList">Liked</a></li>
                        <li style="list-style-type: none;"><a id="followingList">Following</a></li>
                        <li style="list-style-type: none;"><a id="contributions">contributions</a></li>
                    </ul>
                </div>
            </div>
            
            
            <div id="content2">
                
                <script>
                	$(function(){
                		//리스트 조회
                		$("#select-list>ul>li").on("click", function(){
                			
                			var select = $(this).children().prop("id");
                			
                			location.href = "/koala/member/"+select+"?userId=${user.userId}";
                		});
                		
                	});
                </script>
                
                
                <div id="result-area">
                	
                	<c:choose>
                		<c:when test="${not empty bList}">
                			<table class="rel-board" style="color:white;">
                				<thead>
									<tr>
										<th scope="col" width="10"> </th>
										<th scope="col" width="70">카테고리</th>
										<th scope="col" width="250">제목</th>
										<th scope="col" width="30">작성일</th>
										<th scope="col" width="30">추천수</th>
										<th scope="col" width="30">조회수</th>
									</tr>
								</thead>
								
	                			<tbody>
	                				<c:forEach var="b" items="${bList }" varStatus="status">
										<tr>
											<input type="hidden" value="${b.boardNo }">
											<th scope="row"></th>
											<c:choose>
												<c:when test="${b.category eq 'Q' }">
													<td>질문게시판</td>
												</c:when>
												<c:when test="${b.category eq 'E' }">
													<td>에러게시판</td>
												</c:when>
												<c:when test="${b.category eq 'B' }">
													<td>자유게시판</td>
												</c:when>
											</c:choose>
											<td>${b.title }</td>
											<td>${b.createDate }</td>
											<td>${b.liked }</td>
											<td>${b.count }</td>
										</tr>
									</c:forEach>
	                			</tbody>
                			</table>
                		</c:when>
                		
                		<c:when test="${not empty rList }">
                			<table class="rel-board" style="color:white;">
                				<thead>
									<tr>
										<th scope="col" width="10"> </th>
										<th scope="col" width="70">카테고리</th>
										<th scope="col" width="250">제목</th>
										<th scope="col" width="30">작성일</th>
										<th scope="col" width="30">추천수</th>
										<th scope="col" width="30">조회수</th>
									</tr>
								</thead>
								
	                			<tbody>
	                				<c:forEach var="r" items="${rList }" varStatus="status">
										<tr>
											<input type="hidden" value="${r.boardNo }">
											<th scope="row"></th>
											<c:choose>
												<c:when test="${r.category eq 'Q' }">
													<td>질문게시판</td>
												</c:when>
												<c:when test="${r.category eq 'E' }">
													<td>에러게시판</td>
												</c:when>
												<c:when test="${r.category eq 'B' }">
													<td>자유게시판</td>
												</c:when>
											</c:choose>
											<td>${r.title }</td>
											<td>${r.createDate }</td>
											<td>${r.liked }</td>
											<td>${r.count }</td>
										</tr>
									</c:forEach>
	                			</tbody>
                			</table>
                		</c:when>
                		
                		<c:when test="${not empty lList }">
                			<table class="rel-board" style="color:white;">
                				<thead>
									<tr>
										<th scope="col" width="10"> </th>
										<th scope="col" width="70">카테고리</th>
										<th scope="col" width="250">제목</th>
										<th scope="col" width="30">작성일</th>
										<th scope="col" width="30">추천수</th>
										<th scope="col" width="30">조회수</th>
									</tr>
								</thead>
								
	                			<tbody>
	                				<c:forEach var="l" items="${lList }" varStatus="status">
										<tr>
											<input type="hidden" value="${l.boardNo }">
											<th scope="row"></th>
											<c:choose>
												<c:when test="${l.category eq 'Q' }">
													<td>질문게시판</td>
												</c:when>
												<c:when test="${l.category eq 'E' }">
													<td>에러게시판</td>
												</c:when>
												<c:when test="${l.category eq 'B' }">
													<td>자유게시판</td>
												</c:when>
											</c:choose>
											<td>${l.title }</td>
											<td>${l.createDate }</td>
											<td>${l.liked }</td>
											<td>${l.count }</td>
										</tr>
									</c:forEach>
	                			</tbody>
                			</table>
                		</c:when>
                		
                		<c:when test="${not empty fList }">
                			<div id="followList-area">
	                			<c:forEach var="f" items="${fList }">
									<table class="rel-user">
					                    <tr>
					                    	<input type="hidden" value="${f.userId }">
					                        <th>
					                        	<c:choose>
													<c:when test="${f.profile != null }">
													    <img class="profile" src="${pageContext.request.contextPath}${f.profile.filePath}${f.profile.changeName}"></img>
													</c:when>
													<c:otherwise>
													    <img class="profile" src="${pageContext.request.contextPath}/resources/memberImage/default.jpg">									
													</c:otherwise>
												</c:choose>
					                        </th>
					                    </tr>
					                    <tr>
					                        <th>${f.nickName}</th>
					                    </tr>
					                </table>
								</c:forEach>
                			</div>
                		</c:when>
                		
                		<c:when test="${not empty attList }">
							<div class="contributions-outer">
								<div class="contributions-area">
									<table border="1">
										<tr>
											<th>Jan.</th>
											<c:forEach  var="a" items="attList">
												<td></td>
											</c:forEach>
										</tr>
										<tr>
											<th>Feb.</th>
											<c:forEach begin="1" end="31">
												<td></td>
											</c:forEach>
										</tr>
										<tr>
											<th>Mar.</th>
											<c:forEach begin="1" end="31">
												<td></td>
											</c:forEach>
										</tr>
										<tr>
											<th>Apr.</th>
											<c:forEach begin="1" end="31">
												<td></td>
											</c:forEach>
										</tr>
										<tr>
											<th>May.</th>
											<c:forEach begin="1" end="31">
												<td></td>
											</c:forEach>
										</tr>
										<tr>
											<th>Jun.</th>
											<c:forEach begin="1" end="31">
												<td></td>
											</c:forEach>
										</tr>
										<tr>
											<th>Jul.</th>
											<c:forEach begin="1" end="31">
												<td></td>
											</c:forEach>
										</tr>
										<tr>
											<th>Aug.</th>
											<c:forEach begin="1" end="31">
												<td></td>
											</c:forEach>
										</tr>
										<tr>
											<th>Sep.</th>
											<c:forEach begin="1" end="31">
												<td></td>
											</c:forEach>
										</tr>
										<tr>
											<th>Oct.</th>
											<c:forEach begin="1" end="31">
												<td></td>
											</c:forEach>
										</tr>
										<tr>
											<th>Nov.</th>
											<c:forEach begin="1" end="31">
												<td></td>
											</c:forEach>
										</tr>
										<tr>
											<th>Dec.</th>
											<c:forEach begin="1" end="31">
												<td></td>
											</c:forEach>
										</tr>
										
									</table>
								</div>
								<div class="level-area">
									<div>
										<span>Less</span>
										<div style="background-color: rgb(74, 40, 4);"></div>
										<div style="background-color: rgb(70, 93, 39);"></div>
										<div style="background-color: rgb(53, 141, 53);"></div>
										<i class="fa-solid fa-seedling fa-bounce" style="color: #1eff00;"></i>
										<span>More</span>
									</div>
								</div>
							</div>
                		</c:when>
                		
                		<c:otherwise>
                			<table class="table table-hover" style="color:white;">
                				<thead>
									<tr>
										
									</tr>
								</thead>
								
	                			<tbody>
	                				
	                			</tbody>
                			</table>
                		</c:otherwise>
                		
                	</c:choose>
                	
                </div>

                
                <script>
	                $(function(){
	                	//보드로 넘기기
	            		$("#result-area>.rel-board>tbody>tr").on("click", function(){
	            			//보드 번호로 넘겨야함
	            			
	            			console.log($(this).find("input[type=hidden]").val());
	            			
	            			var bno = $(this).find("input[type=hidden]").val();
	            			
	            			
	            			
	            			console.log($(this).children().eq(2).text());
	            			
	            			var kind = $(this).children().eq(2).text();
	            			
	            			if(kind == "질문게시판"){
	            				location.href = "/koala/qnaBoard/detail?boardNo="+bno;
	            			}else if(kind == "에러게시판"){
	            				location.href = "/koala/errorBoard/detail?boardNo="+bno;
	            			}else if(kind == "자유게시판"){
	            				location.href = "/koala/bulletinBoard/detail?boardNo="+bno;
	            			}
	            			
	            			
	            		});
	                	
	                	
	                	$("#result-area>.rel-user").on("click", function(){
	                		//유저 아이디로 넘겨야함
	                		
	                		var uid = $(this).find("input[type=hidden]").val();
	                		
	                		console.log(uid);
	                		location.href = "/koala/member/ad?userId="+uid;
	                	});
	            	});
                </script>
                
                <div class="bottom_area">
		            <ul>
		            	<c:choose>
		            		<c:when test="${pi.currentPage eq 1 }">
		                		<li class="pagingSection"><a class=page-link href="#">&lt;</a></li>
		            		</c:when>
		            		<c:otherwise>
		                		<li class="pagingSection"><a class="page-link" href="/koala/member/${kind }?userId=${user.userId }&currentPage=${pi.currentPage -1}">&lt;</a></li>	
		            		</c:otherwise>
		            	</c:choose>
						<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
		               		<li class="pagingSection"><a class="page-link" 
							<c:if test="${p eq pi.currentPage }">style="color: rgb(255, 201,20);"</c:if> href="/koala/member/${kind }?userId=${user.userId }&currentPage=${p }">${p }</a></li>
		            	</c:forEach>
		            	<c:choose>
		            		<c:when test="${pi.currentPage eq pi.maxPage }">
		                		<li class="pagingSection"><a class="page-link" href="#">&gt;</a></li>
		            		</c:when>
		            		<c:otherwise>
		            			<li class="pagingSection"><a class="page-link" href="/koala/member/${kind }?userId=${user.userId }&currentPage=${pi.currentPage + 1}">&gt;</a></li>	
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