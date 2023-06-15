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
        height: 40px;
        background-color: black;
        color: white;
        font-size: 16px;
        border-radius: 3px;
    }
    .search_area button {
        background-color: rgb(156, 220, 254);
        color: black;
        font-weight: bold;
        border: 2px solid rgb(86, 156,214);
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
<body >
<%@include file="/WEB-INF/views/common/header.jsp"%>
    <div class="wrapper">

        <div class="body_content">
            <div class="top_area">
                    <div class="board_title">
                        <span>Member List</span>
                    </div>
                <div class="search_area">
                <form action="member.list" method="get" id="searchForm" >
                    <select name="searchQna" class="search_title ic" id="serachSelect">
                 		<c:choose>
                 			<c:when test="${empty ms.searchQna }">
		                    	<option value="total" selected>전체보기</option>                 			
		                        <option value="id">아이디</option>
		                        <option value="nickName">닉네임</option>
		                        <option value="etc">권한분류</option> 
                 			</c:when>
                 			<c:when test='${ms.searchQna == "id"}'>
                 				<option value="total">전체보기</option>                 			
		                        <option value="id" selected>아이디</option>
		                        <option value="nickName">닉네임</option>
		                        <option value="etc">권한분류</option> 
                 			</c:when>
                 			<c:when test='${ms.searchQna == "nickName"}'>
                 				<option value="total">전체보기</option>                 			
		                        <option value="id" >아이디</option>
		                        <option value="nickName" selected>닉네임</option>
		                        <option value="etc">권한분류</option> 
                 			</c:when>
                 			<c:when test='${ms.searchQna == "etc"}'>
                 				<option value="total">전체보기</option>                 			
		                        <option value="id" selected>아이디</option>
		                        <option value="nickName">닉네임</option>
		                        <option value="etc" selected>권한분류</option> 
                 			</c:when>
                 		</c:choose>
                        <!-- 아직 안했음 -->
                    </select>
                    <c:choose>
                    	<c:when test="${not empty ms.searchInput }">
		                    <input type="search" name="searchInput" class="ic" id="serachInput" value="${ms.searchInput }" >                    	
                    	</c:when>
                    	<c:otherwise>
	                    	<input type="search" name="searchInput" class="ic" id="serachInput" >                    	
                    	</c:otherwise>
                    </c:choose>
                    <button id="searchBtn" type="button">검색</button>
                </form>
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
                            	<c:when test='${m.githubId.equals(" ")}'>
                            		<td class="ii">WaitList</td>
                            	</c:when>
                            	<c:otherwise>
	                            	<!-- 서포터즈 -->
		                            <td style="color:Green;">Supporters</td>                            
                            	</c:otherwise>
                            </c:choose>
                            
                            <c:if test="${m.type == 2}">
                            </c:if>
                            <c:choose>
                            	<c:when test='${m.type == 2 || m.refUno != 0 && !m.githubId.equals(" ") }'>
                            		<td class="ii">-</td>
                            	</c:when>
                            	<c:when test='${m.githubId.equals(" ")}'>
                            		<td onclick="event.stopPropagation()"><button class="btn btn-danger cancelBtn" id="${m.userNo}" type="button">&nbsp;Revoke&nbsp;</button></td>    
                            	</c:when>
                            	<c:otherwise>
		                            <td onclick="event.stopPropagation()"><button class="btn btn-success promoteBtn" id="${m.userNo}" type="button">Promote</button></td>                            	
                            	</c:otherwise>
                            </c:choose>
                        </tr>
                    	</c:forEach>
                    </tbody>
                </table>
            </div>
            
        </div>
        <div class="bottom_area">
        <c:if test="${pi.endPage > 1 }">
         	     <div id="pagingArea">
                        <div class="btnarea">
                            <ul class="pagination">
                            	
                                <c:choose>
                                    <c:when test="${pi.currentPage == 1 }">
                                        <li class="page-item disabled"><a class="page-link" href="#">Prev</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <c:choose>
                                    	<c:when test="${empty ms.searchQna && empty ms.searchInput }">
                                    		<li class="page-item"><a class="page-link"
	                                                href="/koala/admin/member.list?currentPage=${pi.currentPage - 1 }">Prev</a>
	                                        </li>
                                    	</c:when>
                                    	<c:otherwise>                                    	
	                                        <li class="page-item"><a class="page-link"
	                                                href="/koala/admin/member.list?searchQna=${ms.searchQna }&searchInput=${ms.searchInput }&currentPage=${pi.currentPage - 1 }">Prev</a>
	                                        </li>
                                    	</c:otherwise>
                                    </c:choose>
                                    </c:otherwise>
                                </c:choose>

                                <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                                <c:choose>
                                	<c:when test="${p == pi.currentPage }">
	                                    <li class="page-item"><a class="page-link" style="font-weight:bold;"
	                                            href="/koala/admin/member.list?searchQna=${ms.searchQna }&searchInput=${ms.searchInput }&currentPage=${p }">${p }</a></li>                                		
                                	</c:when>
                                	<c:otherwise>                                	
	                                    <li class="page-item"><a class="page-link"
	                                            href="/koala/admin/member.list?searchQna=${ms.searchQna }&searchInput=${ms.searchInput }&currentPage=${p }">${p }</a></li>
                                	</c:otherwise>
                                </c:choose>
                                </c:forEach>

                                <c:choose>
                                    <c:when test="${pi.currentPage == pi.maxPage }">
                                        <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    
                                    <c:choose>
                                    	<c:when test="${empty ms.searchQna && empty ms.searchInput }">
                                    		<li class="page-item"><a class="page-link"
	                                                href="/koala/admin/member.list?currentPage=${pi.currentPage + 1 }">Next</a>
	                                        </li>
                                    	</c:when>
                                    	<c:otherwise>                                    	
	                                        <li class="page-item"><a class="page-link"
	                                                href="/koala/admin/member.list?searchQna=${ms.searchQna }&searchInput=${ms.searchInput }&currentPage=${pi.currentPage + 1 }">Next</a>
	                                        </li>
                                    	</c:otherwise>
                                    </c:choose>
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
			
			// 부득이하게 엔터를 막았다...
			$(document).ready(function() {
			  $(window).keydown(function(event){
			    if(event.keyCode == 13) {
			      event.preventDefault();
			      return false;
			    }
			  });
			});
			
			
			$("#serachSelect").on("change", function(){
				if($(this).val() == "etc") {
					$("#serachInput").attr("placeholder", "   admin | supporter | wait | common");
				}
				if($(this).val() == "nickName") {
					$("#serachInput").attr("placeholder", "   닉네임을 입력하세요.");
				}
				if($(this).val() == "id") {
					$("#serachInput").attr("placeholder", "   아이디를 입력해주세요.");
				}
				if($(this).val() == "total") {
					$("#serachInput").attr("placeholder", "   검색어 없이 조회가 가능합니다.");
				}
			});
			
			//검색 관련 
			$("#searchBtn").on("click", function(e){
				var input = $("#serachInput").val();
				var select = $("#serachSelect").val();
				if(select != "total" && input == ""){
					alert("정확한 검색 결과를 위해 모두 입력 부탁드립니다.");
					return;
				}
				if(select == "etc"){
					const etcArr = ["admin", "supporter", "wait", "common"];
					if(!etcArr.includes(input)){
						alert("권한의 경우 admin/supporter/wait/common 중에 선택하셔야 합니다.");
						return;
					}
				}
				setTimeout(() => {
					
				$("#searchForm").submit();
				}, 3000);
			});
			
			// 우클릭 드레그 방지..
			$("body").attr("oncontextmenu","return false").attr("ondragstart","return false").attr("onselectstart","return false");
			// 클릭 이벤트 및 포인터
			clickAndEnter("tbody tr");
			clickAndEnter(".promoteBtn");
			clickAndEnter(".cancelBtn");
			
			function clickAndEnter(str){
				if(str.includes(".")){		
					if(str.includes("promote")){						
						let made = $("" + str).on("click", function(){
							$.ajax({
								url : "/koala/promote/promote.waiting",
								data : {
									client_No : this.id,
								},
								success : function(data){
									alert("서포터즈로 초대하였습니다.");
									location.href="member.list";
								},
								error : function(){
									console.log("git hub waiting error")
								}
							});
							console.log(this.id);
						}).on("mouseenter", function(){
							$(this).css("cursor", "pointer");
						});
						return made;
					}else{
						let made = $("" + str).on("click", function(){
							$.ajax({
								url : "/koala/promote/promote.cancel",
								data : {
									client_No : this.id,
								},
								success : function(data){
									alert("초대를 취소하였습니다.");
									location.href="member.list";
								},
								error : function(){
									console.log("git hub error")
								}
							});
							console.log(this.id);
						}).on("mouseenter", function(){
							$(this).css("cursor", "pointer");
						});
						return made;
					}
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