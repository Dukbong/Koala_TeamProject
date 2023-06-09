<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[Koala] Member List</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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
        color: black;
        font-weight: bold;
        width: 10%;
    }
/*     .search_area button:hover{ */
/*         background-color: rgb(86, 156,214); */
/*         color: white; */

/*     } */
    .middle_area{
        color: white;
        width: 90%;
        height: 500px;
        text-align: center;
    }
    .middle_area table{
        width: 100%;
/*         height: 100%; */
        font-size: 16px;
        border-top: 1px solid grey;
        border-bottom: 1px solid grey;

    }
    .middle_area table>thead{
        height: 13%;
        font-size: 16px;
        color: rgb(255, 201,20);        
    }

    .middle_area table > thead > tr>th{
    	border-bottom: 1px solid grey;
    }
/*     .middle_area table > tbody > tr:nth-child(-n+2){ */
/*         color: rgb(206, 145, 120); */
/*         font-weight: bold; */
/*     } */

</style>
<body>
<%@include file="/WEB-INF/views/common/header.jsp"%>
    <div class="wrapper">

        <div class="body_content">
            <div class="top_area">
                    <div class="board_title">
                        <span>Member List</span>
                    </div>
                <div class="search_area">
                    <select name="search_qna" class="search_title">
                        <option value="writer">작성자</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                    <input type="search" placeholder="검색할 내용을 입력하세요" >
                    <button>검색</button>
                </div>
            </div>
            <div class="middle_area">
                <table>
                    <thead>
                        <tr>
                            <th style="width: 9%; height:40px;">No</th>
                            <th>ID</th>
                            <th>Nick Name</th>
                            <th>E-mail</th>
                            <th>Point</th>
                            <th>Alias</th>
                            <th>Grant</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="m" items="${memberList }">
                        <tr style="height: 40px;">
                            <td class="ii">${m.userNo }</td>
                            <td class="ii">${m.userId }</td>
                            <td class="ii">${m.nickName }</td>
                            <td class="ii">${m.email }</td>
                            <td class="ii">${m.point }</td>
                            
                            <c:choose>
                            	<c:when test="${m.type==2 }">
	                            	<!-- 관리자 -->
		                            <td style="color:red;">Admin</td>                            
                            	</c:when>
                            	<c:when test="${m.type==1 && m.refUno == 0 }">
	                            	<!-- 일반 회원 -->
		                            <td class="ii">Common</td>                            
                            	</c:when>
                            	<c:otherwise>
	                            	<!-- 서포터즈 -->
		                            <td style="color:Green;">Supporters</td>                            
                            	</c:otherwise>
                            </c:choose>
                            
                            <c:if test="${m.type == 2}">
                            </c:if>
                            <c:choose>
                            	<c:when test="${m.type == 2 || m.refUno != 0  }">
                            		<td>-</td>
                            	</c:when>
                            	<c:otherwise>
		                            <td onclick="event.stopPropagation()"><button class="btn btn-success" id="a" type="button">Promote</button></td>                            	
                            	</c:otherwise>
                            </c:choose>
                        </tr>
                    	</c:forEach>
                    </tbody>
                </table>
            </div>
            
        </div>
        <div class="bottom_area">
        <c:if test="${memberList.size()!= 0 }">
         	     <div id="pagingArea">
                        <div class="btnarea">
                            <ul class="pagination">
                            	
                                <c:choose>
                                    <c:when test="${pi.currentPage == 1 }">
                                        <li class="page-item disabled"><a class="page-link" href="#">Prev</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item"><a class="page-link"
                                                href="/koala/admin/member.list?currentPage=${pi.currentPage - 1 }">Prev</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>

                                <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                                    <li class="page-item"><a class="page-link"
                                            href="/koala/admin/member.list?currentPage=${p }">${p }</a></li>
                                </c:forEach>

                                <c:choose>
                                    <c:when test="${pi.currentPage == pi.maxPage }">
                                        <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item"><a class="page-link"
                                                href="/koala/admin/member.list?currentPage=${pi.currentPage + 1 }">Next</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>
                    </div>
                                </c:if>
                <c:if test="${supporterList.size()== 0 }">
                	<div class="binsupport">
                		현재 서포터즈 인원이 없습니다.
                	</div>
                </c:if>
                </div>
        </div>



	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		$(function(){
			clickAndEnter("tbody tr");
			clickAndEnter("#a");
			
			function clickAndEnter(str){
				if(str.includes("#")){					
					let made = $("" + str).on("click", function(){
						console.log($(this));
					}).on("mouseenter", function(){
						$(this).css("cursor", "pointer");
					});
					return made;
				}else{
					let made = $(""+str).on("click", function(){
						location.href="/koala/member/ad?userId=" + $(this).children().eq(1).text();
					}).on("mouseenter", function(){
						$(this).css("cursor", "pointer");
					});
					return made;
				}
			}
		});
	</script>
</body>
</html>