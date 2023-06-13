<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QnA_list</title>
</head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
    body{
        background-color: black;
        box-sizing: border-box;
        }
    .wrapper{
        width: 100%;
        height: 800px;
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
     	margin-top: 20px;
        width: 100%;
        height: 15%;
        display: flex;
        align-items: center;
        margin-bottom: 30px;
    }
    .board_title{
        width: 30%;
        float: left;
        margin-left: 30px;
        margin-right: -30px;
    }
    .board_title>span{
        color: rgb(255, 201,20);
        font-size: 40px;
        font-weight: bold;
    }
    .search_area{
        width: 50%;
        float: left;
    }
    .search_area select{
        width: 15%;
        border: 2px solid rgb(86, 156,214);
        text-align: center;
    }
    .search_area input{
        width: 70%;
        border: 2px solid rgb(86, 156,214);
    }

    .search_area select,
    .search_area input[type="search"],
    .search_area button {
        height: 30px;
        background-color: black;
        color: white;
        font-size: 11px;
        border-radius: 3px;
    }
    .search_area button {
        background-color: rgb(156, 220, 254);
        cursor: pointer;
        color: black;
        font-weight: bold;
        width: 10%;
    }
    .search_area button:hover{
        background-color: rgb(86, 156,214);
        color: white;

    }
    .middle_area{
        color: white;
        width: 90%;
        height: 500px;
        text-align: center;
    }
    .middle_area table{
        width: 100%;
/*         height: 100%; */
        font-size: 12px;
        border-top: 1px solid grey;
        border-bottom: 1px solid grey;

    }
    .middle_area table>thead{
        height: 10%;
        font-size: 13px;
        color: rgb(255, 201,20);        
    }
    .middle_area table>tbody{
        cursor: pointer;
    }
    .middle_area table > thead > tr>th{
    border-bottom: 1px solid grey;
    }
    .middle_area table > tbody > tr > td:nth-child(2){
        text-align: left;
    }
    .middle_area table > tbody > tr:hover{
        opacity: 85%;
    }
    .middle_area table > tbody > tr:nth-child(-n+2){
        color: rgb(206, 145, 120);
        font-weight: bold;
    }
        .insertBtn_area{

        width: 80px;
        margin-left: 40px;
        margin-right: 10px;
        height: 30px;
        background-color: rgb(255, 201,20);
        border-radius: 5px;
        font-weight: bold;
        font-size: 12px;
        cursor: pointer;   
    }

    .insertBtn_area button:hover{
        background-color: black;
        color: rgb(255, 201,20);
        border: 1px solid grey;
    }

    .insertBtn_area{
        margin-top: 10px;
        margin-right: auto;
    }

    .insertBtn_area button{
        background-color: rgb(255, 201,20);
        width: 100%;
        font-size: 11px;
        height: 30px;
        border-radius: 5px;
        cursor: pointer;
        font-weight: bold;
        font-size: 12px;
    }
    .bottom_area{
        display: flex;
        justify-content: center;
        margin-top: 40px;
        cursor: pointer;
    }

    .bottom_area>ul>li{
        font-weight: bold;
        list-style: none;
        float: left;
        margin-right: 10px;
    }
    .bottom_area>ul>li>a{
        color: white;
        text-decoration : none;
    }
    .bottom_area>ul>li>a:hover{
        color: rgb(255, 201,20);
    }

    .bottom_area > ul{
        margin: 0;
        padding: 0;
    }

</style>
<body>
<%@include file="../../common/header.jsp"%>
    <div class="wrapper">

        <div class="body_content">
            <div class="top_area">
                    <div class="board_title">
                        <span>QnA</span>
                    </div>
                <div class="search_area">
                    <select name="search_qna" class="search_title">
                        <option value="writer">작성자</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                    <input type="search" placeholder="검색할 내용을 입력하세요">
                    <button>검색</button>
                </div>
            </div>
            <div class="middle_area">
                <table>
                    <thead>
                        <tr>
                            <th style="width: 9%; height:40px;">글 번호</th>
                            <th style="width: 40%;">제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>조회수</th>
                            <th>추천수</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="b" items="${list }">
                        <tr style="height: 40px;">
                            <td>${b.boardNo }</td>
                            <td>${b.title}</td>
                            <td>${b.boardWriter}</td>
                            <td>${b.createDate}</td>
                            <td>${b.count}</td>
                            <td>${b.liked}</td>
                        </tr>
                    	</c:forEach>
                      
                    </tbody>
                </table>
            </div>

			<c:if test="${not empty loginUser }">
			<div class="insertBtn_area">
                <button type="button"><a href="enrollForm.bo">글쓰기</a></button>
            </div>
            </c:if>
            
        </div>
        <div class="bottom_area">
            <ul>
            	<c:choose>
            		<c:when test="${pi.currentPage eq 1 }">
                <li class="pagingSection"><a class=page-link href="#">&lt;</a></li>
            		</c:when>
            		<c:otherwise>
                <li class="pagingSection"><a class="page-link" href="list.bo?currentPage=${pi.currentPage -1}">&lt;</a></li>	
            		</c:otherwise>
            	</c:choose>
				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                	<li class="pagingSection"><a class="page-link" href="list.bo?currentPage=${p }">${p }</a></li>
            	</c:forEach>
            	<c:choose>
            		<c:when test="${pi.currentPage eq pi.maxPage }">
                <li class="pagingSection"><a class="page-link" href="#">&gt;</a></li>
            		</c:when>
            		<c:otherwise>
            	<li class="pagingSection"><a class="page-link" href="list.bo?currentPage=${pi.currentPage + 1 }">&gt;</a></li>	
            		</c:otherwise>
            	</c:choose>
            </ul>
            

        </div>

	<script>
		$(function(){
			$("tbody>tr").click(function(){
				var bno = $(this).children().eq(0).text();
				location.href="detail.bo?boardNo="+bno;
			});
		});
	</script>

    </div>

<jsp:include page="../../common/footer.jsp" />
</body>
</html>