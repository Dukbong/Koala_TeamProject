<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ErrorBoard_DetailView</title>
</head>
<style>
    div{ box-sizing: border-box;}
    .ebDetailView{width: 1200px; margin: auto; padding: 100px 0px;}
    .ebDetailView>div{width: 100%;}
    
    .total-area{height: 750px;}
    .total-area>div{height: 100%; float: left;}
    .board-area, .reply-area{width: 50%;}

    .board-area>*{width: 90%;}
    .lib-info{height: 10%; position: relative;}
    .board-table{height: 70%; background-color: black; padding: 10px; border: 1px solid rgb(10, 40, 90);}
    .addDetailBtn{height: 10%;}
    .updateDeleteBtn{height: 10%; position: relative;}

	#libTitle, #solved{
		width: max-content;
		border-radius: 6px 6px 0px 0px;
		border: 1px solid rgb(10, 40, 90);
		position: absolute;
		margin: auto;
		bottom: 0;
	}
    #libTitle{background-color: rgb(35, 100, 233); left: 0;}
    #solved{background-color: rgb(40, 151, 223); right: 0;}


    .board-area{font-size: 16px;}
    .board-table *{text-align: left; padding-left: 20px;}
    .board-table th{text-decoration: underline;} 

    .addDetailBtn>div{ 
        width: 50%; 
        height: 100%; 
        margin-top: 10px;
        margin-left: 260px;
    }
    #codeDetailBtn, #infoDetailBtn{
        background-color: rgb(255, 201,20);
    	width: 120px;
    	height: 30px;
    	margin-left: 10px;
    	float: right;
    	border-radius: 5px;
    	border: 2px solid gray;
    }
    
    #updateBtn, #deleteBtn{
    	width:130px; 
    	height: 40px; 
    	position: absolute; 
    	margin: auto; 
    	bottom: 5px;
    	border-radius: 6px;
    }
    #updateBtn{left: 130px;}
    #deleteBtn{right: 130px;}

    
/* ======================================================= 댓글 영역 */
	.reply-area>div{width: 100%;}
	.replyWrite-area{height: 15%;}
	.replyList-area{height: 85%;}
	
	#reply-form{width:90%; height: 100%; margin: auto;}
	#reply-form>*{
		height: 80%;
		border: 0;
		padding: 0;
		border-radius: 10px;
		float: left;
	}
	#reply-form>textarea{width: 80%;}
	#reply-form>button{width: 20%;}
	
	.replyList-area{overflow-y:scroll;}
	.replyList-area>table{
		width: 90%;
		margin: auto;
		margin-top: 50px;
		border-radius: 5px;
		border-top: 1px solid gray;
		border-bottom: 1px solid rgb(10, 40, 90);
	}
	.replyList-area::-webkit-scrollbar {width: 4px;}
	.replyList-area::-webkit-scrollbar-thumb {background: rgba(105, 105, 105); border-radius: 10px;}
	.replyList-area::-webkit-scrollbar-track {background: rgba(105, 105, 105, .2);}
    
/* ======================================================= 모달창  */
    .modal-wrap{
        display: none;
        width: 1000px;
        height: 600px;
        position: absolute;
        top:50%;
        left: 50%;
        margin: -100px 0 0 -500px;
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
	
	    <div class="total-area">
	        <div class="board-area">
	            <div class="lib-info">
	                <div id="libTitle">&nbsp;<span style="font-size: 18px;"><b>${eb.createSetting.settingTitle}</b></span>&nbsp;&nbsp;${eb.createSetting.settingVersion}&nbsp;</div>
	                <div id="solved">
	                	<c:choose>
	                		<c:when test="${eb.errorBoard.errorType eq 'U'}">&nbsp;user error&nbsp;</c:when>
	                	</c:choose>
	                	<c:choose>
	                		<c:when test="${eb.errorBoard.errorType eq 'S'}">&nbsp;code error&nbsp;</c:when>
	                	</c:choose>
	                </div>
	            </div>
				<table class="board-table">
					<tr>
						<th style="width: 20%; height: 60px;">Title</th>
						<td colspan="3">${eb.board.title }</td>
					</tr>
					<tr>
						<th style="width: 20%; height: 60px;">Writer</th>
						<td style="width: 30%;">${eb.board.boardWriter }</td>
						<th style="width: 20%;">Date</th>
						<td>${eb.board.createDate }</td>
					</tr>
					<tr>
						<th style="width: 20%;">Content</th>
						<td colspan="3">${eb.board.content }</td>
					</tr>
				</table>
	            <div class="addDetailBtn">
	            	<div>
	            		<c:if test="${!empty eb.errorBoard.modifiedInfo}">
	            			<button type="button" id="infoDetailBtn" value="info">설명서 비교폼</button>
	            		</c:if>
	            		<c:if test="${!empty eb.errorBoard.modifiedCode}">
	            			<button type="button" id="codeDetailBtn" value="code">코드 비교폼</button>
	            		</c:if>
	               	</div>
	            </div>
	            <div class="updateDeleteBtn">
	            <!-- 작성자 로그인유저 조건걸기 -->
	            	<c:if test="${eb.board.boardWriter.equals(loginUser.nickName) }">
		            	<button type="button" id="updateBtn" onclick="updateBoard();">수정하기</button>
		            	<button type="button" id="deleteBtn" onclick="deleteBoard();">삭제하기</button>
	            	</c:if>
	            </div>
	        </div>
	        <script>
		        function updateBoard(){
		        	if('${eb.errorBoard.solved}'=='N' && '${eb.errorBoard.errorType}'=='N'){ //사용자 오류일 경우에 게시글 수정할 수 있게 할지
		        		location.href="updateForm?boardNo="+${eb.board.boardNo};
		        	}else{
		        		alert("해당 게시글은 관리자 확인이 완료되어 수정이 불가능합니다.");
		        	}
		        }
		        function deleteBoard(){
		        	if(confirm("삭제된 게시글은 복구가 불가합니다. 정말로 삭제를 진행하시겠습니까?")){
		        		location.href="deleteBoard?boardNo="+${eb.board.boardNo};
		        	}
		        }
	        </script>
	
	        <div class="reply-area">
	        	<div class="replyWrite-area">
	        		<div id="reply-form" method="post">
	        			<textarea rows="" cols="" name="replyContent" placeholder="댓글을 작성해주세요."></textarea>
	        			<button id="insertReply">작성</button>
	        		</div>
	        	</div>
	        	<div class="replyList-area">
        			<c:forEach var="re" items="${reList }">
	        			<table>
	        				<tr>
		        				<td style="width: 50px; height: 50px;"><i class="fa-solid fa-user-secret fa-2xl" style="color: #ffffff;"></i></td>
		        				<td style="width: max-content;">${re.replyWriter }</td>
		        				<td style="width: 100px; text-align: center;">
		        					<c:if test="${re.replyWriter eq loginUser.nickName }">
		        						<input type="hidden" value="${re.replyNo }">
			        					<button id="updateReply">수정</button><button id="deleteReply">삭제</button>
		        					</c:if>
		        				</td>
		        				<td style="width: 150px;">${re.createDate }</td>
		        			</tr>
		        			<tr style="display: ;">
		        				<td></td>
		        				<td colspan="3" style="padding-right: 50px;">${re.replyContent }</td>
		        			</tr>
		        			<tr style="display: none;">
		        				<td></td>
		        				<td colspan="3" style="padding-right: 50px;"><textarea style="border: 1px solid white; padding: 5px;">${re.replyContent }</textarea></td>
		        			</tr>
		        		</table>
        			</c:forEach>
	        	</div>
	        </div>
	    </div>
    </div>
    <script>
    	//댓글 관련
    	$(function(){
    		//댓글 작성
    		$("#insertReply").on("click", function(){
    			$.ajax({
    				url : "insertReply",
    				type : "POST",
					data : {
						refBno: ${eb.board.boardNo},
						replyWriter: ${loginUser.userNo},
						replyContent: $("textarea[name='replyContent']").val()
					},
					success : function(result){
						if(result>0){
							alert("댓글이 성공적으로 등록되었습니다.");
							location.reload();
						}else{
							alert("댓글 작성에 실패했습니다.")
						}
					}
    			});
    		});
    		
    		//댓글 삭제
    		$(".replyList-area").on("click", "button[id='deleteReply']", function(){
    			
    			$.ajax({
    				url : "deleteReply",
    				type : "GET",
					data : { replyNo: $(this).siblings(':eq(0)').val() },
					success : function(result){
						if(result>0){
							alert("댓글이 성공적으로 삭제되었습니다.");
							location.reload();
						}else{
							alert("댓글 삭제에 실패했습니다.")
						}
					}
    			});
    		});
    		
    	});
    </script>
    
    <div class="modal-wrap">
        <div class="modal_close" id="cancle"><i class="fa-solid fa-square-xmark fa-2xl" style="color: #ffd814;"></i></div>
        <div class="modal-area">
        
        <script>
        	//모달창 열고 닫기
			$(function(){
				var str1 = '${eb.errorBoard.modifiedCode}';
				var str2 = '${eb.createSetting.settingCode}';
				var str3 = '${eb.errorBoard.modifiedInfo}';
				var str4 = '${eb.createSetting.settingInfo}';
				
				
				$("button[id*='DetailBtn']").on("click", function(){
					$('html').animate({scrollTop : $(".ebDetailView").offset().top}, 300);
					$(".modal-wrap").css("display", "block");
					if($(this).val() == 'code'){
						$("#before").html(str2);
						$("#after").html(str1);
					}else{
						$("#before").html(str4);
						$("#after").html(str3);
					}
				});
				$("#cancle").on("click", function(){
					$('html').animate({scrollTop : $(".ebDetailView").offset().top}, 300);
					$(".modal-wrap").css("display", "none");
				});
			});
		</script>
        
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
        

    </div>
    
	<%@include file="../../common/footer.jsp"%>
</body>
</html>