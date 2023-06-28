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
    .ebDetailView{width: 1400px; margin: auto; padding: 250px 0px 130px 0px;}
    .ebDetailView>div{width: 100%;}
    
    .total-area{height: 750px;}
    .total-area>div{height: 100%; float: left;}
    .board-area, .reply-area{width: 42%;}
    .space{width: 16%;}
/* ======================================================= 게시글 영역 */
    .board-area>*{width: 100%;}
    .lib-info{height: 7%; position: relative;}
    .board-box{height: 78%; background-color: black; padding: 10px;}
    .addDetailBtn{height: 10%;}
    .updateDeleteBtn{height: 5%; position: relative;}

	#libTitle, #solved{
		width: max-content;
		border-radius: 7px 7px 0px 0px;
		position: absolute;
		margin: auto;
		bottom: 0;
	}
    #libTitle{background-color: rgb(4, 64, 153); left: 0; height: 45px; padding-top: 7px;}
    #solved{background-color: gray; right: 0; height: 35px; padding-top: 3px;}
    
    .board-box>div{width: 90%; margin: auto;}
    #title{height: 17%; text-align: center; padding-top: 30px; font-size: 19px; font-weight:600;}
    #title>span{background: linear-gradient(to top, rgb(60, 60, 60) 40%, transparent 40%);}
    #writerDate{height: 10%; font-size: 16px; }
    #content{height: 73%;}

    .board-area{font-size: 17px;}
    .addDetailBtn>div{ 
        width: 50%; 
        height: 100%; 
        margin-top: 10px;
        margin-left: 280px;
    }
    #codeDetailBtn, #infoDetailBtn{
        background-color: rgb(255, 201, 20);
    	width: 120px;
    	height: 30px;
    	margin-left: 10px;
    	float: right;
    	border-radius: 5px;
    }
    
    #updateBtn, #deleteBtn{
    	width:120px; 
    	height: 35px; 
    	position: absolute; 
    	margin: auto; 
    	bottom: 5px;
    	border-radius: 6px;
    }
    #updateBtn{left: 160px;}
    #deleteBtn{right: 160px;}
/* ======================================================= 댓글 영역 */
	.reply-area>div{width: 100%;}
	.replyWrite-area{height: 15%;}
	.replyList-area{height: 85%;}
	
	#reply-form{width:100%; height: 90%; background-color: black; padding: 10px;}
	#reply-form>*{
		height: 100%;
		border: 0;
		padding: 0;
		float: left;
		border-radius: 10px;
	}
	#reply-form>textarea{width: 90%; resize: none;}
	#reply-form>button{width: 10%;}
	
	.replyList-area>table{
		width: 98%;
 		margin-left: 5px;
 		margin-top: 25px;
		margin-bottom: 25px;
		border: 3px solid rgb(80,80,80);
	}
    
    .replyList-area img{width:100%; height: 100%;}
/* ======================================================= 모달창  */
    .modal-wrap{
        display: none;
        width: 1100px;
        height: 650px;
        position: absolute;
        top: 50%;
        left: 50%;
        margin: -250px 0 0 -550px;
        background-color: rgb(30, 30, 30);
        border: 2px solid gray;
        color: white;
    }
    .modal_close{
    	background-color: rgb(30, 30, 30);
        width: 27px;
        height: 27px;
        position: absolute;
        top: -27px;
        right: 0;
    }
    
    .modifyForm-area{width: 95%; height: 95%; display: block; margin: auto;}
    .modifyForm-top{width: 100%; height: 8%; position: relative;}
    .modifyForm-top>span{ font-size: 20px; color: rgb(255, 201,20); position: absolute; margin: auto; bottom: 5px;}
    .modifyForm-bottom{width: 100%; height: 92%;}
    .modifyForm-bottom>div{height: 100%; float: left;}
    .modifyForm_1, .modifyForm_3{width: 47%; background-color: black; padding : 10px;}
    .modifyForm_2{width: 6%; display: flex; justify-content: center; align-items: center;}
    .reply-area textarea, .modal-area textarea{
    	width: 100%;
    	height: 100%;
    	background-color: black;
    	color : white;
    	resize: none;
    	border: none;
        outline: none;
        overflow-y:auto;
    }
    .modal-area{
    	border: 1px solid gray;
    	width: 100%;
    	height: 100%;
    }
    .ebDetailView button:hover{
    	opacity: 85%;
    }
    
    .hover:hover{cursor: pointer;}
    
	.scroll {overflow-y:auto;}
	.scroll::-webkit-scrollbar {width: 4px;}
	.scroll::-webkit-scrollbar-thumb {background: gray; border-radius: 10px;}
</style>

<body>
	<%@include file="../../common/header_copy.jsp"%>
	<div class="ebDetailView">
	    <div class="total-area">
	    	<!-- 게시글 영역 -->
	        <div class="board-area">
	            <div class="lib-info">
	                <div id="libTitle">&nbsp;&nbsp;<span style="font-size: 18px;"><b>${eb.createSetting.settingTitle}</b></span>&nbsp;&nbsp;${eb.createSetting.settingVersion}&nbsp;&nbsp;</div>
                	<c:choose>
                		<c:when test="${eb.errorBoard.errorType eq 'U'}">
                			<div id="solved" style="background-color: rgb(50,100,40);">&nbsp;&nbsp;user error&nbsp;&nbsp;</div>
                		</c:when>
                		<c:when test="${eb.errorBoard.errorType eq 'S'}">
                			<div id="solved" style="background-color: rgb(200,100,80);">&nbsp;&nbsp;code error&nbsp;&nbsp;</div>
                		</c:when>
                	</c:choose>
	            </div>
	            
				<div class="board-box">
					<div id="title"><span>&nbsp;${eb.board.title }&nbsp;</span></div>
					<div id="writerDate"><b>작성자</b> ${eb.board.boardWriter } &nbsp;|&nbsp; <b>작성일</b> ${eb.board.createDate }</div>
					<div id="content">${eb.board.content }</div>
				</div>
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
	        <!-- 게시글 관련 스크립트 -->
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
	        
	        <div class="space"></div>
	
			<!-- 댓글 영역 -->
	        <div class="reply-area">
	        	<div class="replyWrite-area">
	        		<div id="reply-form">
	        			<c:choose>
	        				<c:when test="${eb.errorBoard.solved eq 'Y' and eb.errorBoard.errorType eq 'U'}">
	        					<textarea style="color: pink; font-weight: 600;" readonly>사용자오류 [해결완료]</textarea>
			        			<button disabled>작성</button>
	        				</c:when>
	        				<c:when test="${eb.errorBoard.solved eq 'Y' and eb.errorBoard.errorType eq 'S'}">
	        					<textarea style="color: pink; font-weight: 600;" readonly>해당 라이브러리에 대한 업데이트가 완료되었습니다.</textarea>
			        			<button disabled>작성</button>
	        				</c:when>
	        				<c:when test="${empty loginUser }">
	        					<textarea class="hover" placeholder="로그인 후 이용 가능합니다." readonly onclick="location.href='../member/login'"></textarea>
			        			<button disabled>작성</button>
	        				</c:when>
	        				<c:otherwise>
			        			<textarea name="replyContent" class="scroll" placeholder="댓글을 작성해주세요."></textarea>
			        			<button id="insertReply">작성</button>
	        				</c:otherwise>
	        			</c:choose>
	        		</div>
	        	</div>
	        	<div class="replyList-area scroll">
	        		<c:if test="${empty reList }"><span style="color: pink; font-weight: 600; margin: 180px;">아직 작성된 댓글이 없습니다 !</span></c:if>
        			<c:forEach var="re" items="${reList }">
		        		<input type="hidden" value="${re.replyNo }">
						<table class="reply-table">
	        				<tr>
		        				<td rowspan="2" style="width: 13%; height: 70px;"><img alt="" src="${re.memberImage }"></td>
		        				<td style="width: 37%; vertical-align: bottom;">${re.replyWriter }</td>
		        				<td colspan="2" style="width: 50%; text-align: right;">
		        					<c:if test="${re.replyWriter eq loginUser.nickName }">
			        					<button id="updateReply">수정</button>
			        					<button id="updateCancel" style="display: none;">취소</button>
			        					<button id="deleteReply">삭제</button>
		        					</c:if>
		        				</td>
		        			</tr>
		        			<tr>
		        				<td colspan="3" style="font-size: 14px;">${re.createDate }</td>
		        			</tr>
		        			<tr style="display: ;">
		        				<td colspan="4" style="padding: 10px 20px;">${re.replyContent }</td>
		        			</tr>
							<!-- 댓글 수 정 시 -->		        			
		        			<tr style="display: none;">
		        				<td colspan="3" style="width:90%;"><textarea class="scroll" style="border: 1px solid white; padding: 5px;">${re.replyContent }</textarea></td>
		        				<td style="width: 10%;"><button id="replyBtn">수정하기</button></td>
		        			</tr>
		        		</table>
        			</c:forEach>
	        	</div>
	        </div>
	        <!-- 댓글 관련 스크립트 -->
		    <script>
		    	$(function(){
		    		//서포터즈 댓글 표시
		    		
		    		
		    		//댓글 수정폼
		    		$(".reply-table").on("click", "button[id='updateReply']", function(){
		    			$(this).css("display", "none");
		    			$(this).parents("tr").siblings().eq(1).css("display", "none");
		    			$(this).next().css("display", "inline");
		    			$(this).parents("tr").siblings().eq(2).css("display", "");
		    		});
		    		
		    		//수정 취소
		    		$(".reply-table").on("click", "button[id='updateCancel']", function(){
		    			$(this).css("display", "none");
		    			$(this).parents("tr").siblings().eq(1).css("display", "");
		    			$(this).prev().css("display", "inline");
		    			$(this).parents("tr").siblings().eq(2).css("display", "none");
		    		});
		    		
		    		//수정 버튼
		    		$(".reply-table").on("click", "button[id='replyBtn']", function(){
		    			
		    			$.ajax({
		    				url: "updateReply",
		    				type: "POST",
		    				data: {
		    					replyNo: $(this).parents("table").prev().val(),
		    					replyContent: $(this).parent().prev().children().val()
		    				},
		    				success: function(result){
		    					if(result>0){
									alert("댓글이 성공적으로 수정되었습니다.");
									location.reload();
								}else{
									alert("댓글 수정에 실패했습니다.")
								}
		    				}
		    			});
		    		});
		    		
		    		//댓글 작성
		    		$("#insertReply").on("click", function(){ //비회원 댓글 못달게 조건걸기
	    			
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
		    			if(confirm("댓글을 삭제하시겠습니까?")){
		    				console.log($(this).parents("table").prev().val());
			    			$.ajax({
			    				url : "deleteReply",
			    				type : "GET",
								data : { replyNo: $(this).parents("table").prev().val() },
								success : function(result){
									if(result>0){
										alert("댓글이 성공적으로 삭제되었습니다.");
										location.reload();
									}else{
										alert("댓글 삭제에 실패했습니다.")
									}
								}
			    			});
		    			}
		    		});
		    	});
		    </script>
	    </div>
    </div>
    
   	<!-- 모달창 영역 -->
    <div class="modal-wrap">
        <div class="modal_close" id="cancel"><i class="fa-solid fa-square-xmark fa-2xl" style="color: #ffd814;"></i></div>
        <div class="modal-area">
        	<div class="modifyForm-area">
				<div class="modifyForm-top">
					<span id="category">code/menual</span>
				</div>
				<div class="modifyForm-bottom">
					<div class="modifyForm_1">
						<textarea id="before" class="scroll" cols="30" rows="10" readonly>ajax로 해당 내용 가져오기</textarea>
					</div>
					<div class="modifyForm_2">
						<i class="fa-solid fa-angles-right fa-2x" style="color: #ffffff;"></i>
					</div>
					<div class="modifyForm_3">
						<textarea id="after" class="scroll" cols="30" rows="10" readonly>ajax로 해당 내용 가져오기</textarea>
					</div>
				</div>
			</div>
        </div>
    </div>
    <!-- 모달창 스크립트 -->
    <script>
		$(function(){ //모달창 열고 닫기
			var str1 = '${eb.createSetting.settingCode}';
			var str2 = '${eb.errorBoard.modifiedCode}';
			var str3 = '${eb.createSetting.settingInfo}';
			var str4 = '${eb.errorBoard.modifiedInfo}';
			
			$("button[id*='DetailBtn']").on("click", function(){
				
				$('html').animate({scrollTop : $(".ebDetailView").offset().top}, 100);
				$(".modal-wrap").css("display", "block");
				
				if($(this).val() == "code"){
					$("#category").html("code");
					$("#before").html(str1);
					$("#after").html(str2);
				}else{
					$("#category").html("menual");
					$("#before").html(str3);
					$("#after").html(str4);
				}
			});
			
			$("#cancel").on("click", function(){
				$(".modal-wrap").css("display", "none");
			});
		});
	</script>
    
	<%@include file="../../common/footer.jsp"%>
</body>
</html>