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
     <style>
        * {
            padding:0;
            margin:0;
            box-sizing: border-box;
        }
        .enroll-outer{
            display: flex;
            background-color: black;
            color: white;
            margin: auto;
            justify-content: center;
        }
        .inner-outer{
            width: 80%;
            justify-content: center;
            align-items: center;
        }
        #content{
            width:100%;
            height: 300px;
            background-color: white;
            color: black;
            overflow: auto;
        }
        #notice{
            display: inline-block;
        }
        #notice-box{
            align-items: center;
        }
        #contentCode{
            background-color: black;
        }
        #title,#contentCode{
            width: 100%;
        }
        .CodeMirror {
            font-family: Arial, monospace;
            font-size: 25px;
            border: 1px solid white;
        }
        #submmit{
            position: relative;
            margin-top: 20px;
            width: 80px;
            height: 30px;
            left: 90%;
        }
    </style>
</head>
<body>
	<%@include file="../../common/header.jsp" %>
    <div class="enroll-outer">
        <div class="inner-outer">
        	<br>
        	<h1 align="center">let enrollBoard</h1>
            <br><br>
            <form action="" method="" enctype="multipart/form-data">
                <c:if test="${loginUser.nickName eq '관리자' }">
	                <div id="notice-box">
	                    <p id="notice">공지사항 여부:</p>
	                    <input type="checkbox" name="notice" id="yes" value="Y" onclick="check('Y');"><label for="yes">yes</label>
	                    <input type="checkbox" name="notice" id="no" value="N" onclick="check('N');"><label for="no">no</label><br><br>
	                </div>
                </c:if>
                <p>Title:</p>
                <input type="text" name="title" id="title"><br><br>
                <p>Content:</p>
                <div id="content" contentEditable="true" style="border: solid 1px;line-height: 20px;"></div><br>
                <input id="browse" name="upfiles" type="file" onchange="previewFiles()" multiple="multiple" />
                <div id="fileList"></div> <br><br>
                <p>Code:</p>
                <textarea name="contentCode" id="contentCode" cols="30" rows="10" style="resize:none; display: none;"></textarea><br> 
                <textarea id="editor" class="editor"></textarea>
                <button type="submmit" id="submmit">upload</button>
            </form>
            <br><br>
        </div>
    </div>
    <script>
        const content = document.getElementById('content');
        const textarea = document.getElementById('contentCode');
        const code = document.getElementById('code');
        const contentcode = document.getElementById('contentCode');
        const codemirror = document.getElementById('editor');
        
        var editor = CodeMirror.fromTextArea(document.getElementById('editor'),{
            mode: 'text/x-java',
            theme: '3024-night',
            lineNumbers: true,
            matchBrackets: true,
        });
        editor.setSize("100%","300");
        
        function previewFiles() {
        var preview = document.querySelector('#content');
        var files = document.querySelector('input[type=file]').files;

            function readAndPreview(file) {
                // `file.name` 형태의 확장자 규칙에 주의하세요
                if (/\.(jpe?g|png|gif)$/i.test(file.name)) {
                var reader = new FileReader();

                reader.addEventListener(
                    'load',
                    function () {
                    var image = new Image();
                    image.height = 200;
                    image.title = file.name;
                    image.src = this.result;
                    preview.appendChild(image);
                    },
                    false
                );

                reader.readAsDataURL(file);
                }
            }

            if (files) {
                [].forEach.call(files, readAndPreview);
            }
        }

        function click(){
           console.log(editor.display.maxLine.parent.lines);
           for(var i=0; i<editor.display.maxLine.parent.lines.length; i++){
        	   textarea.innerHTML += editor.display.maxLine.parent.lines[i].text + "\n";
           }
        }

        function check(e){
            console.log(e);
            var yes = document.getElementById("yes");
            var no = document.getElementById("no");
           
            if(e === 'Y' && yes.checked){
                no.checked = false;
            }else if(e === 'N' && no.checked){
                yes.checked = false;
            }
        }

        document.getElementById('browse').addEventListener('change', function(event) {
            var fileList = document.getElementById('fileList');
            
            console.log("hello");
            var files = event.target.files; 
            for (var i = 0; i < files.length; i++) {
                var file = files[i];
                var listItem = document.createElement('p');
                listItem.textContent = file.name;
                fileList.appendChild(listItem);
            }
        });
    </script>
    <jsp:include page="../../common/footer.jsp"/>
</body>
</html>