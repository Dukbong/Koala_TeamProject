<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Koala_Ranking</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
    body{
        background-color: black;
        box-sizing: border-box;
        }
    .wrapper{
        width: 100%;
        height: 1000px;
        padding-top:200px;
    }
    .body_content{
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
        width: 80%;
        margin: auto;
    }
    .top_area{
        width: 100%;
        height: 15%;
        display: flex;
        align-items: center;
        margin-bottom: 30px;
    }
    .board_title{
        width: 60%;
        float: left;
        margin-left: 30px;
    }
    .board_title>span{
        color: rgb(255, 201,20);
        font-size: 40px;
        font-weight: bold;
    }
    .middle_area{
        color: white;
        width: 90%;
        height: 500px;
        text-align: center;
    }
    .middle_area table{
        width: 100%;
        height: 100%;
        font-size: 11px;
        border-top: 1px solid grey;
        border-bottom: 1px solid grey;

    }
    .middle_area table>thead{
        height: 10%;
        font-size: 13px;
        color: rgb(255, 201,20);        
    }
    .middle_area table > thead > tr>th{
    border-bottom: 1px solid grey;
    }
    .rank_img{
        width: 20px;
    }
    .middle_area table > tbody > tr > td:nth-child(2){
        color: crimson;
    }

    .update_area{
        color: white;
        display: flex;
        justify-content: end;
        width: 90%;
        font-size: 10px;
    }
    
    /* styles.css */
	@keyframes fadeIn {
	    0% { opacity: 0; }
	    100% { opacity: 1; }
	}
	
	.middle_area table tr {
	    opacity: 0;
	    animation: fadeIn 0.5s forwards;
	}
	
	.middle_area table tr:nth-child(1) {
	    animation-delay: 0.5s;
	}
	
	.middle_area table tr:nth-child(2) {
	    animation-delay: 1s;
	}
	
	.middle_area table tr:nth-child(3) {
	    animation-delay: 1.5s;
	}
	
	.middle_area table tr:nth-child(4) {
	    animation-delay: 2s;
	}
	
	.middle_area table tr:nth-child(5) {
	    animation-delay: 2.5s;
	}
	
	.middle_area table tr:nth-child(6) {
	    animation-delay: 3s;
	}
	
	.middle_area table tr:nth-child(7) {
	    animation-delay: 3.5s;
	}
	
	.middle_area table tr:nth-child(8) {
	    animation-delay: 4s;
	}
	
	.middle_area table tr:nth-child(9) {
	    animation-delay: 4.5s;
	}
	
	.middle_area table tr:nth-child(10) {
	    animation-delay: 5s;
	}

</style>
<body>
<%@include file="../../common/header.jsp"%>
    <div class="wrapper">
        
        <div class="body_content">
            <div class="top_area">
                <div class="board_title">
                    <span>Today's Ranking</span>
                </div>
            </div>

            <div class="middle_area">
                <table>
                    <thead>
                        <tr>
                            <th style="width: 8%;">순위</th>
                            <th style="width: 8%;">등락</th>
                            <th style="width: 12%;">★</th>
                            <th style="width: 20%;">닉네임</th>
                            <th style="width: 20%;">아이디</th>
                            <th style="width: 12%;">등급</th>
                            <th>누적 포인트</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="m" items="${list}" varStatus="status">
                        <tr>                    
                            <td>${m.rank}</td>
                            <td>${m.rankChange }</td>
                            <td>
                            	<c:if test="${m.userLevel == 6}">
                            	<img class="rank_img" src="/koala/resources/common/비브라늄.png" alt="">
                            	</c:if>
                            	<c:if test="${m.userLevel == 5}">
                            	<img class="rank_img" src="/koala/resources/common/플래티넘.png" alt="">
	                            </c:if>
                            	<c:if test="${m.userLevel == 4}">
                            	<img class="rank_img" src="/koala/resources/common/골드.png" alt="">
	                            </c:if>
	                            <c:if test="${m.userLevel == 3}">
                            	<img class="rank_img" src="/koala/resources/common/실버.png" alt="">
	                            </c:if>
	                            <c:if test="${m.userLevel == 2}">
                            	<img class="rank_img" src="/koala/resources/common/브론즈.png" alt="">
	                            </c:if>
	                            
                            </td>
                            <td>${m.nickName}</td>
                            <td>${m.userId}</td>
                            <td>
                            	<c:if test="${m.userLevel == 6}">
                            	<span>비브라늄</span>
                            	</c:if>
                            	<c:if test="${m.userLevel == 5}">
                            	<span>플래티넘</span>
	                            </c:if>
                            	<c:if test="${m.userLevel == 4}">
                            	<span>골드</span>
	                            </c:if>
	                            <c:if test="${m.userLevel == 3}">
                            	<span>실버</span>
	                            </c:if>
	                            <c:if test="${m.userLevel == 2}">
                            	<span>브론즈</span>
	                            </c:if>
                            </td>
                            <td>
                            <!-- 숫자 콤마로 만들어주기 -->
                             	<fmt:formatNumber value="${m.point}" pattern="#,###"></fmt:formatNumber>
                            </td>
                        </tr>                    	
                    </c:forEach>

                    </tbody>
                </table>
            </div>

            <div class="update_area">
                <span id="currentTime"></span><!-- 여긴 걍 현재시간 넣어줄거야 -->
            </div>

		<script>
			function getCurrentTime(){
				var now = new Date();
				var year = now.getFullYear();
				var month = ("0"+(now.getMonth()+1)).slice(-2);
	            var day = ("0" + now.getDate()).slice(-2);
	            var hour = ("0" + now.getHours()).slice(-2);
	            var minute = ("0" + now.getMinutes()).slice(-2);
	            var second = ("0" + now.getSeconds()).slice(-2);
	            var timeString = year + "." + month + "." + day + " " + hour + ":" + minute + ":" + second;
	            return timeString;
			}
			
			document.getElementById("currentTime").innerText = getCurrentTime() + " 업데이트";
		</script>

        </div>
    </div>
  <jsp:include page="../../common/footer.jsp" />
</body>
</html>