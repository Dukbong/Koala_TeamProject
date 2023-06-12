<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/koala/resources/codemirror-5.53.2/lib/codemirror.js"></script>
<script src="/koala/resources/codemirror-5.53.2/mode/sql/sql.js"></script>
<script src="/koala/resources/codemirror-5.53.2/mode/clike/clike.js"></script>
<script src="/koala/resources/codemirror-5.53.2/mode/clike/clike.js"></script>
<link rel="stylesheet" href="/koala/resources/codemirror-5.53.2/lib/codemirror.css">
<link rel="stylesheet" href="/koala/resources/codemirror-5.53.2/theme/darcula.css">
</head>
<style>
	.ebDetail{
		margin: auto;
		width: 80%;
		height: 500px;
	}
</style>
<body>

	
	<div class="ebDetail">
	
	
		게시글 상세페이지
		
		<div style="margin-left:100px;margin-top: 200px;width:800px;">
	        * SQL
	        <textarea id="batch_content" name="batch_content"></textarea>
        <button type="button" onclick="fn_msg()">확인</button>
    </div>
    
    <script>
        // textarea 태그의 element를 지정
        var textarea = document.getElementById('batch_content');
        // 에디터 설정
        var editor = CodeMirror.fromTextArea(textarea, {
            lineNumbers: true,  //왼쪽 라인넘버 표기
            lineWrapping: true, //줄바꿈. 음.. break-word;
            theme: "darcula",   //테마는 맘에드는 걸로.
            mode: 'text/x-java', //모드는 sql 모드
            val: textarea.value
        });
    
        function fn_msg() {
            // 에디터에 입력된 값은 아래와 같이 가져올 수 있다.
            var text = editor.getValue();
            //alert(text);
            //console.log(text);
        }
    
    </script>


	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>