<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Koala</title>
</head>
<style>
    .wrapper{
        width: 1500px;
        height: 1100px;
        margin: auto;
        padding-top: 250px;
    }
    .main_area{
        width: 100%;
        margin: auto;
        height: 47%;
        background-color: rgba(100, 100, 100, 0.5);
        text-align: center;
        position: relative;
    }
    .main_area_opening>span{
        font-size: 23px;
        font-weight: bold;
        color: white;
    }
    .main_body{
    	width: 75%;
    	margin: auto;
        margin-top: 100px;
        justify-content: space-between;
        display: flex;
        flex-direction : row;
    }

	.search-area{
		width: 700px;
		height: 40px;
		margin: auto;
		margin-top: 60px;
		border: 2px solid gray;
	}
	.search-area>*{
		height: 100%;
		float: left;
	}
	.search-area>input{
		width: 85%;
	}
	.search-area>button{
		width: 15%;
		background-color: rgb(250, 220, 160);
		border: 0;
		font-size: 17px;
		font-weight: 600;
	}

    .body1,.body2,.body3{
        width: 27%;
        height: 170px;
        color: white;
        cursor: pointer;
    }
    .item_name{
        margin-top: 10px;
        font-size: 30px;
        font-weight: bold;
    }
    .body_logo1{
        float: right;
        margin-top: 30px;
        margin-right: 30px;
    }
    .body_logo2,.body_logo3{
        text-align: center;
    }
    .body_title{
        font-size: 28px;
        font-weight: bold;
        text-align: center;
    }
    .body_logo2{
        margin-top: 20px;
    }
    .item_info{
        margin-top: 30px;
        font-size: 11px;
    }
    .main_image{
        position: absolute;
        width: 100%;
        opacity: 15%;
    }
    .main_image2,.main_area_opening{
        position: absolute;
        margin: auto;
        width: 100%;
        margin-top: 30px;
    }
    .main_area_opening{
        margin-top: 320px;
    }
</style>
<body>
	<%@include file="header.jsp" %>
    <div class="wrapper">
    <div class="space"></div>
        <div class="main_area">
            <div class="main_image" style="height: 100%;">
                <img src="/koala/resources/common/털.png" style="height: 100%; width: 100%;"alt="">
            </div>
            <div class="main_image2">
                <img src="/koala/resources/common/코알라로고_문구有.png" id="koala_logo" style="width: 400px;" alt="">
            </div>
            <div class="main_area_opening">
                <span>KH Academy</span>&nbsp;&nbsp;&nbsp;<span> 2023.05.30</span>
            </div>
        </div>
        
        <div class="search-area">
        	<input type="search" placeholder="검색어를 입력하세요"><button>search</button>
        </div>

        <div class="main_body">
            <div class="body1">
                <div class="body_logo2">
                    <img src="/koala/resources/common/download.png" style="width: 80px;" alt="">
                </div>
                <div class="body_title" style="margin-top: 10px;">
                    <span class="ii">Download</span>
                </div>
            </div>
            <div class="body2">
                <div class="body_logo2">
                    <img src="/koala/resources/common/download.png" style="width: 80px;" alt="">
                </div>
                <div class="body_title" style="margin-top: 10px;">
                    <span class="ii">Download</span>
                </div>
            </div>
            <div class="body3">
                <div class="body_logo3">
                    <img src="/koala/resources/common/free-icon-cloud-upload-4007710.png" style="width: 110px;" alt="">
                </div>
                <div class="body_title">
                    <span class="ii">CreateFile</span>
                </div>
            </div>
        </div>

    </div>
    <%@include file="footer.jsp" %>
    
    <c:if test="${not empty msgc}">
    	<script>
    		$(function(){
	 			if(confirm("${msgc}")){
	 				//확인 및 취소
	 				$.ajax({
	 					url : "/koala/promote/promote.approve",
	 					data : {
	 						scope : "read:user"
	 					},
	 					success : function(data){ 
	 						location.href="https://github.com/login/oauth/authorize?client_id="+data;
	 					},
	 					error : function(){
	 						console.log("error");
	 					}
	 				});
	 			}else{ // 취소 시 대기중인 상태 풀림.
	 				$.ajax({
	 					url : "/koala/promote/promote.cancel",
	 					data : {
	 						client_No : "${loginUser.userNo}"
	 					},
	 					success : function(data){
	 						alert("아쉽습니다...");
	 					},
	 					error : function(){
	 						console.log("ajax error");
	 					}
	 				});
	 			}
    		});
    	</script>
    	<c:remove var="msgc" scope="session"/>
    </c:if>
</body>
</html>