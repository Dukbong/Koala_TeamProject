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

	div{
		border: 1px solid white;
		box-sizing: border-box;
	}
	
	#select-mypage a{
        color: darkcyan;
        text-decoration: none;
    }


    #outer{
        height: 1200px;
        width: 80%;
    	margin: auto;
    }
    
    #content{
    	height: 100%;
    	width: 100%;
    }
    
    #content1,#content2{
    	margin: auto;
    	width: 80%;
    	margin-bottom: 10%;
    	background-color: black;
    	padding: 50px;
    }
    
    #content1{
    	height: 50%;
    }
    #content2{
    	height: 30%;
    }
    
    .sub-title{
    	font-size: 35px;
    	color: rgb(220, 135, 55);
    	height: 60px;
    }
    
    #info-area{
    	width: 100%;
    	height: 80%;
    }
    
    form{
    	height: 100%;
    	width: 100%;
    }
    
    #area1,#area2{
    	height: 100%;
    	display: inline-block;
    	float:left;
    }
    
    #area1{
    	width: 60%;
    }
    
    .pack{
    	margin: 20px 0px;
    }
    
    .pack>label{
    	font-size: 20px;
    }
    
    .box{
        display: block;
        padding: 5px;
        border: 1px solid lightgray;
        border-radius: 5px;
        height: 30px;
        width: 60%;
        font-size: 16px;
    }
    
    .readonly{
    	background-color: black;
    	color: white;
    }
    
    #area2{
    	width: 40%;
    }
    
    #profile{
    	height:80%;
    }
    
    #ubt{
    	height:15%;
    	padding: 10px;
    }
    
    #ubt>button{
    	float: right;
    }
    
    
    
    #delete-area{
    	color: red;
    	height: 70%;
    	widht: 100%;
    }
    
    #warning-message,#warning-btn{
    	height: 100%;
    	display: inline-block;
    	float:left;
    }
    
    #warning-message{
    	width: 85%;
    	font-size: 25px;
    }
    
    #warning-btn{
    	width: 15%;
    	padding: 15px;
    }
	
	#warning-btn>button{
    	float: right;
    	margin-right: 0px;
    	margin-bottom: 0px;
	}
	
	.btn-size{
		height: 40px;
		width: 100px;
	}
	
	
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div id="outer">
		<div id="select-mypage">
	        <ul>
	            <li><a href="">Activity Details</a></li>
	            <li><a href="">Account Settings</a></li>
	        </ul>
	    </div>
	    
		<div id="content">
			<div id="content1">
				<div class="sub-title">
					<span>Account Info</span>
				</div>
				<div id="info-area">
					<form>
						<div id="area1">
							<div class="pack">
				                <label for="userId">ID</label><br>
				                <input type="text" class="box readonly" id="userId"name="userId" value="aaaa${loginUser.userId }" readonly>
		            		</div>
		            		
		            		<div class="pack">
				                <label for="userPwd">Password</label><br>
				                <input type="password" class="box" id="userPwd" placeholder="비밀번호" name="userPwd" required value="${loginUser.userPwd }">
		            		</div>
							
		            		<div class="pack">
				                <label for="nickName">Nickname</label><br>
				                <input type="text" class="box" id="nickName" placeholder="닉네임" name="nickName" required value="${loginUser.nickName }">
		            		</div>
		            		
		            		<div class="pack">
			     	           <label for="email">Email</label><br>
			        	        <input type="email" class="box readonly" id="email" name="email" value="${loginUser.email }" readonly>
		            		</div>
						</div>
						<div id="area2">
							<div id="profile">
								hi
							</div>
							
							<div id="ubt">
								<button class="btn-size">update</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			
			<div id="content2">
				<div class="sub-title">
					<span>Account Delete</span>				
				</div>
				<div id="delete-area">
					<div id="warning-message">
						<p>
							Once you delete your account, there is no going back.<br>
							Please be certain.
						</p>
					</div>
					<div id="warning-btn">
						<button class="btn-size">delete</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	    
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>