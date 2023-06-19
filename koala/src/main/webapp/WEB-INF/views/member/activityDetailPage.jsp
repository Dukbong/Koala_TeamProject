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
    }
    
    #content{
    	height: 100%;
    	width: 100%;
    }
	
	#select-mypage a{
        color: darkcyan;
        text-decoration: none;
    }
    
    #select-list a{
    	cursor: pointer;
    	
    }


    #content{
        height: 100%;
        width: 100%;
    }

    #content1>div{
        float: left;
        height:70%;
    }
 
    
    #result-area>table>tbody>tr:hover{
    	color: gray;
    	cursor: pointer;
    }
    
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	
    <div id="outer" >

        <div id="content">
            <div id="content1">
                <div id="con1-area">
                    <div id="profile">
                        <img src="피치.png" alt="">
                    </div>
                    <div id="nickname">
                        <span>${user.nickName }</span>
                    </div>
                </div>
                <div id="con2-area">
                	<table>
                		<tr>
                			<th>Lv.${user.userLevel } 여기는 레벨에따라 조건</th>
                		</tr>
                		
                		<tr>
                			<th>Points : ${user.point }pts</th>                			
                		</tr>
                		
                		<tr>
                			<th>Followers : ${followCnt }</th>
                		</tr>
                		<tr>
                			<c:if test="${user ne loginUser }">
                				<th><button id="follow">Follow</button></th>
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
                						fromUser:${loginUser.userNo},
                						toUser:${user.userNo}
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
                					}
                				});
                			});
                		});
                	
                	</script>
                	</c:if>
                    
                </div>
                <div id="introduce-area">
                    <div id="introduce-box">
                    	<c:choose>
                    		<c:when test="${user eq loginUser }">
		                        <form action="update.intro" method="post">
		                            <textarea name="introduce" id="" cols="30" rows="5" style="resize: none;">${user.introduce }</textarea><br>
		                            <button type="submit" style="background-color: blue;">Update</button>
		                        </form>	
                    		</c:when>
                    		<c:otherwise>
                    			<textarea name="" id="" cols="30" rows="5" style="resize: none;" readonly>${user.introduce }</textarea><br>
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                </div>
            </div>
            <div id="content2">
                <div id="select-list">
                    <ul>
                        <li style="list-style-type: none;"><a id="boardList">Board</a></li>
                        <li style="list-style-type: none;"><a id="replyList">Reply</a></li>
                        <li style="list-style-type: none;"><a id="likedList">Liked</a></li>
                        <li style="list-style-type: none;"><a id="followingList">Following</a></li>
                    </ul>
                </div>
                
                <script>
                	$(function(){
                		//리스트 조회
                		$("#select-list a").on("click", function(){
                			
                			var select = $(this).prop("id");
                			console.log(select);
                			
                			//location.href = "/koala/member/ad?userId=${user.userId}/"+select;
                		});
                		
                	});
                	
                	
                </script>
                
                
                <div id="result-area" >
                	<table border="1" align="center">
                		<thead>
                			<tr>
                				<th>카테고리</th>
                				<th>제목</th>
                				<th>작성일</th>
                				<th>추천수</th>
                				<th>조회수</th>
                			<tr>
                		</thead>
                		<tbody>
                			
                		</tbody>
                	</table>
                	
					<table class="table caption-top">
					<caption>List of users</caption>
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">First</th>
							<th scope="col">Last</th>
							<th scope="col">Handle</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>@fat</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>Larry</td>
							<td>the Bird</td>
							<td>@twitter</td>
						</tr>
					</tbody>
					</table>
                </div>
                
                <script>
	                $(function(){
	            		
	            	});
                </script>
            </div>
        </div>


    </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>