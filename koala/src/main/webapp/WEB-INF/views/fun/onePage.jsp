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
				// userArr = userArr.filter((e) => e != '$(loginUser.userId)');
				// console.log(userArr);
			}
			socket.onmessage = function(e) {
// 				console.log(e.data.split(",").length);
				console.log(e.data);
				$(".CodeMirror-code").empty();
// 				var ee = e.data.replaceAll(",",""); // , 이거 지워준다.
				$(".CodeMirror-code").html(e.data);
// 				var arr = e.data.split(",");
// 				alert(arr);
// 				var last = "";
// 				for(var i = 0; i < arr.length; i++){
// 					last += makeDiv(i,arr[i]);
// // 					$(".CodeMirror-code").html("");
// // 					$(".CodeMirror-code").append( makeDiv(i,arr[i]));
// 				}
// 				var lll = makeCode(last);
// 				console.log("lll");
// 				console.log(lll);
// // 				console.log(e.data.toString());
// 				// var str = (e.data).replaceAll(",",""); // ,생기는걸 방지
// 				$("div").remove(".CodeMirror-code");
// 				console.log($(".CodeMirror-lines").html());
// 				$(".CodeMirror-code").html("");
// console.log(e.data);
// 				var str = "a\nb\nc\"
// 				if($(".CodeMirror-code").children().children().eq(1).children().eq(0).text() == "&ZeroWidthSpace;"){
// 					console.log("비어있음")
// 				}else{
// 					console.log($(".CodeMirror-code").children().children().eq(1).children().eq(0).text());
// 				}
// 					$(".CodeMirror-code").html("<div style='position: relative;'><div class='CodeMirror-gutter-wrapper' style='left: -30px;'><div class='CodeMirror-linenumber CodeMirror-gutter-elt' style='left: 0px; width: 21px;'>1</div></div><pre class=' CodeMirror-line ' role='presentation'><span role='presentation' style='padding-right: 0.1px;'><span cm-text=''>​</span></span></pre></div>");
// 				}catch(e){
// 					console.log("e");
// 				}
// 				$(".CodeMirror-code").children().children().eq(1).children().eq(0).html("1\ndfafaf2\sdjf3/sfs")
// 				$("div").remove($(".CodeMirror-code").children);
// 				$(".CodeMirror-code").append(e.data.replaceAll(",","")); // 현재 문제점 : 기존꺼와 복사한게 동시에 들어간다. >>> 기존에 작성하면 그걸 대체해서 들어가야한다.
			}
		}
		
// 		function makeDiv(num, str){
// 			var go = "<div style='position: relative;'><div class='CodeMirror-gutter-wrapper' style='left: -30px;'><div class='CodeMirror-linenumber CodeMirror-gutter-elt' style='left: 0px; width: 21px;'>"+(num+1)
// 					  +"</div></div><pre class=' CodeMirror-line ' role='presentation'><span role='presentation' style='padding-right: 0.1px;'>"+str+"</span></pre></div>";
// 			return go;
// 		}
// 		function makeCode(str){
// 			var l = "<div class='CodeMirror-code' role='presentation'>"+str+"</div>"
// 			return 
// 		}

		function disconnect() {
			try{		
				socket.close();
				socket = "";
			}catch(e){
				
			}
		}
		
		$(function() {
// 			$(".CodeMirror-sizer").on("change keyup paste", function() {
// 				console.log("s");
// // 				var text = $(".CodeMirror-code").children();
				
// 				console.log(text);
// 			});

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
			
					var $test = document.querySelector(".CodeMirror");
					
					$test.addEventListener("keyup",function(){

						var tt = document.querySelector(".CodeMirror-code").children;
						var text="";
						for(var i = 0; i < tt.length; i++){
							text += tt[i].children[1].parentElement.parentElement.innerHTML;
							}
								if(!socket){
									alert("접속을 먼저 해주세요.");
										$(".CodeMirror-code").html("<div style='position: relative;'><div class='CodeMirror-gutter-wrapper' style='left: -30px;'><div class='CodeMirror-linenumber CodeMirror-gutter-elt' style='left: 0px; width: 21px;'>1</div></div><pre class=' CodeMirror-line ' role='presentation'><span role='presentation' style='padding-right: 0.1px;'><span cm-text=''>​</span></span></pre></div>");
								}else{			
									socket.send(text);
								}
						})
        
						
					
			
			// console.log($test);
			// $test.addEventListener("change",function(){
				// 	console.log("change"); // 다른 곳 클릭하면 발동
				// })
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