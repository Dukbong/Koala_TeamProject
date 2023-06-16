<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="${path }/resources/codemirror-5.53.2/lib/codemirror.js"></script>
    <script src="${path }/resources/codemirror-5.53.2/mode/clike/clike.js"></script>
    <script src="${path }/resources/codemirror-5.53.2/addon/edit/closetag/js"></script>
    <link href="${path }/resources/codemirror-5.53.2/lib/codemirror.css" rel="stylesheet"/>
    <link href="${path }/resources/codemirror-5.53.2/theme/3024-night.css" rel="stylesheet"/>
    <style>
        * {
            padding:0;
            margin:0;
            box-sizing: border-box;

        }

        .enroll-outer{
            background-color: black;
            color: white;
            margin: auto;
            text-align: center;
            position: relative;
        }

        p{
            position: absolute;
            left: 20%;
        }
        #modalWrap {
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 0px; /* Location of the box */
            left: 2.5%;
            top: 2.5%;
            width: 95%; /* Full width */
            height: 95%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            display: none;
        }

        #modalBody {
            width: 100%;
            height: 100%;
            padding: 30px 30px;
            margin: auto;
            border: 1px solid #777;
            background-color: black;
        }

        #closeBtn {
            float:right;
            font-weight: bold;
            color: #777;
            font-size:25px;
            cursor: pointer;
        }

        .CodeMirror {
            font-family: Arial, monospace;
            font-size: 30px;
            border: 1px solid white;
        }
    </style>
</head>
<body>
	<%@include file="../../common/header.jsp" %>
    <div class="enroll-outer">
        <p>공지사항 여부:</p>
        <input type="checkbox" name="notice" id="yes" value="Y"><label for="yes">yes</label>
        <input type="checkbox" name="notice" id="no" value="N"><label for="no">no</label><br>
        Title: <input type="text" name="title" id="title"><br>
        <p>Content:</p><br>
        <textarea name="content" id="content" cols="30" rows="10" style="resize:none"></textarea><br>
        <p>Code:</p><br>
        <textarea name="contentCode" id="contentCode" cols="30" rows="10" style="resize:none"></textarea><br>
    </div>
    <div id="modalWrap">
        <div id="modalBody">
            <span id="closeBtn">&times;</span>
            <div>
               <textarea id="editor" class="editor"></textarea>
            </div>
        </div>
    </div>
    <script>
        const textarea = document.getElementById('contentCode');
        const modal = document.getElementById('modalWrap');
        const closeBtn = document.getElementById('closeBtn');
        const code = document.getElementById('code');
        const contentcode = document.getElementById('contentCode');

        textarea.onclick = function() {
            modal.style.display = 'block';
        }
        closeBtn.onclick = function() {
            modal.style.display = 'none';
            console.log(code.value);
            contentcode.value = code.value;
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

        var editor = CodeMirror.fromTextArea(document.getElementById('editor'),{
            mode: 'text/x-java',
            theme: '3024-night',
            lineNumbers: true,
            matchBrackets: true,
            autoCloseTags: true
        });
        editor.setSize("100%","600");
        
    </script>
    <jsp:include page="../../common/footer.jsp"/>
</body>
</html>