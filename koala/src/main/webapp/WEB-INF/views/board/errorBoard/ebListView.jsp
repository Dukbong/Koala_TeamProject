<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ErrorBoard_List</title>
</head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>

    div{ box-sizing: border-box;}
    .ebListView{width: 1600px; margin:auto; padding: 200px 0px 80px 0px;}
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
        margin-left: 80px;
        margin-right: -120px;
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
        font-size: 13px;
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
        width: 80px;
        height: 30px;
        margin-left: 80px;
        margin-top: 50px;
    }
    .insertBtn_area button{
        background-color: rgb(255, 201,20);
        width: 100%;
        height: 100%;
        border-radius: 5px;
        cursor: pointer; 
        font-weight: bold;
        font-size: 14px;
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

</style>
<body>
<%@include file="../../common/header.jsp"%>
    <div class="ebListView">

		<script>
			$(function(){
				if("${category}"!="" && "${keyword}"!=""){ //검색어 유지
					$("select[name='category']").val("${category}").prop("selected", true);
					$("input[name='keyword']").val("${keyword}");
				}
				
				var color1 = "rgb(255, 201, 20)" //기존색
				var color2 = "rgb(255, 150, 20)"; //표시용 진한색
				
				if("${sort}" != null){ //정렬 유지
					switch ("${sort}") {
					  case "ascDate": $("#sortDate").css("color", color2); break;
					  case "descDate": $("#sortDate").css("color", color1); break;
					  case "descCount": $("#sortCount").css("color", color2); break;
					  case "ascCount": $("#sortCount").css("color", color1); break;
					}
				}
				
				$(".sort").on("click", function(){ // 정렬 변경
					var sort = ($(this).parent().text()).substr(0,3);
					var color = $(this).css("color");
					
					if(sort == "작성일"){ //작성일
						if(color == "rgb(255, 201, 20)"){ //기본정렬
							sort = "ascDate";
							$(this).css("color", color2);
						}else{ //반대정렬
							sort = "descDate";
							$(this).css("color", color1);
						}
					}else{ //조회수
						if(color == "rgb(255, 201, 20)"){ //기본정렬
							sort = "descCount"
							$(this).css("color", color2);
						}else{ //반대정렬
							sort = "ascCount";
							$(this).css("color", color1);
						}
					}			
					
					location.href="list?currentPage=${pi.currentPage}&category=${category}&keyword=${keyword}&sort="+sort;
				})
			})
		</script>
        <div class="body_content">
            <div class="top_area">
                    <div class="board_title">
                        <span>Error</span>
                    </div>
                <div class="search_area">
                	<form action="list">
                    <select name="category" class="search_title">
                    	<option value="">전체</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                        <option value="writer">작성자</option>
                        <option value="library">라이브러리</option>
                    </select>
                    <input type="search" name="keyword" placeholder="검색할 내용을 입력하세요">
                    <button type="submit">검색</button>
                    </form>
                </div>
            </div>
            <div class="middle_area">
                <table>
                    <thead>
                        <tr style="height: 50px;">
                            <th style="width: 90px;">글번호</th>
							<th style="width: 200px;">라이브러리</th>
							<th>제목</th>
							<th style="width: 90px;">작성자</th>
							<th style="width: 100px;">작성일&nbsp;&nbsp;<i id="sortDate" class="fa-solid fa-sort fa- sort" style="color: #ffc914;"></i></th>
							<th style="width: 90px;">조회수&nbsp;&nbsp;<i id="sortCount" class="fa-solid fa-sort fa- sort" style="color: #ffc914;"></i></th>
							<th style="width: 90px;">해결여부</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="eb" items="${ebList}" varStatus="status">
                    	<input type="hidden" name="boardNo" value="${eb.board.boardNo }">
                    		<c:choose>
								<c:when test="${eb.board.notice ne 'Y' }"><tr style="height: 47px;"></c:when>
								<c:otherwise><tr style="height: 47px;" class="notice"></c:otherwise>
							</c:choose>
								<td>${listCount - status.index }</td>
								<td>
									<c:choose>
										<c:when test="${eb.board.notice eq 'Y'}">-</c:when>
										<c:otherwise>${eb.createSetting.settingTitle }</c:otherwise>
									</c:choose>
								</td>
								<td>${eb.board.title } [ ${eb.replyCount } ]</td>
								<td>${eb.board.boardWriter }</td>
								<td>${eb.board.createDate }</td>
								<td>${eb.board.count }</td>
								<td>
									<c:choose>
										<c:when test="${eb.board.notice eq 'Y'}"><span>-</span></c:when>
										<c:when test="${eb.errorBoard.solved eq 'Y'}"><span style="color:gray">해결완료</span></c:when>
										<c:when test="${eb.errorBoard.solved eq 'N'}"><span style="color:rgb(255,116,96);">대기중</span></c:when>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
                    </tbody>
                </table>
                <c:if test="${empty ebList}">게시글이 존재하지 않습니다.. <i class="fa-solid fa-face-sad-cry fa-lg" style="color: #ffffff;"></i></c:if>
            </div>
        </div>
		<div class="insertBtn_area">
			<c:if test="${not empty loginUser }">
				<a href="enrollForm" style="text-decoration: none;"><button type="button">글쓰기</button></a>
			</c:if>
		</div>

		<div class="bottom_area">
            <ul>
            	<c:choose>
            		<c:when test="${pi.currentPage eq 1 }">
                		<li class="pagingSection"><a class=page-link href="#">&lt;</a></li>
            		</c:when>
            		<c:otherwise>
                		<li class="pagingSection"><a class="page-link" href="list?currentPage=${pi.currentPage -1}&category=${category}&keyword=${keyword}&sort=${sort}">&lt;</a></li>	
            		</c:otherwise>
            	</c:choose>
				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
               		<li class="pagingSection"><a class="page-link" 
					<c:if test="${p eq pi.currentPage }">style="color: rgb(255, 201,20);"</c:if> href="list?currentPage=${p }&category=${category}&keyword=${keyword}&sort=${sort}">${p }</a></li>
            	</c:forEach>
            	<c:choose>
            		<c:when test="${pi.currentPage eq pi.maxPage }">
                		<li class="pagingSection"><a class="page-link" href="#">&gt;</a></li>
            		</c:when>
            		<c:otherwise>
            			<li class="pagingSection"><a class="page-link" href="list?currentPage=${pi.currentPage + 1}&category=${category}&keyword=${keyword}&sort=${sort}">&gt;</a></li>	
            		</c:otherwise>
            	</c:choose>
            </ul>
        </div>

	<script>
		$(function(){
			$("tbody>tr").click(function(){
				var bno = $(this).prev().val();
				location.href="detail?boardNo="+bno;
			});
		});
	</script>

    </div>

<jsp:include page="../../common/footer.jsp" />
</body>
</html>