<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style>
	
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
        background-color: rgb(4, 59, 82);
        width: 1000px;
        height: 800px;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        border: 1px solid lightgrey;
        border-radius: 5px;
        margin: auto;
    } 

    .logo{
        padding: 15px;
    }

    label{
        color: white;
        font-size: 15px;
    }

    #login-area button{
        width: 100%;
        background-color: rgb(9, 33, 43);
        border-color: transparent;
        color: white;
        font-size: 18px;
    }

    #input-area input{
        width:250px;
    }

    .box {
        display: block;
        padding: 10px;
        border: 1px solid lightgray;
        border-radius: 20px;
    }

    #keep-area{
        margin-bottom: 50px;
        padding: 10px;
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
</style>
</head>
<body>
	<div id="wrap">
		<div id="content">
	        <div id="login-area">
	            <h1 class="logo">Koala</h1>
	            <form action="login" method="post">
	
	                <div id="input-area">
	                    <label for="userId" class="">ID</label>
	                    <input type="text" class="box" placeholder="아이디 입력" id="userId" name="userId" required> <br>
	                    <label for="userPwd" class="">Password</label>
	                    <input type="password" class="box" placeholder="패스워드 입력" id="userPwd" name="userPwd" required>
	                </div>
	
	                <div id="keep-area">
	                    <input type="checkbox" id="keepId">
	                    <label for="keepId">아이디 저장</label>
	
	                </div>
	                
	                <div id="">
	                    <button type="submit" class="box">Login</button>
	                </div>
	                
	                <div id="link-area">
	                    <a href="forget">ID/PWD 찾기</a>
	                    <a href="enroll.me">회원가입</a>
	                </div>
	            </form>
	        </div>
		</div>

    </div>
    
  	<script>
  		$(function(){
  			if(${alert} != null){
  				alert(${alert});
  			}
  		});
  	</script>
</body>
</html>