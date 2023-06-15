<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    div{ box-sizing: border-box;}
    .ebDetailView{width: 1200px; margin: auto; padding: 80px 0px;}
    .ebDetailView>div{width: 100%;}
    
    .basic-area{height: 600px; margin-bottom: 50px;}
    .basic-area>div{height: 100%; float: left;}
    .board-area, .reply-area{width: 50%;}

    .board-area>div{width: 90%;}
    .lib-info{height: 10%; position: relative;}
    .board-form{height: 80%; background-color: black; padding: 10px;}
    .addDetailBtn{height: 10%;}

    #libTitle{
        width: max-content;
        height: 30px;
        background-color: skyblue;
        position: absolute;
        margin: auto;
        left: 0;
        bottom: 0;
    }
    #solved{
        width: max-content;
        border-radius: 5px;
        background-color: rgb(125, 204, 122);
        position: absolute;
        margin: auto;
        right: 0;
        bottom: 0;
    }

    .board-form>div{width: 100%;}
    .board-form *{text-align: center;}
    .board-area{font-size: 15px;}
    span{font-weight: 700; padding-right: 30px;}
    .bWriterDate>div{float: left;}

    .addDetailBtn>div{ 
        width: 30%; 
        height: 100%; 
        margin: auto; 
        position: relative; 
    }
    .addDetailBtn button{
    	position: absolute;
    	margin: auto;
    	bottom: 0;
    	left: 0;
    	right: 0;
    }
    
/*     ======================================================= */
	.reply-area>div{
		border: 1px solid blue;
		width: 100%;
		
	}
	.replyWrite-area{
		height: 20%;
		
	}
	.replyList-area{
		height: 80%;
	}
	
	#reply-form{width:90%; height: 100%; margin: auto;}
	#reply-form>*{
		height: 80%;
		border: 0;
		padding: 0;
		border-radius: 10px;
		float: left;
	}
	#reply-form>textarea{
		width: 80%;
	}
	#reply-form>button{
		width: 20%;
	}
	
	.replyList-area{overflow:scroll;}
	.replyList-area>table{
		background-color: black;
		width: 90%;
		margin: auto;
		margin-top: 30px;
	}
	
	

    
/*     ======================================================= */
    .modal-wrap{
        display: none;
        width: 950px;
        height: 550px;
        position: absolute;
        top:50%;
        left: 50%;
        margin: -100px 0 0 -475px;
        background-color: rgb(30, 30, 30);
        border: 2px solid gray;
        color: white;
    }
    .modal_close{
    	background-color: rgb(30, 30, 30);
        width: 26px;
        height: 26px;
        position: absolute;
        top: -16px;
        right: 0;
    }
    .modal_close>i{
        display: block;
        width: 100%;
        height: 100%;
    }
    
    .modifyForm-area{width: 95%; height: 95%; display: block; margin: auto;}
    .modifyForm-top{width: 100%; height: 8%; position: relative;}
    .modifyForm-top>span{ font-size: 20px; color: rgb(255, 201,20); position: absolute; margin: auto; bottom: 5px;}
    .modifyForm-bottom{width: 100%; height: 92%;}
    .modifyForm-bottom>div{height: 100%; float: left;}
    .modifyForm_1, .modifyForm_3{width: 47%; background-color: black; padding : 10px;}
    .modifyForm_2{width: 6%; display: flex; justify-content: center; align-items: center;}
    textarea{
    	width: 100%;
    	height: 100%;
    	background-color: black;
    	color : white;
    	resize: none;
    	border: none;
        outline: none;
    }
    .modal-area{
    	border: 1px solid boue;
    	width: 100%;
    	height: 100%;
    }

</style>

<body>
	<%@include file="../../common/header.jsp"%>
	<div class="ebDetailView">
	
	    <div class="basic-area">
	        <div class="board-area">
	            <div class="lib-info">
	                <div id="libTitle">&nbsp;<span><b>${eb.createSetting.settingTitle}</b></span> ${eb.createSetting.settingVersion}&nbsp;</div>
	                <div id="solved">
	                	<c:choose>
	                		<c:when test="${eb.errorBoard.errorType eq 'U'}">&nbsp;user error&nbsp;</c:when>
	                	</c:choose>
	                	<c:choose>
	                		<c:when test="${eb.errorBoard.errorType eq 'S'}">&nbsp;code error&nbsp;</c:when>
	                	</c:choose>
	                </div>
	            </div>
	            <div class="board-form">
	                <div class="bTitle">
	                    <span>제목</span> ${eb.board.title }
	                </div>
	                <hr>
	                <div class="bWriterDate">
	                    <div class="bWriter" style="width: 50%;">
	                        <span>작성자</span> ${eb.board.boardWriter }
	                    </div>
	                    <div class="bDate" style="width: 50%;">
	                        <span>작성날짜</span> ${eb.board.createDate }
	                    </div>
	                </div>
	                <hr>
	                <div class="bContent"> ${eb.board.content }</div>
	            </div>
	            <div class="addDetailBtn">
	            	<div>
	            		<c:if test="${!empty eb.errorBoard.modifiedCode and empty eb.errorBoard.modifiedInfo}">
	            			<button type="button" id="codeDetailBtn">코드 비교폼</button>
	            		</c:if>
	            		<c:if test="${empty eb.errorBoard.modifiedCode and !empty eb.errorBoard.modifiedInfo}">
	            			<button type="button" id="codeDetailBtn">설명서 비교폼</button>
	            		</c:if>
	               	</div>
	            </div>
	        </div>
	
	        <div class="reply-area" style="border: 1px solid red">
	        	<div class="replyWrite-area">
	        		<form action="insertReply" id="reply-form">
	        			<textarea rows="" cols="">댓글을 작성해주세요.</textarea>
	        			<button type="submit">작성</button>
	        		</form>
	        	</div>
	        	<div class="replyList-area">
	        		<table>
	        			<tr>
	        				<td rowspan="2" style="width: 50px; height: 50px;"><i class="fa-solid fa-user-secret fa-2xl" style="color: #ffffff;"></i></td>
	        				<td style="height: 25px;">orange077</td>
	        				<td>2023-06-15</td>
	        			</tr>
	        			<tr>
	        				<td></td>
	        				<td></td> <!-- 시간도 하려면 데이터 변경하기 -->
	        			</tr>
	        			<tr>
	        				<td colspan="3">저도 설치 중 오류가 발생하네요..</td>
	        			</tr>
	        		</table>
	        		<table border="1">
	        			<tr>
	        				<td rowspan="2" style="width: 50px; height: 50px;">사진</td>
	        				<td style="height: 20px;"></td>
	        				<td></td>
	        			</tr>
	        			<tr>
	        				<td>닉네임</td>
	        				<td>날짜</td>
	        				
	        			</tr>
	        			<tr>
	        				<td colspan="3">댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용v댓글내용</td>
	        			</tr>
	        		</table>
	        		<table border="1">
	        			<tr>
	        				<td rowspan="2" style="width: 50px; height: 50px;">사진</td>
	        				<td style="height: 20px;"></td>
	        				<td></td>
	        			</tr>
	        			<tr>
	        				<td>닉네임</td>
	        				<td>날짜</td>
	        				
	        			</tr>
	        			<tr>
	        				<td colspan="3">댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용v댓글내용</td>
	        			</tr>
	        		</table>
	        		<table border="1">
	        			<tr>
	        				<td rowspan="2" style="width: 50px; height: 50px;">사진</td>
	        				<td style="height: 20px;"></td>
	        				<td></td>
	        			</tr>
	        			<tr>
	        				<td>닉네임</td>
	        				<td>날짜</td>
	        				
	        			</tr>
	        			<tr>
	        				<td colspan="3">댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용v댓글내용</td>
	        			</tr>
	        		</table>
	        		<table border="1">
	        			<tr>
	        				<td rowspan="2" style="width: 50px; height: 50px;">사진</td>
	        				<td style="height: 20px;"></td>
	        				<td></td>
	        			</tr>
	        			<tr>
	        				<td>닉네임</td>
	        				<td>날짜</td>
	        				
	        			</tr>
	        			<tr>
	        				<td colspan="3">댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용v댓글내용</td>
	        			</tr>
	        		</table>
	        		<table border="1">
	        			<tr>
	        				<td rowspan="2" style="width: 50px; height: 50px;">사진</td>
	        				<td style="height: 20px;"></td>
	        				<td></td>
	        			</tr>
	        			<tr>
	        				<td>닉네임</td>
	        				<td>날짜</td>
	        				
	        			</tr>
	        			<tr>
	        				<td colspan="3">댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용v댓글내용</td>
	        			</tr>
	        		</table>
	        		<table border="1">
	        			<tr>
	        				<td rowspan="2" style="width: 50px; height: 50px;">사진</td>
	        				<td style="height: 20px;"></td>
	        				<td></td>
	        			</tr>
	        			<tr>
	        				<td>닉네임</td>
	        				<td>날짜</td>
	        				
	        			</tr>
	        			<tr>
	        				<td colspan="3">댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용v댓글내용</td>
	        			</tr>
	        		</table>
	        	</div>
	        </div>
	
	    </div>
	    
    </div>
    
    <div class="modal-wrap">
        <div class="modal_close" id="cancle"><i class="fa-solid fa-square-xmark fa-2xl" style="color: #ffd814;"></i></div>
        <div class="modal-area">
        
        	<div class="modifyForm-area">
				<div class="modifyForm-top">
					<span>code</span>
				</div>
				<div class="modifyForm-bottom">
					<div class="modifyForm_1">
						<textarea id="before" cols="30" rows="10" readonly>ajax로 해당 내용 가져오기</textarea>
					</div>
					<div class="modifyForm_2">
						<i class="fa-solid fa-angles-right fa-2x" style="color: #ffffff;"></i>
					</div>
					<div class="modifyForm_3">
						<textarea id="after" cols="30" rows="10" readonly>ajax로 해당 내용 가져오기</textarea>
					</div>
				</div>
			</div>
        
        </div>
        
        <script>
        	//모달창 열고 닫기
			$(function(){
				$("button[id*='DetailBtn']").on("click", function(){
					$('html').animate({scrollTop : $(".ebDetailView").offset().top}, 300);
					$(".modal-wrap").css("display", "block");
				});
				$("#cancle").on("click", function(){
					$('html').animate({scrollTop : $(".ebDetailView").offset().top}, 300);
					$(".modal-wrap").css("display", "none");
				});
			});
		</script>

    </div>
    
	<%@include file="../../common/footer.jsp"%>
</body>
</html>