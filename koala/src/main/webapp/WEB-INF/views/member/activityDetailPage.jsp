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
	#select-mypage a{
        color: darkcyan;
        text-decoration: none;
    }


    #content{
        height: 100%;
        width: 100%;
    }

    #content1>div{
        float: left;
        height:70%;
    }
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div id="select-mypage">
        <ul>
            <li><a href="">Activity Details</a></li>
            <li><a href="">Account Settings</a></li>
        </ul>
    </div>
    <hr>
    <div style="height: 500px;" >

        <div id="content">
            <div id="content1">
                <div id="con1-area">
                    <div id="profile">
                        <img src="피치.png" alt="">
                    </div>
                    <div id="nickname">
                        <span></span>
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
                        <li style="list-style-type: none;"><a href="">Board</a></li>
                        <li style="list-style-type: none;"><a href="">Reply</a></li>
                        <li style="list-style-type: none;"><a href="">Liked</a></li>
                        <li style="list-style-type: none;"><a href="">Following</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div id="list-area" style="width:80%; height: 70%;">
            
        </div>

    </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>