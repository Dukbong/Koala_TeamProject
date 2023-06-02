<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
    body{
        background-color: rgb(30, 30, 30);
        color: white;
        positon: relative;
    }
    #wrap{
        width: 100%;
        height: 180px;
    }

    #header{
        width: 80%;
        height: 99%;
        margin: auto;
    }
    #line{
        width: 80%;
        height: 1%;
        background-color: rgb(172, 171, 169);
        margin: auto;
    }

    #header>div{height: 100%; float: left;}
    #header_1{width: 15%;}
    #header_2{width: 65%;}
    #header_3{width: 20%;}

    #header_2>div{width: 100%;}
    #header_2_1{height: 70%;}
    #header_2_2{height: 29%;}

    #header_1>i{padding-top: 65px;}
    #header_2_1>h1{
        margin: 0;
        font-size: 50px;
        padding-top: 30px;
        color: rgb(40, 151, 223);
    }
    
    #header_2_1:hover{
    	cursor: pointer;
    }
    
    #header_2_2>h4{
        margin: 0;
        font-size: 20px;
        padding-top: 10px;
        color: rgb(248, 185, 147);
    }
    
    #header_3_1{
    	border: 1px solid red;
    	height: 100%;
    	width: 100%;
    	top: 0;
    	left: 0;
    	bottom: 0;
    	right: 0;
    	text-align: center;
    	display: flex;
    	justify-content: center;
        flex-direction: column;
    }
    
    #header_3_1>a{
    	text-decoration: none;
    	color: rgb(40, 151, 223);
    	padding: 10px;
    }
    
	#darkmode{
		position: absolute;
		position: fixed;
		margin: auto;
		right: 5%;
		bottom:5%;
	}
	
"
	
	
</style>
<body>
    <div id="wrap">
        <div id="header">
            <div id="header_1">
                <i class="fa-solid fa-bars fa-2xl" style="color: #ffffff;"></i>
            </div>
            <div id="header_2">
                <div id="header_2_1">
                    <h1 onclick="location.href='/koala'">Koala initializr</h1>
                </div>
                <div id="header_2_2">
                    <h4>CreateCode && DownloadFile</h4> <!-- 조건문 걸기 -->
                </div>
            </div>
            <div id="header_3">
                <div id="header_3_1">
                	<c:choose>
                		<c:when test="${empty loginUser }">
		                	<a href="/koala/member/login">로그인</a>
		                	<a href="/koala/member/enroll">회원가입</a>
                   		</c:when>
                   		<c:otherwise>
                   			<span>${loginUser.userId }</span><br><br>
                   			<select id="myPage">
                   				<option selected>My Page<option>
                   				<option value="ad">Activity Details</option>
                   				<option value="as">Account Settings</option>
                   			</select>
                   			<a href="/koala/member/logout">로그아웃</a>
                   			
                   			<script>
                   				$(function(){
                   					$("#myPage").change(function(){
                   						if(this.value == "ad"){
                   							location.href = "/koala/member/ad?userNo="+${loginUser.userNo};
                   						}else if(this.value == "as"){
                   							location.href = "/koala/member/as";
                   						}
                   					});
                   				});
                   			</script>
                   		</c:otherwise>
                	</c:choose>
                </div>
            </div>
        </div>
        <div id="line"></div>
    </div>
    <div id="darkmode">
    	<i class="fa-solid fa-sun fa-2xl" style="color: rgb(255, 246, 246)" onclick="changeMode();"></i> <br><br> <!-- 수정할 것 -->
    	<i class="fa-solid fa-moon fa-2xl" style="color: rgb(30, 30, 30)"></i>
    </div>
    
    <script>
        function changeMode(){
            $("body").css("background-color", "rgb(255, 246, 246)").css("color", "black");
        }
        //배경 색 - 다크모드:rgb(30, 30, 30) / 라이트모드:rgb(255, 246, 246)
        //글자 색 - 다크모드:white / 라이트모드:black
        //컨텐트 박스 - 다크모드:black / 라이트모드:white
    </script>
</body>
</html>