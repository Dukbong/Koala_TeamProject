<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="/koala/resources/codemirror-5.53.2/lib/codemirror.js"></script>
<script src="/koala/resources/codemirror-5.53.2/mode/sql/sql.js"></script>
<script src="/koala/resources/codemirror-5.53.2/mode/clike/clike.js"></script>
<link rel="stylesheet"
	href="/koala/resources/codemirror-5.53.2/lib/codemirror.css">
<link rel="stylesheet"
	href="/koala/resources/codemirror-5.53.2/theme/darcula.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<style>
.togeSql {
	width: 80%;
	height: 2000px;
	margin: auto;
}

.sqlArea {
	width: 90%;
	height: 100%;
	box-sizing: border-box;
	float:left;
}

.userConarea {
	width: 10%;
	height: 100%;
	box-sizing: border-box;
	background-color: gray;
	float:left;
}

/* 	.btnsarea{ */
/* 		width: 100%; */
/* 		height: 5%; */
/* 		float: left; */
/* 	} */
.userInarea {
	width: 100%;
	heigh: 95%;
	box-sizing: border-box;
}

.CodeMirror {
	width: 100%;
	height: 100%;
	box-sizing: border-box;
}
</style>
<body>
	<script>
		var socket;
		var color = [];
		var userArr = []; // 현재 접속중인 사람들 보여주려고 하는데 어떻게 보여줘야 할지... 고민좀....
		function connect() {
			if (!socket) {
				socket = new WebSocket("ws://localhost:8888/koala/ssss"); // oks		
			}
			socket.onopen = function(e) {
				console.log("Connect Success");
				userArr.push("${loginUser.userId}");
			}
			socket.onclose = function() {
				console.log("disconnnect Success");
				userArr = userArr.filter((e) => e != '$(loginUser.userId)');
				console.log(userArr);
			}
			socket.onmessage = function(e) {
				var str = e.data;
				$(".testarea").val(str);
			}
		}

		function disconnect() {
			try{		
				socket.close();
				socket = "";
			}catch(e){
				
			}
		}
		
		$(function() {
			$(".testarea").on("change keyup paste", function() {
				var text = $(".testarea").val();
				console.log(text);
				if(!socket){
					alert("접속을 먼저 해주세요.");
					$(".testarea").val("");
				}else{				
					socket.send(text);
				}
			});
			
            var codeEditor = null;
            var showCodeEditor = false;
            var textArea = document.getElementById("testareaa");
			function initializeCodeMirror(){
                //textarea 태그의 element 지정
               // var textArea = document.getElementById("textZone");
                //에디터 설정
                 codeEditor = CodeMirror.fromTextArea(textArea,{
                    lineNumbers:true,
                    lineWrapping:true,
                    theme:"darcula",
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
			
			openCodeEditor();
		})
	</script>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="togeSql">
		<!-- 		<h1>팀원들이 sql문을 동시에 짤수 있도록 하기 위해 만든 거다...모여서 하기 귀찮다..</h1> -->
		<!-- 		<h1>이유 : sql문 짜서 공유하는거 너무 귀찮고 누구는 고치고 누구는 안고치면 머리 아픔...</h1> -->
		<!-- 		<pre> -->
		<!-- 			1. 팀원 중 누군가 저장을 누르면 그 데이터를 디비에 저장 -->
		<!-- 			2. replace 방식처럼 덮어쓸 수 있도록함 -->
		<!-- 			3. 마지막 사람이 저장을 누르면 데이터가 디비에 저장됨. -->
		<!-- 			3. 30초 단위로 자동으로 데이터를 저장한다. -->
		<!-- 			-- > 디비에 저장 공간이 2개 인거다. -->
		<!-- 			-- > 1. 직접 저장 -->
		<!-- 			-- > 2. 자동 저장 -->
		<!-- 			4. 다시 들어왔을때 "자동 저장 / 직접 저장" 중 어떤걸 볼지 결정 가능 -->
		<div class="sqlArea">
			<textarea id="testareaa" class="testarea codemirror-textarea"
				style="width: 100%; height: 100%"></textarea>
		</div>
		<div class="userConarea">
			<div class="btnsarea" style="background-color: white">
				<button type="button" onclick="connect();" class="btn btn-success"
					style="width: 100%; height: 45%;">접속</button>
				<br>
				<div style="height: 10%; width: 100%;"></div>
				<button type="button" onclick="disconnect();" class="btn btn-danger"
					style="width: 100%; height: 45%;">종료</button>
			</div>
			<div class="userInarea">접속자 명단</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>