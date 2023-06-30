<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Tilt+Prism&display=swap" rel="stylesheet">
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

	*{ 
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	body{
        background-color: rgb(30, 30, 30);
        color: white;
        
	}

	#wrap{
		width: 100%;
		height: 940px;
	}
	#content{
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #login-area{
        /* background-color: rgb(4, 59, 82); */
        width: 1000px;
        height: 800px;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        border: 1px solid lightgrey;
        border-radius: 15px;
        margin: auto;
    } 

    .logo{
  		font-family: 'Tilt Prism', cursive;
        padding: 30px;
        font-size: 70px;
    }
    
    .logo:hover{
    	cursor: pointer;
    }

    label{
        color: white;
        font-size: 15px;
    }

    #login-area button{
        width: 100%;
        background-color: rgb(75, 0, 255);
        border-color: transparent;
        color: white;
        font-size: 18px;
        cursor: pointer;
    }
    
    #login-area button:hover{
    	background-color: rgb(60, 0, 200);
    }

    #input-area input{
        width:300px;
    }

    .box {
        display: block;
        padding: 10px;
        border: 1px solid lightgray;
        border-radius: 4px;
        box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.2);
    }

    #keep-area{
        margin-bottom: 50px;
        padding-top: 5px;
    }

    #link-area{
        text-align: center;
        margin: 10px;
    }

    #link-area>a{
        text-decoration: none;
        color: white;
        margin: 10px;
        
    }
    
    /* 애니메이션 효과를 위한 CSS 스타일 지정 */
    @keyframes fadeInDown {
        from {
            opacity: 0;
            transform: translateY(-20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    /* 로그인 영역의 애니메이션 효과를 적용하는 CSS 스타일 지정 */
    #login-area {
        animation: fadeInDown 1s;
    }
    
    
    
    
</style>



</head>
<body>
	<c:if test="${not empty cookie.saveId.value}">
		<c:set var="checked" value="checked"/>
	</c:if>
	
	<div id="wrap">
		<div id="content">
	        <div id="login-area">
	            <span class="logo" onclick="location.href='/koala'">Koala</span>
	            <form action="login" method="post">
	
	                <div id="input-area">
	                    <label for="userId" class="">ID</label>
	                    <input type="text" class="box" placeholder="아이디 입력" id="userId" name="userId" required value="${cookie.saveId.value }"> <br>
	                    <label for="userPwd" class="">Password</label>
	                    <input type="password" class="box" placeholder="패스워드 입력" id="userPwd" name="userPwd" required>
	                </div>
	
	                <div id="keep-area">
	                    <input type="checkbox" id="keepId" name="keepId" ${checked }>
	                    <label for="keepId">아이디 저장</label>
	                </div>
	                
	                <div id="">
	                    <button type="submit" class="box">Login</button>
	                </div>
	                
	                <div id="link-area">
	                    <a href="forget">ID/PWD 찾기</a>
	                    <a href="enroll">회원가입</a>
	                </div>
	            </form>
	        </div>
	        <script>
	        	$(function(){
	        		
	        	});
	        </script>
		</div>

    </div>
    
	<!-- 알림메세지 -->
  	<c:if test="${not empty msg }">
		<script>
			$(function(){
				window.alert("${msg}");
			});
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>
	<!-- 자동완성 끄기 -->
	<script>
		$(function(){
			$("input").attr("autocomplete", "off");
		});
	</script>
  		
</body>
</html>