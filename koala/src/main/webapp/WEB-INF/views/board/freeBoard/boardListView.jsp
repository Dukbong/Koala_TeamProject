<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div{ box-sizing: border-box;}
    .body_content{
    	width: 1600px; 
    	margin:auto; 
    	padding: 200px 0px 80px 0px;
    }
    .body_content{
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
        width: 100%;
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
        margin-left: 65px;
        margin-right: -65px;
    }
    .board_title>span{
        color: rgb(255, 201,20);
        font-size: 40px;
        font-weight: bold;
    }
    #search-area{
        margin-top: 25px;
        margin-left: 80px;
        width: 100%;
        float: left;
    }
    #search-area select{
        width: 10%;
        border: 2px solid rgb(120, 74, 207);
        text-align: center;
    }
    #search-area input{
        width: 30%;
        height: 30px;
        border: 2px solid rgb(120, 74, 207);
    }

    #search-area select,
    #search-area input[type="search"],
    #search-area button {
        height: 30px;
        background-color: rgb(48, 162, 188);
        color: white;
        font-size: 13px;
        border-radius: 3px;
    }
    #search-area button {
        background-color: rgb(120, 74, 207);
        cursor: pointer;
        color: black;
        font-weight: bold;
        width: 10%;
    }
    #search-area button:hover{
        background-color: rgb(78, 72, 178);
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
        font-size: 14px;
        border-top: 1px solid grey;
        border-bottom: 1px solid grey;
	    border-collapse : collapse;
    }
    .middle_area table>thead{
        height: 10%;
        font-size: 14px;
        color: rgb(255, 201,20);        
    }
    .middle_area table>tbody{
        cursor: pointer;
    }
    .middle_area table > thead > tr>th{
        border-bottom: 1px solid grey;
    }
    .middle_area table > tbody > tr:hover{
        opacity: 85%;
    }
    .middle_area i:hover{
    	cursor: pointer;
    }
    .notice{
        color: rgb(206, 145, 120);
        font-weight: bold;
    }
    .insertBtn_area{
        width: 100%;
        height: 30px;
        margin-right: 130px;
        margin-top: 0px;
    }
    .insertBtn_area button{
        background-color: rgb(255, 201,20);
        width: 5%;
        height: 100%;
        border-radius: 5px;
        font-weight: bold;
        font-size: 14px;
        float: right;
    }
    .insertBtn_area button:hover{
        background-color: black;
        color: rgb(255, 201,20);
        border: 1px solid grey;
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
    svg{
        width: 30px;
        height: 30px;
    }
</style>
</head>
<body>
	<%@include file="../../common/header.jsp" %>
	<div class="body_content">
		<div class="top_area">
			<div class="board_title">
	        	<span>BulletinBoard</span>
	        </div>
			<div id="search-area">
				<form action="search" method="get">
					<select name="types" class="search_title">
						<option value="writer">작성자</option>
						<option value="content">내용</option>
						<option value="title">제목</option>
					</select>
					<input type="text" name="keyword" value="${keyword }">
					<button type="submit">검색</button>
				</form>
			</div>
		</div>
		<br>
		<div class="middle_area">
			<c:if test="${not empty status }">
				<script>
					$(function(){
						$("#search-area").each(function(){
							if($(this).val()=='${status}'){
								$(this).attr("selected",true);
							}
						})
					});
				</script>
			</c:if>
			<table id="list-area" >
				<thead>
					<tr>
						<th>글번호</th>
						<th width="400">제목</th>
						<th>첨부파일</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="b" items="${bbList }">
						<tr onclick="location.href='detail?boardNo=${b.boardNo}'">
							<td>${b.boardNo }</td>
							<td>${b.title }</td>
							<c:choose>
								<c:when test="${b.fileNo ne 0}">
									<td><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><title>file-document-outline</title><path d="M6,2A2,2 0 0,0 4,4V20A2,2 0 0,0 6,22H18A2,2 0 0,0 20,20V8L14,2H6M6,4H13V9H18V20H6V4M8,12V14H16V12H8M8,16V18H13V16H8Z" /></svg></td>
								</c:when>
								<c:otherwise>
									<td></td>
								</c:otherwise>
							</c:choose>
							<td>${b.boardWriter }</td>
							<td>${b.count }</td>
							<td>${b.createDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<br>
		<div class="insertBtn_area">
			<c:if test="${not empty loginUser }">
				<button  onclick="location.href='enroll?boardNo=${b.boardNo}'">글작성</button>
			</c:if>
		</div>
		<div class="bottom_area">
			<c:choose>
				<c:when test="${pi.currentPage eq 1 }">
					<a disabled>이전</a>
				</c:when>
				<c:otherwise>
					<a href="list.bo?currentPage=${pi.currentPage-1 }">이전</a>
				</c:otherwise>
			</c:choose>
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }" step="1">
				<c:choose>
					<c:when test="${empty types }">
						<a href="list.bo?currentPage=${p }">${p }</a>
					</c:when>
					<c:otherwise>
						<a href="koala/bulletinBoard/search?currentPage=${p }&status=${types}&keyword=${keyword}">${p }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${pi.currentPage eq pi.maxPage }">
					<a disabled>다음</a>
				</c:when>
				<c:otherwise>
					<a id="next" href="list.bo?currentPage=${pi.currentPage+1 }">다음</a>
				</c:otherwise>
			</c:choose>
		</div>
		<br><br>
	</div>
	<jsp:include page="../../common/footer.jsp"/>
</body>
</html>