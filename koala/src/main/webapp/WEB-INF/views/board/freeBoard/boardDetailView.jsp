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
        .boardlist{
            position: fixed;
            top: 50%;
            left: 92%;
            transform: translate(-50%, -50%);
            text-align: center;
            background-color: rgb(201, 118, 51);
        }
        table{
            border: 1px solid white;
        }
        #contentcontroll{
            text-align: center;
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
            <input type="text" name="boardTitle" id="boardTitle" value="${b.title }" readonly><br>
            <input type="text" name="boardWriter" id="boardWriter" value="by ${b.boardWriter } create_date ${b.createDate}" readonly><br>
            <div name="content" id="boardContent" >${b.content }</div>
            <div name="contentCode" id="boardCode">${b.contentCode }</div>
            <input type="hidden" value="${loginUser.userNo }" id="likeUser">
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
		        <c:forEach var="r" items="rList">
		        	<c:if test="${loginUser.nickName eq r.replyWriter }">
		        		<button onclick="location.href='detail?replyNo=${r.replyNo}">삭제</button>
		        		<button onclick="updatereply();">수정</button>
		        	</c:if>
			        <div class="comment-content">
			            <p id="replyWriter">${r.replyWriter } commented</p>
			            <p id="createDate">${r.createDate }</p>
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
        <div class="boardlist">
            <p>게시글</p>
            <table width="125px">
                <tr>
                    <td>제목입니다</td>
                </tr>
                <tr>
                    <td>제목입니다</td>
                </tr>
                <tr>
                    <td>제목</td>
                </tr>
            </table>
            <div id="contentcontroll">
                <a href="">이전</a>
                <a href="">다음</a>
            </div>
        </div>
        <div class="comment-area">
            <button id="reply">reply</button><br>
            <div class="form-group">
                <div id="editor" name="editor" ></div>
                <input type="hidden" id="toastdata" name="toastdata" />
            </div>
        </div>
    </div>
    <script>
        const Editor = toastui.Editor;
        const editor = new Editor({
            el: document.querySelector('#editor'),
            height: '600px',
            initialEditType: 'markdown',
            previewStyle: 'vertical',
            hooks: {
                addImageBlobHook:  async (blob, callback) => {
                    const upload = uploadImage(blob);
                    callback(upload, 'alt text');
                }
            }
        });
        
        const uploadImage =  (blob) => {
            const formData = new FormData();
            formData.append('image', blob);
            // 서버로부터 이미지 주소 받아오는거 구현 필요
            const url = "https://www.premiumoutlets.co.kr/webcontents/20220127_144158_220124_slide_01.jpg";
            return url;
        };
        
        function like(){
        	var like = document.getElementById("likeon");
        	var dislike = document.getElementById("likeoff");
        	var likecount = document.getElementById("likecount");
        	var likeUser = document.getElementById("likeUser").value;
        	console.log(likeUser);
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