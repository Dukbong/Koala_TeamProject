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
        padding: 15px;
        font-size: 50px;
    }

    label{
        color: white;
        font-size: 15px;
        margin-left: 4px;
    }

    #login-area button{
        width: 100%;
        background-color: rgb(76, 0, 255);
        border-color: transparent;
        color: white;
        font-size: 18px;
    }

    #input-area input{
        width:300px;
    }

    .box {
        display: block;
        padding: 10px;
        border: 1px solid lightgray;
        border-radius: 20px;
    }
    
    #ex{
    	padding-top: 15px;
    	padding-bottom: 40px;
    }

    

    
</style>
</head>
<body>
	<div id="wrap">
		<div id="content">
	        <div id="login-area">
	            <span class="logo">Koala</span>
	            <div id="ex">
		            <span class="small">회원가입시 입력하신 이메일 주소를 입력하세요.</span><br>
		            <span class="small">해당 이메일로 아이디와 변경된 패스워드를 보내드립니다.</span>
	            </div>
	            
	            <form action="login" method="post">
	
	                <div id="input-area">
	                    <label for="email" class="">Email</label>
	                    <input type="email" class="box" placeholder="이메일 입력" id="email" name="userId" required> <br>
	                </div>
	
	                
	                
	                <div id="">
	                    <button type="submit" class="box">GO</button>
	                </div>
	            </form>
	        </div>
		</div>

    </div>
    
	<!-- 알림메세지 -->
  	<c:if test="${not empty msg }">
		<script>
 			alert("${msg}");
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>
  		
</body>
</html>