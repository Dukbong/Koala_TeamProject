<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="/koala/resources/codemirror-5.53.2/lib/codemirror.js"></script>
    <script src="/koala/resources/codemirror-5.53.2/mode/clike/clike.js"></script>
    <script src="/koala/resources/codemirror-5.53.2/addon/edit/closetag/js"></script>
    <link href="/koala/resources/codemirror-5.53.2/lib/codemirror.css" rel="stylesheet"/>
    <link href="/koala/resources/codemirror-5.53.2/theme/3024-night.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.7.0.slim.min.js" integrity="sha256-tG5mcZUtJsZvyKAxYLVXrmjKBVLd6VpVccqz/r4ypFE=" crossorigin="anonymous"></script>
    <style>
        div{ box-sizing: border-box;}
        .content-outer{width: 1400px; margin: auto; padding: 250px 0px 130px 0px;}
        p{margin-bottom:0;}
        .board-area, .reply-area{
            width: 70%;
            margin: auto;
        }
        .space{width: 16%;}
        .lib-info{height: 7%; position: relative;}
        #libTitle{color: rgb(255, 201,20);left: 0; height: 45px; padding-top: 7px;}
        .board-box{ padding: 10px;}
        .updateDeleteBtn{height: 5%; position: relative;}
        #likesession{
            padding-top: 20px;
            padding-bottom: 20px;
            text-align: center;
        }
        #likesession>button{
        	background-color: rgb(255, 201,20);
        	border-radius: 5px;
        	font-weight: bold;
        	font-size: 14px;
        }
        .board-box>div{ margin: auto;}
        #title{
            align-self: center;
            height: 10%; 
            text-align: center; 
            padding-top: auto; 
            font-size: 19px; 
            font-weight:600;
            width: 100%;
            pointer-events: none;
        }
        #boardWriter{
            width: 100%;
            pointer-events: none;
        }
        #title>span{background: linear-gradient(to top, rgb(60, 60, 60) 40%, transparent 40%);}
        #content>p{color:white;}
        #content, #editor{
            height: 53%;
            width: 100%;
        }
        #updateBtn, #deleteBtn{
            width:90px; 
            height: 35px; 
            position: absolute; 
            margin-bottom: 20px; 
            bottom: 5px;
            border-radius: 6px;
        }
        #updateBtn{right: 120px;}
        #deleteBtn{right: 20px;}
        .reply-area>div{width: 100%;}
        .reply>input{
            height: 50px;
            width: 93%;
        }
        .reply>button{
            height: 50px;
            width: 6%;
            border-radius: 6px;
        }
        .replyList-area{
            width: 100%;
            margin-top: 25px;
            margin-bottom: 25px;
            border: 3px solid rgb(80,80,80);
	    }
	    button{
	    	background-color: rgb(255, 201,20);
        	border-radius: 5px;
        	font-weight: bold;
        	font-size: 14px;
	    }
        #replyContent{
            width: 100%;
            pointer-events: none;
        }
        .replybtn{
            padding-top: 10px;
            padding-left: 1250px;
        }
        .CodeMirror {
	        font-family: Arial, monospace;
	        font-size: 25px;
	        height: auto;
	        pointer-events: none;
	        z-index: 0;
	    }
      	.comment-content>button{
      		float: right;
      		right: 10px;
      	}
	</style>
</head>
<body>
	<%@include file="../../common/header.jsp" %>
    <div class="content-outer">
        <div class="total-area">
            <div class="board-content">
                <div class="lib-info">
                    <div id="libTitle">&nbsp;&nbsp;<span style="font-size: 18px;"><b>BoardEnrollPage</b></span></div>
                </div>
                <hr>
                <c:if test="${loginUser.nickName eq b.boardWriter }">
                    <div class="updateDeleteBtn">
                        <button onclick="location.href='update?boardNo=${b.boardNo}'" id="updateBtn">Edit</button>
                        <form action="delete" method="POST">
                            <input type="hidden" value="${b.boardNo }" name="boardNo">
                            <button type="submmit" id="deleteBtn">Delete</button>
                        </form>
                    </div>
                </c:if>
                <div class="board-box">
                    <div class="board-area">
                        <p name="boardTitle" id="title">
	                        ${b.notice == "Y" ? '[공지]' : ''} ${b.title }
                        </p>
                        <hr>
                        <p name="boardWriter" id="boardWriter">by ${b.boardWriter } create_date ${b.createDate}</p>
                        <hr>
                        <div name="content" id="content" >${b.content }</div>
                        <c:if test="${b.contentCode ne '비어있습니다.' }">
                            <textarea id="editor" name="contentCode" class="editor">${b.contentCode }</textarea>
                        </c:if>
                        <div id="likesession">
                            <input type="hidden" value="${loginUser.userNo }" id="onlineUser">
                            <button onclick="like();">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" id="likeon" style="display:none"><title>thumb-up</title><path d="M23,10C23,8.89 22.1,8 21,8H14.68L15.64,3.43C15.66,3.33 15.67,3.22 15.67,3.11C15.67,2.7 15.5,2.32 15.23,2.05L14.17,1L7.59,7.58C7.22,7.95 7,8.45 7,9V19A2,2 0 0,0 9,21H18C18.83,21 19.54,20.5 19.84,19.78L22.86,12.73C22.95,12.5 23,12.26 23,12V10M1,21H5V9H1V21Z" /></svg>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" id="likeoff"><title>thumb-up-outline</title><path d="M5,9V21H1V9H5M9,21A2,2 0 0,1 7,19V9C7,8.45 7.22,7.95 7.59,7.59L14.17,1L15.23,2.06C15.5,2.33 15.67,2.7 15.67,3.11L15.64,3.43L14.69,8H21C22.11,8 23,8.9 23,10V12C23,12.26 22.95,12.5 22.86,12.73L19.84,19.78C19.54,20.5 18.83,21 18,21H9M9,19H18.03L21,12V10H12.21L13.34,4.68L9,9.03V19Z" /></svg>
                                <span id="likecount">like ${b.liked }</span>
                            </button>
                        </div>
                    </div>
                </div>
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
            <div class="reply-area">
                <div class="replyList-area">
                    <c:choose>
                        <c:when test="${not empty rList }">
                            <c:forEach var="r" items="${rList}">
                                <div class="comment-content">
                                    <c:if test="${loginUser.nickName eq r.replyWriter }">
                                    	<button id="reply-deletebtn" onclick="upadatereply(1);">삭제</button>
                                    	<button id="reply-updatebtn" onclick="upadatereply(0);">수정</button>
                                    </c:if>
                                    <input type="hidden" id="replyNo" value ="${r.replyNo }">
                                    <p>writer : ${r.replyWriter } commented</p>
                                    <p>writenDate : ${r.createDate }</p>
                                    <textarea name="replyContent" id="replyContent" style="resize:none" readonly>${r.replyContent }</textarea>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="comment-content">
                                <p align="center">댓글이 없습니다.</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="reply">
                    <input type="text" id="replyContent2">
                    <button id="reply" onclick="reply();">reply</button>
                    <input type="hidden" value="${loginUser.userNo }" id="replyWriter2">
                    <input type="hidden" value="${b.boardNo }" id="refBno">
                </div>
            </div>
        </div>
    </div>
    <script>
	    const divcontent = document.getElementById('divcontent');
	    const content = document.getElementById('content');
	    const code = document.getElementById('code');
	    const codemirror = document.getElementById('editor');
	    
	    var editor = CodeMirror.fromTextArea(document.getElementById('editor'),{
	        mode: 'text/x-java',
	        theme: '3024-night',
	        lineNumbers: true,
	        matchBrackets: true,
	    });
	    editor.setSize("100%");
	    
	    window.addEventListener('load', function() {
	    	var divElements = document.querySelectorAll('#content div');
	    	var Elements = document.querySelectorAll('#content span');
	    	
	    	divElements.forEach(function(divElement) {
	    	    var spanElements = divElement.querySelectorAll('span');
	    	    
	    	    spanElements.forEach(function(spanElement) {
	    	      spanElement.style.color = 'white'; // 새로운 글자 색상을 설정합니다.
	    	    });
	    	});
	    	Elements.forEach(function(Element) {
	    	    Elements.forEach(function(Element) {
	    	    	Element.style.color = 'white'; // 새로운 글자 색상을 설정합니다.
	    	    });
	    	});
	    });
	    
    	function upadatereply(e){
    		var button = event.target;
    		var contentdiv = event.target.parentElement;
    		var replycontentarea = event.target.parentElement.querySelector("textarea")
    		if(e==0){
    			button.disabled = true;
    			replycontentarea.readOnly = false;
    			replycontentarea.style.pointerEvents = 'auto';
    			var update = document.createElement("label");
    			var cancel = document.createElement("label");
    			update.textContent = "수정";
    			cancel.textContent = "취소";
    			contentdiv.appendChild(update);
    			update.style.marginRight = "10px";
    			update.style.cursor = "pointer";
    			cancel.style.cursor = "pointer";
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
        			console.log(${b.boardNo});
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