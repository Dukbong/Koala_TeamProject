<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
    body{
            background-color: black;
            box-sizing: border-box;
            color: white;
        }
        .wrapper{
        width: 100%;
        height: 1400px;


    }
    .header{
        width: 100%;
        height: 18%;
    }
    .body_content{
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
        width: 80%;
        margin: auto;
    }
    .menubox{
        width: 40%;
        /* margin-left: 20px;
        margin-right: 20px;
        margin-bottom: 20px; */
        height: 15%;
        display: inline-block;
        cursor: pointer;
        margin-left: 40px;
    }
    .box_title{
        margin-top: 20px;
        font-size: 30px;
        font-weight: 500;
    }
    .box_content{
        width: 90%;
        margin-top: 30px;
        font-size: 12px;
    }
    .menubox:hover{
        /* opacity: 80%; */
        color: rgb(255, 201, 20);

    }

</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header_copy.jsp"/>
	
    <div class="wrapper">
        <div class="header">

        </div>
        <div class="body_content">
        
        <c:forEach var="s" items="${slist }" >
        
        <div class="menubox">
        	<input type="hidden" value="${s.settingNo }">
            <div class="box_title">
                <span>${s.settingTitle }</span>
            </div>
            <div class="box_content">
                <p>
                	${s.sortDescription }
                </p>
            </div>
        </div>
        
        </c:forEach>
        
    	</div>
    	
    	<script>
    		$(function(){
    			$(".menubox").on("click", function(){
    				var settingNo = $(this).find("input[type=hidden]").val();
    				
    				location.href="/koala/setting/detail?settingNo="+settingNo;
    			});
    		});
    	</script>
    </div>
</body>
</html>