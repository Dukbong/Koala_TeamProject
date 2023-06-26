<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.css" />
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
    <script src="https://code.jquery.com/jquery-3.7.0.slim.min.js" integrity="sha256-tG5mcZUtJsZvyKAxYLVXrmjKBVLd6VpVccqz/r4ypFE=" crossorigin="anonymous"></script>
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
   <style>
        .content-outer{
            margin: auto;
            align-items: center;
            width: 100%;
            display: flex;
            flex-direction: column;
            background-color: black;
            position: absolute;
        }
        .board-content,.comment-content,.comment-area{
          width: 70%;
        }
        #boardTitle,#boardWriter,#boardContent,#boardCode{
            width:100%;
            font-size: 20px;
        }
        #replyContent{
            width: 100%;
        }
        input,textarea {
            background-color: #333333; 
            color: #cccccc;
        }
        input::placeholder {
            color: #cccccc;
        }
        p,div{
            color: white;
            margin: 0px;
        }
        #boardContent,#boardCode{
            height: 300px;
            overflow: hidden;
        }
        #boardContent, #boardCode,#replyWriter,#createDate{
            border: 1px solid white;
        }
        table{
            border: 1px solid white;
        }
        a{
            text-decoration: none;
            color: white;
            padding-top: 20px;
            
        }
        #editor{
        	height: 100px;
        }
    </style>
</head>
<body>
	<%@include file="../../common/header.jsp" %>
    <div class="content-outer">
        <br>
        <br>
        <div class="board-content">
        	<c:if test="${loginUser.nickName eq b.boardWriter }">
        		<button onclick="location.href='update?boardNo=${b.boardNo}'">Edit</button>
        		<button onclick="location.href='delete?boardNo=${b.boardNo}'">Delete</button>
        	</c:if>
            <input type="text" name="boardTitle" id="boardTitle" value="${b.title }" readonly><br>
            <input type="text" name="boardWriter" id="boardWriter" value="by ${b.boardWriter } create_date ${b.createDate}" readonly><br>
            <div name="content" id="boardContent" >${b.content }</div>
            <div name="contentCode" id="boardCode">${b.contentCode }</div>
            <input type="hidden" value="${loginUser.userNo }" id="onlineUser">
            <button onclick="like();">
            	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" id="likeon" style="display:none"><title>thumb-up</title><path d="M23,10C23,8.89 22.1,8 21,8H14.68L15.64,3.43C15.66,3.33 15.67,3.22 15.67,3.11C15.67,2.7 15.5,2.32 15.23,2.05L14.17,1L7.59,7.58C7.22,7.95 7,8.45 7,9V19A2,2 0 0,0 9,21H18C18.83,21 19.54,20.5 19.84,19.78L22.86,12.73C22.95,12.5 23,12.26 23,12V10M1,21H5V9H1V21Z" /></svg>
            	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" id="likeoff"><title>thumb-up-outline</title><path d="M5,9V21H1V9H5M9,21A2,2 0 0,1 7,19V9C7,8.45 7.22,7.95 7.59,7.59L14.17,1L15.23,2.06C15.5,2.33 15.67,2.7 15.67,3.11L15.64,3.43L14.69,8H21C22.11,8 23,8.9 23,10V12C23,12.26 22.95,12.5 22.86,12.73L19.84,19.78C19.54,20.5 18.83,21 18,21H9M9,19H18.03L21,12V10H12.21L13.34,4.68L9,9.03V19Z" /></svg>
            	<span id="likecount">like ${b.liked }</span>
            </button>
        </div>
        <c:if test="${userDoLike eq 1 }">
	        <script>
	        	window.onload = function() {
	        	  document.getElementById("likeon").style.display = "block";
	        	  document.getElementById("likeoff").style.display = "none";
	        	};
	        </script>
        </c:if>
        <hr>
        <c:choose>
	        <c:when test="${not empty rList }">
		        <c:forEach var="r" items="${rList}">
			        <div class="comment-content">
			        	<c:if test="${loginUser.nickName eq r.replyWriter }">
			        		<button onclick="upadatereply(1);">삭제</button>
			        		<button onclick="upadatereply(0);">수정</button>
			        	</c:if>
			        	<input type="hidden" id="replyNo" value ="${r.replyNo }">
			        	<p>writer : ${r.replyWriter } commented</p>
			        	<p>writenDate : ${r.createDate }</p>
			            <textarea name="replyContent" id="replyContent" cols="30" rows="10" style="resize:none" readonly>${r.replyContent }</textarea>
			        </div>
		        </c:forEach>
	        </c:when>
        	<c:otherwise>
        		<div class="comment-content">
        			<p>댓글이 없습니다.</p>
        		</div>
        	</c:otherwise>
        </c:choose>
        <div class="comment-area">
            <button id="reply" onclick="reply();">reply</button><br>
            <input type="text" id="replyContent2">
            <input type="hidden" value="${loginUser.userNo }" id="replyWriter2">
            <input type="hidden" value="${b.boardNo }" id="refBno">
        </div>
    </div>
    <script>
    	function upadatereply(e){
    		var button = event.target;
    		var contentdiv = event.target.parentElement;
    		var replycontentarea = event.target.parentElement.querySelector("textarea")
    		if(e==0){
    			button.disabled = true;
    			replycontentarea.readOnly = false;
    			var update = document.createElement("label");
    			var cancel = document.createElement("label");
    			update.textContent = "수정";
    			cancel.textContent = "취소";
    			contentdiv.appendChild(update);
    			contentdiv.appendChild(cancel);
    			cancel.onclick = function(){
    				button.disabled = false;
    				replycontentarea.readOnly = true;
    				contentdiv.removeChild(cancel);
    				contentdiv.removeChild(update);
    			}
    			update.addEventListener('click', function(){
    				test(0);
    			});
    		}else{
    			test(1,replyContent);
    		}
    	
	    	function test(e){
	    		var replyContent = event.target.parentElement.querySelector("textarea").value;
	    		var replyNo = event.target.parentElement.querySelector("input[type='hidden']").value;
	    		
	    		$.ajax({
	    			url : "updatereply",
	    			async: false,
	    			data : {
	    				replyContent : replyContent,
	    				replyNo : replyNo,
	    				select : e
	    			},
	    			success : function(result){
	        			if(result!=null){
	        				location.reload();
	        			}else{
	        				window.location.replace(result);
	        			}
	        		},
	        		error : function(){
	        			console.log("통신 실패");
	        		}
	    		});
	    	}
    	}
        function reply(){
        	var replyContent = document.getElementById("replyContent2").value;
        	var replyWriter = document.getElementById("replyWriter2").value;
        	var onlineUser = document.getElementById("onlineUser").value;
        	if(onlineUser!=''){
	        	if(replyContent!=''){
	        		$.ajax({
		        		url : "reply",
		        		async: false,
		        		data : {
		        			replyContent : replyContent,
		        			replyWriter : replyWriter,
		        			refBno : ${b.boardNo}
		        		},
		        		success : function(result){
		        			if(result!=null){
		        				location.reload();
		        			}else{
		        				window.location.replace(result);
		        			}
		        		},
		        		error : function(){
		        			console.log("통신 실패");
		        		}
		        	})
	        	}else{
	        		window.alert("내용을 입력해주세요.");
	        	}
        	}else{
        		window.alert("로그인이 필요합니다.");
        	}
        }
        
        function like(){
        	var like = document.getElementById("likeon");
        	var dislike = document.getElementById("likeoff");
        	var likecount = document.getElementById("likecount");
        	var likeUser = document.getElementById("onlineUser").value;
        	
        	if(likeUser!=''){
        		if(like.style.display === "none"){
        			like.style.display = "block";
        			dislike.style.display = "none";
        			$.ajax({
        				url:"like", 
        				data:{
        					boardNo : ${b.boardNo},
        					loginUser : likeUser,
        					select : 1
        				},
        				success: function(result){
        					likecount.innerHTML = "like "+result;
        				},
        				error: function(){
        					console.log("통신실패");
        				}
        			})
        		}else{
        			like.style.display = "none";
        			dislike.style.display = "block";
        			$.ajax({
        				url:"like",
        				data:{
        					boardNo : ${b.boardNo},
        					loginUser : likeUser,
        					select : 2
        				},
        				success: function(result){
        					likecount.innerHTML = "like "+result;
        				},
        				error: function(){
        					console.log("통신실패");
        				}
        			})
        		}
        	}else{
        		window.alert("로그인이 필요합니다.");
        	}
        	
        }
   </script>
   <jsp:include page="../../common/footer.jsp"/>
</body>
</html>