<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<script src="/koala/resources/codemirror-5.53.2/lib/codemirror.js"></script>
<script src="/koala/resources/codemirror-5.53.2/mode/sql/sql.js"></script>
<script src="/koala/resources/codemirror-5.53.2/mode/clike/clike.js"></script>
<script src="/koala/resources/codemirror-5.53.2/mode/clike/clike.js"></script>
<link rel="stylesheet" href="/koala/resources/codemirror-5.53.2/lib/codemirror.css">
<link rel="stylesheet" href="/koala/resources/codemirror-5.53.2/theme/darcula.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<style>
    body{
        box-sizing: border-box;
        }
    .wrapper{
        width: 100%;
        height: 700px; 
    }
    .header{
        width: 100%;
        height: 18%;
    }
    .body_content{
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
        width: 80%;
        margin: auto;
    }
    .top_area{
        width: 100%;
        height: 15%;
        display: flex;
        align-items: center;
        margin-bottom: 30px;
    }
    .board_title{
        width: 30%;
        float: left;
        margin-left: 30px;
    }
    .board_title>span{
        color: rgb(255, 201,20);
        font-size: 40px;
        font-weight: bold;
    }
    .button_area{
        width: 57%;
        height: 100%;
        display: flex;
        justify-content: end;
        margin-bottom: -60px;
    }
    .button_area button {
        margin-right: 10px;
    }
    .button_area button[type="reset"]:hover {
        color: white;
        font-weight: bold;
    }
    .button_area button[type="submit"]:hover {
        color: black;
        border: 1px solid grey;
    }
    .button_area button[type="reset"]{
        background-color: black;
        color: rgb(255, 201,20);
        border: 1px solid grey;
        width: 70px;
        height: 30px;
        border-radius: 4px;
        cursor: pointer;
    }
    .button_area button[type="submit"]{
        background-color: rgb(255, 201,20);
        color: white;
        font-weight: bold;
        width: 70px;
        height: 30px;
        border-radius: 4px;
        cursor: pointer;
    }
    .middle_area{
        color: white;
        width: 80%;
        height: 400px;
        text-align: left;
    }
    .middle_area table{
        width: 100%;
        height: 100%;
        border-top: 1px solid grey;
        border-bottom: 1px solid grey;
        margin-bottom: 20px;
    }
    .middle_area table > thead > tr>th{
        height: 50px;
        border-bottom: 1px solid grey;
        font-size: 13px;
        color: rgb(86, 156,214);
    }
    .middle_area table > thead > tr > th > label{
        cursor: pointer;
    }
    .middle_area table > tbody > tr > td:last-child {
        vertical-align: top;
        padding-top: 20px;
        padding-left: 20px;
        font-size: 11px;
    }
    .middle_area button{
        background-color: rgb(30, 30, 30);
        color: rgb(86, 156,214);
        font-weight: bold;
        cursor: pointer;
        border: none;
    }
    #textZone{
        width: 100%;
        height: 300px;
        border: none;
        background-color: rgb(30, 30, 30);
        color: white;
    }
    #titleArea{
        width: 100%;
        height: 80%;
        background-color: rgb(30, 30, 30);
        color: white;
        border: none;
    }
</style>
<body>
<jsp:include page="../../common/header.jsp"/>
    <div class="wrapper">
        <div class="body_content">
            <div class="top_area">
                <div class="board_title">
                    <span>QnA</span>
                </div>
                <div class="button_area">
                    <button type="reset">취소</button>
                    <button type="submit">등록</button>
                </div>
            </div>


            <div class="middle_area">
                    <form action="insert" method="post" enctype="multipart/form-data">
                <table>
                    <thead>
                        <tr>
		                	<th><input type="hidden"id="writer" value="${loginUser.userId }" name="boardWriter">
                            <th colspan="4" style="text-align: left;"><input type="text" id="titleArea" name="title" placeholder="제목을 입력하세요"></th>
                        </tr>
                         <tr>
                            <th style="width: 10%;"><label for="uploadPhoto">사진 <i class="fa-solid fa-image"></i><input type="file" name="upFile" id="uploadPhoto" accept="image/*" style="display: none;"></label></th>
                            <th style="width: 10%;"><label for="uploadFile">파일 <i class="fa-solid fa-file"></i><input type="file" name="upFile" id="uploadFile" style="display: none;"></label></th>
                            <th><label for="uploadCode"><button type="button" onclick="fn_msg();">코드 <i class="fa-solid fa-code"></i></button></label></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="4"><textarea name="boardContent" id="textZone" name="editordata" cols="30" rows="10" style="resize: none;" placeholder="내용을 입력하세요"></textarea></td>
                        </tr>
                    </tbody> 
                </table>
                </form>                  

		<script>
                    //label 버튼 누를 시 실행 되도록
                    $(document).ready(function() {
                    $('label').click(function() {
                        var inputId = $(this).attr('for');
                        $('#' + inputId).click();
                    });
                    });


                    //코드버튼 누를 시 실행되도록
                    var codeEditor = null;
                    var showCodeEditor = false;
                    var textArea = document.getElementById("textZone");
                    //코드미러 활성화
                    function initializeCodeMirror(){
                        //textarea 태그의 element 지정
                       // var textArea = document.getElementById("textZone");
                        //에디터 설정
                         codeEditor = CodeMirror.fromTextArea(textArea,{
                            lineNumbers:true,
                            lineWrapping:true,
                            theme:"dracula",
                            mode:"text/x-sql",
                            val:textArea.value
                        });


                    }

                    
                    function openCodeEditor(){
                        if (!codeEditor) {
                            initializeCodeMirror();//코드미러 생성
                            }

                        var codeEditorWrapper = codeEditor.getWrapperElement();
                        if(!showCodeEditor){//false일 경우 입력창 보이도록
                            codeEditorWrapper.style.display = "block";
                            showCodeEditor = true;
                        }else{//true일 경우 입력창 닫기
                            var code = getCode();
                            textArea.value = code;//textarea에 코드 넣기
                            codeEditorWrapper.style.display = "none";
                            showCodeEditor = false;//변수 값 바꾸기
                            console.log("a ",textArea.value);
                            codeEditor.toTextArea();
                        }
                    }


                    function getCode(){
                        console.log("지수 ",codeEditor.getValue());
                        return codeEditor.getValue();
                    }

                    function fn_msg(){
                        openCodeEditor();
                    }
                    
                    //폼 데이터 전송
                    $(document).ready(function() {
                        $("button[type='submit']").click(function() {
                            $("form").submit();
                        });
                    });

                        
                </script>
		
            
            </div>
        </div>
    </div>

<jsp:include page="../../common/footer.jsp"/>
</body>  
</html>