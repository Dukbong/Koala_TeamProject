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
            <input type="text" name="boardTitle" id="boardTitle" value="안녕하세요" readonly><br>
            <input type="text" name="boardWriter" id="boardWriter" value="by test01 create_date 2023" readonly><br>
            <div name="content" id="boardContent" >안녕하세요</div>
            <div name="contentCode" id="boardCode">inpout</div>
        </div>
        <hr>
        <div class="comment-content">
            <p id="replyWriter">test02 commented</p>
            <p id="createDate">2023-03-13</p>
            <textarea name="replyContent" id="replyContent" cols="30" rows="10" style="resize:none" readonly></textarea>
        </div>
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
   </script>
   <jsp:include page="../../common/footer.jsp"/>
</body>
</html>