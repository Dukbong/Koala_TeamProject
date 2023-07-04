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
     	div{ box-sizing: border-box;}
    	.enroll-outer{width: 1400px; margin: auto; padding: 250px 0px 130px 0px;}
    	.enroll-outer>div{width: 100%;}
    	.lib-info{height: 5%; position: relative;}
        #libTitle{color: rgb(255, 201,20);left: 0; height: 45px; padding-top: 7px;}
    	.space{width: 16%;}
        * {
            padding:0;
            margin:0;
            box-sizing: border-box;
        }
        .enroll-outer{
            color: white;
            margin: auto;
            padding-top: 200px;
        }
        .inner-outer{
            width: 100%;
        }
        .inner-content{
        	width: 100%;
        	display: flex;
        	justify-content: center;
            align-items: center;
        }
        ::placeholder {
  			color: ;
  		}
        .inner-content>form{
        	width:70%;
        }
        #divcontent{
            width:100%;
            height: 300px;
            color: white;
            overflow: auto;
            border: 1px solid rgba(255, 255, 255, 0.5);
            line-height: 20px;
        }
        #notice{
            display: inline-block;
        }
        #notice-box{
            align-items: center;
        }
        #title,#contentCode{
            width: 100%;
        }
        #title{
        	background-color: transparent;
        	border: none;
        	color: white;
        }
        .CodeMirror {
            font-family: Arial, monospace;
            font-size: 25px;
            z-index: 0;
        }
        #submmit{
            margin-left: 500px;
            margin-top: 20px;
            left: 0px;
        }
        button{
	    	background-color: rgb(255, 201,20);
        	border-radius: 5px;
        	font-weight: bold;
        	font-size: 14px;
	    }
     	button:hover{cursor: pointer;} 
     	.buttons{width: 40%; height: 60px; margin: auto; position: relative;} 
     	.buttons>button{ width: 45%; height: 100%; position:absolute; margin: auto;}
    </style>
</head>
<body>
	<%@include file="../../common/header.jsp" %>
    <div class="enroll-outer">
        <div class="inner-outer">
        	<div class="lib-info">
            	<div id="libTitle">&nbsp;&nbsp;<span style="font-size: 18px;"><b>let enrollBoard</b></span></div>
            </div>
            <hr>
            <div class="inner-content">
	            <form id="myForm" onsubmit="return submitForm();" method="POST" enctype="multipart/form-data">
	                <c:if test="${loginUser.nickName eq '관리자' }">
		                <div id="notice-box">
		                    <p id="notice">공지사항 여부:</p>
		                    <input type="checkbox" name="notice" id="yes" value="Y" onclick="check('Y');"><label for="yes">yes</label>
		                    <input type="checkbox" name="notice" id="no" value="N" onclick="check('N');"><label for="no">no</label><br><br>
		                </div>
	                </c:if>
	                <input type="hidden" value="${loginUser.userNo }" name="boardWriter">
	                <p>Title:</p>
	                <input type="text" name="title" id="title" placeholder="제목을 입력해주세요"><br><br>
	                <p>Content:</p>
	                <textarea id="content" name="subContent" style="display:none"></textarea>
	                <div id="divcontent" contentEditable="true" ></div><br>
	                <input id="browse" name="upfiles" type="file" onchange="previewFiles()" multiple />
	                <div id="fileList"></div> <br><br>
	                <p>Code:</p>
	                <textarea id="editor" name="contentCode" class="editor"></textarea>
	                <div class="button-area">
	                	<div class="buttons">
	                		<button type="submit" id="submmit">upload</button>
	                	</div>
	                </div>
	            </form>
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
        editor.setSize("100%","300");
        
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

        function check(e){
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
			form.action = "insert";
        	var shouldSubmitForm = confirm('작성하시겠습니까?');
        	
        	return shouldSubmitForm;
        }
    </script>
    <jsp:include page="../../common/footer.jsp"/>
</body>
</html>