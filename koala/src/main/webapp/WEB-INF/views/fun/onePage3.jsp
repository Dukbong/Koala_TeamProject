<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

		<script src="/koala/resources/codemirror-5.53.2/lib/codemirror.js"></script>
		<script src="/koala/resources/codemirror-5.53.2/mode/sql/sql.js"></script>
		<script src="/koala/resources/codemirror-5.53.2/mode/clike/clike.js"></script>
		<link rel="stylesheet" href="/koala/resources/codemirror-5.53.2/lib/codemirror.css">
		<link rel="stylesheet" href="/koala/resources/codemirror-5.53.2/theme/darcula.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
			integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
			crossorigin="anonymous" referrerpolicy="no-referrer" />
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
			float: left;
		}

		.userConarea {
			width: 10%;
			height: 100%;
			box-sizing: border-box;
			background-color: gray;
			float: left;
		}
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
			var userArr = [];
			function connect() {
				if (!socket) {
					socket = new WebSocket("ws://localhost:8888/koala/ssss");
				}
				socket.onopen = function (e) {
					console.log("Connect Success");
					userArr.push("${loginUser.userId}");
// 					$(".CodeMirror-code").html("<div style='position: relative;'><div class='CodeMirror-gutter-wrapper' style='left: -30px;'><div class='CodeMirror-linenumber CodeMirror-gutter-elt' style='left: 0px; width: 21px;'>1</div></div><pre class=' CodeMirror-line ' role='presentation'><span role='presentation' style='padding-right: 0.1px;'>jang</span></pre></div>");
				}
				socket.onclose = function () {
					console.log("disconnnect Success");
				}
				socket.onmessage = function (e) {
					
				}
			}
			function disconnect() {
				try {
					socket.close();
					socket = "";
				} catch (e) {
				}
			}

			$(
				function () {

					var codeEditor = null;
					var showCodeEditor = false;
					var textArea = document.getElementById("testareaa");
					function initializeCodeMirror() {
						codeEditor = CodeMirror.fromTextArea(textArea, {
							lineNumbers: true,
							lineWrapping: true,
							theme: "darcula",
							mode: "text/x-sql",
							val: textArea.value
						});

					}
					function openCodeEditor() {
						if (!codeEditor) {
							initializeCodeMirror();//코드미러 생성
						}

						var codeEditorWrapper = codeEditor.getWrapperElement();
						if (!showCodeEditor) {//false일 경우 입력창 보이도록
							codeEditorWrapper.style.display = "block";
							showCodeEditor = true;
						} else {//true일 경우 입력창 닫기
							var code = getCode();
							textArea.value = code;//textarea에 코드 넣기
							codeEditorWrapper.style.display = "none";
							showCodeEditor = false;//변수 값 바꾸기
							console.log("a ", textArea.value);
							codeEditor.toTextArea();
						}
					}

					openCodeEditor();

					var $test = document.querySelector(".CodeMirror");

					$test
						.addEventListener(
							"keyup",
							function () {

								var tt = document
									.querySelector(".CodeMirror-code").children;
								var text = "";
								for (var i = 0; i < tt.length; i++) {
									text += tt[i].children[1].parentElement.parentElement.innerHTML;
								}
								if (!socket) {
									alert("접속을 먼저 해주세요.");
									$(".CodeMirror-code")
										.html(
											"<div style='position: relative;'><div class='CodeMirror-gutter-wrapper' style='left: -30px;'><div class='CodeMirror-linenumber CodeMirror-gutter-elt' style='left: 0px; width: 21px;'>1</div></div><pre class=' CodeMirror-line ' role='presentation'><span role='presentation' style='padding-right: 0.1px;'><span cm-text=''>​</span></span></pre></div>");
								} else {
									socket.send(text);
								}
							})
				})
		</script>
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="togeSql">
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