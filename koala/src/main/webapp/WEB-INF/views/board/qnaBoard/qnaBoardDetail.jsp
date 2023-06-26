<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<style>
    body{
        background-color: black;
        box-sizing: border-box;
        }
    .wrapper{
        width: 100%;
        height: 1200px;
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
        width: 30%;
        float: left;
        margin-left: 30px;
    }
    .board_title>span{
        color: rgb(255, 201,20);
        font-size: 40px;
        font-weight: bold;
    }
    .control_area{
        width: 57%;
        height: 100%;
        display: flex;
        justify-content: end;
        margin-bottom: -60px;
    }
    .control_area button {
        margin-right: 10px;
    }
    .control_area button[type="reset"]:hover {
        color: black;
        border: 1px solid grey;
    }
    .control_area button[type="submit"]:hover {
        color: black;
        border: 1px solid grey;
    }
    .control_area button[type="reset"]{
        background-color: rgb(206, 145,120);
        color: white;
        font-weight: bold;
        width: 70px;
        height: 30px;
        border-radius: 4px;
        cursor: pointer;
    }
    .control_area button[type="submit"]{
        background-color: rgb(106, 153,85);
        color: white;
        font-weight: bold;
        width: 70px;
        height: 30px;
        border-radius: 4px;
        cursor: pointer;
    }
    .middle_area{
        color: white;
        width: 80%;
        height: 400px;
        text-align: left;
    }
    .middle_area table{
        width: 100%;
        height: 100%;
        border-top: 1px solid grey;
        border-bottom: 1px solid grey;
        border-collapse : collapse;
        margin-bottom: 20px;
    }
    .middle_area table > thead > tr>th{
        height: 30px;
        border-bottom: 1px solid grey;
        color: rgb(255, 201,20);
        font-size: 13px;
    }
    .middle_area table > tbody > tr > td:last-child {
        vertical-align: top;
        padding-top: 20px;
        padding-left: 20px;
        font-size: 11px;
    }

    .button_area button{
        background-color: rgb(156, 220, 254);
        border-radius: 4px;
        font-weight: bold;
        height: 40px;
        width: 70px;
        font-size: 12px;
        cursor: pointer;
    }

    .button_area button[type=submit]:hover{
        background-color: rgb(86,156,214);
        color: white;
    }

    .bottom_area{
        margin-top: 80px;
        width: 80%;     
    }
    
    .bottom_area table{
        border-top: 1px solid grey;
        color: white;
        text-align: center;
        width: 100%;
        font-size: 11px;
        /* border-collapse : collapse; */
        padding-bottom: 30px;
    }
    .bottom_area table tr > td{
        border-bottom: 1px solid grey;
        height: 40px;
    }
    .bottom_area table tr > td:nth-child(2){
        text-align: left;
    }


    #reply_table button{
        background-color: rgb(156, 220, 254);
        font-size: 10px;
        font-weight: bold;
        color: black;
        width: 60px;
        height: 25px;
        border-radius: 4px;
        cursor: pointer;
        border: none;
    }

    #reply_table button:hover{
        background: rgb(86,156,214);
        color: white;
    }
    .reply_insert{
        width: 100%;
        display: flex;
        align-items: center;
    }

    .reply_insert textarea{
        width: 90%;
    }

    .repBtn{
        width: 10%;
        margin-left: 10px;
        margin-right: 10px;
        height: 30px;
        background-color: rgb(255, 201,20);
        border-radius: 5px;
        font-weight: bold;
        font-size: 12px;
        cursor: pointer;   
    }

    .repBtn:hover, .repBtn_area button:hover{
        background-color: black;
        color: rgb(255, 201,20);
        border: 1px solid grey;
    }

    .repBtn_area{
        margin-top: 30px;
    }

    .repBtn_area button{
        background-color: rgb(255, 201,20);
        width: 60px;
        font-size: 11px;
        height: 30px;
        border-radius: 5px;
        cursor: pointer;
        font-weight: bold;
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
                <div class="control_area">
                	<c:choose>
	                	<c:when test="${b.boardWriter eq loginUser.userNo.toString() }">
		                    <button type="reset" onclick="formSubmit(1)">글 삭제</button>
		                    <button type="submit" onclick="formSubmit(2)">수정</button>
	                    </c:when>
	                    <c:otherwise>
		                    <button type="reset" style="visibility:hidden;">글 삭제</button>
		                    <button type="submit" style="visibility:hidden;">수정</button>
	                    </c:otherwise>
                    </c:choose>
                </div>
            </div>
            
            <script>
            	function formSubmit(num){
            		var formObj = $("<form>");
            		var bno = $("<input>").prop("type","hidden").prop("name","boardNo").prop("value","${b.boardNo}");
            		var filepath = $("<input>").prop("type","hidden").prop("name","filePath").prop("value","${at.changeName}");
            		var obj = formObj.append(bno);
            		
            		if(num==1){
            			obj.attr("action","updateForm.bo").attr("method","get");
            		}else{
            			obj.append(filePath);
            			obj.attr("action","delete.bo").attr("method","post");
            		}
            	}
            </script> 

            <div class="middle_area">
                <table>
                    <thead>
                        <tr>
                            <th style="width: 10%; text-align: center;">${b.boardNo}</th>
                            <th colspan="3">${b.title }</th>
                        </tr>
                        <tr>
                            <th style="text-align: center;">${b.boardWriter}</th>
                            <th style="width: 10%;">조회 ${b.count}</th>
                            <th style="width: 15%;">${b.createDate}</th>
                            <th>첨부 파일 &nbsp; <!-- ${at.originName} --></th> 
                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="4">${b.content}</td>
                        </tr>
                    </tbody>                   
                </table>
                <div class="button_area">
                    <button type="button">댓글 <span id="rcount"></span></button>
                    <c:choose>
                    <c:when test="${b.boardWriter != loginUser.userNo.toString() }">
                    <button type="submit" onclick="updateLike();">추천 ${b.liked }</button>                    
                    </c:when>
                    <c:otherwise>
                    <button type="submit" disabled>추천 ${b.liked }</button>
                    </c:otherwise>
                    </c:choose>
                    
                </div>
            </div>

			<script>
				$(function(){
					selectReplyList();
				});
				
				function selectReplyList(){
					
					$.ajax({
						url : "selectReply.bo",
						data : {
							boardNo : "${b.boardNo}",
						},
						success : function(list){
							var result = "";
							for(var i in list){
								result += "<tr>"
										+ "<td>"+list[i].replyWriter+"</td>"
										+ "<td>"+list[i].replyContent+"</td>"
										+ "<td>"+list[i].createDate+"</td>"
										+ "<td>"+"<button class='selectBtn'>+채택"+"</button>"+"</td>"
										+ "</tr>"
							}
							
							$("#reply_table").html(result);
							$("#rcount").text(list.length);
						},
						error : function(){
							console.log("댓글 목록 조회 실패");
						}
					});
				}
				
				function insertReply(){
					
					
					$.ajax({
						url : "insertReply.bo",
						data : {
							replyWriter : "${loginUser.userNo}",
							replyContent : $("#content").val(),
							refBno : "${b.boardNo}"
						},
						success : function(result){
							if(result==="success"){
								alert("댓글이 등록되었습니다.");
								selectReplyList();
								$("#content").val("");
							}
						},
						error : function(){
							console.log("댓글 작성 통신 실패")
						}
					});
				}
				
				
				
				function updateLike(){
					console.log("추천");
					var btn = $(this); //클릭된 버튼
					$.ajax({
						type : "POST",
						url : "updateLike",
						dataType : "text",
						data : {
							boardNo : "${b.boardNo}",
							userNo : "${loginUser.userNo}",
							boardWriter : "${b.boardWriter}"
						},
						success : function(likeChk){
							if(likeChk===0){
								console.log("처음하는 추천");
								alert("추천되었습니다!");
								btn.css("background-color", "crimson"); // 버튼의 배경색을 빨간색으로 변경
								location.reload();
							}
							else if(likeChk===1){
								alert("추천이 취소되었습니다.");
								btn.css("background-color", "background-color: rgb(156, 220, 254)"); // 배경색을 초기값으로 변경 (기본 스타일 적용)
								location.reload();
							}
						},
						error : function(){
							console.log("통신 실패");
						}
					});
				}
			</script>
            
            
            <div class="bottom_area">
                <table id="reply_table">
                    <tr>
                        <td>백준왕(작성자)</td>
                        <td>급해서 그런데.. 답변 좀 빨리 부탁 드립니다ㅠ</td>
                        <td>23.06.02.22:10</td>
                        <td><button class="selectBtn">채택</button></td>
                    </tr>
<!--                     <tr> -->
<!--                         <td>백준왕(작성자)</td> -->
<!--                         <td>급해서 그런데.. 답변 좀 빨리 부탁 드립니다ㅠ</td> -->
<!--                         <td>23.06.02.22:10</td> -->
<!--                         <td><button class="selectBtn">채택</button></td> -->
<!--                     </tr> -->
<!--                     <tr> -->
<!--                         <td>백준왕(작성자)</td> -->
<!--                         <td>급해서 그런데.. 답변 좀 빨리 부탁 드립니다ㅠ</td> -->
<!--                         <td>23.06.02.22:10</td> -->
<!--                         <td><button onclick="choice();">채택</button></td> -->
<!--                     </tr> -->
                </table>
                <div class="reply_insert">
                <c:choose>
                	<c:when test="${not empty loginUser }">
                    	<textarea class="form-control" name="content" id="content" cols="30" rows="5" style="resize: none;"></textarea>
                    	<button class="repBtn" onclick="insertReply();">등록</button>
                	</c:when>
                	<c:otherwise>
						<textarea class="form-control" name="content" id="content" cols="30" rows="5" style="resize: none;" readonly>로그인 후 이용 가능합니다.</textarea>
                    	<button class="repBtn" disabled>등록</button>              	
                	</c:otherwise>
                </c:choose>
                </div>

                <div class="repBtn_area">
                    <button type="button" id="back">목륵으로</button>
                    <c:if test="${not empty loginUser }">
                    <button type="submit" onclick="insertBoard();">글쓰기</button>                    
                    </c:if>
                </div>
                
                <script>
                document.querySelector('#back').onclick = function(){
                	history.back();
                }
                
                function insertBoard(){
                	location.href = "enrollForm";
                }
                </script>
            </div>
        </div>
    </div>
    
<jsp:include page="../../common/footer.jsp" />
</body>
</html>