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
        #divcontent{
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
        	<h1 align="center">let updateBoard</h1>
            <br><br>
            <form id="myForm" onsubmit="return submitForm();" method="POST" enctype="multipart/form-data">
                <c:if test="${loginUser.nickName eq '관리자' }">
	                <div id="notice-box">
	                    <p id="notice">공지사항 여부:</p>
	                    <input type="checkbox" name="notice" id="yes" value="Y" onclick="check('Y');"><label for="yes">yes</label>
	                    <input type="checkbox" name="notice" id="no" value="N" onclick="check('N');"><label for="no">no</label><br><br>
	                </div>
                </c:if>
                <input type="hidden" value="${b.boardNo }" name="boardNo">
                <p>Title:</p>
                <input type="text" name="title" id="title" value="${b.title }"><br><br>
                <p>Content:</p>
                <textarea id="content" name="subContent" style="display:none"></textarea>
                <div id="divcontent" contentEditable="true" style="border: solid 1px;line-height: 20px;">${b.content }</div><br>
                <input id="browse" name="upfiles" type="file" onchange="previewFiles()" multiple />
                <div id="fileList">
                <c:forEach var="b" items="${baList }">
                	<input name="existedFiles" type="text" style="display:none" value="${b.changeName }">
                	<input name="filePath" type="text" style="display:none" value="${b.filePath }">
                	<input name="fileNos" type="text" style="display:none" value="${b.fileNo }">
                </c:forEach>
                </div> <br><br>
                <p>Code:</p>
                <textarea id="editor" name="contentCode" class="editor">${b.contentCode }</textarea>
                <button type="submit" id="submmit">update</button>
            </form>
            <br><br>
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
	    editor.setSize("100%","300");
	    
        function check(e){
            var yes = document.getElementById("yes");
            var no = document.getElementById("no");
           
            if(e === 'Y' && yes.checked){
                no.checked = false;
            }else if(e === 'N' && no.checked){
                yes.checked = false;
            }
        }

        function previewFiles() {
        	var preview = document.querySelector('#divcontent');
        	var files = document.querySelector('input[type=file]').files;
			
            function readAndPreview(file) {
               
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
            	console.log(files);
                [].forEach.call(files, readAndPreview);
            }
        }
        
        document.getElementById('browse').addEventListener('change', function(event) {
            var fileList = document.getElementById('fileList');
            
            var files = event.target.files; 
            for (var i = 0; i < files.length; i++) {
                var file = files[i];
                var listItem = document.createElement('p');
                listItem.textContent = file.name;
                fileList.appendChild(listItem);
            }
        });
        
	    function submitForm() {
        	var form = document.getElementById('myForm');
        	var formData = new FormData(form);
        	var title = document.getElementById('title').value;
        	content.innerHTML = divcontent.innerHTML;
        	if(title===''){
        		window.alert("제목을 입력해주세요.");
        		return false;
        	}else if(content.innerHTML===''){
        		window.alert("내용을 입력해주세요.");
        		return false;
        	}
        	
        	formData.append('additionalData', 'some value');
        	var fileInput = document.getElementById('browse');
        	
        	    var files = fileInput.files;
        	    for (var i = 0; i < files.length; i++) {
        	    	console.log(files[i]);
        	      formData.append('upfiles', files[i]);
        	    } 
			form.action = "updateboard";
        	var shouldSubmitForm = confirm('수정하시겠습니까?');
        	
        	return shouldSubmitForm;
        }
    </script>
    <jsp:include page="../../common/footer.jsp"/>
</body>
</html>