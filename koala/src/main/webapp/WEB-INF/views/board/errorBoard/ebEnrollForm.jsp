<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ErrorBoard_EnrollForm</title>
</head>

<!-- 코드 미러 CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/6.65.7/codemirror.min.js" integrity="sha512-8RnEqURPUc5aqFEN04aQEiPlSAdE0jlFS/9iGgUyNtwFnSKCXhmB6ZTNl7LnDtDWKabJIASzXrzD0K+LYexU9g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/6.65.7/codemirror.min.css" integrity="sha512-uf06llspW44/LZpHzHT6qBOIVODjWtv4MxCricRxkzvopAlSWnTf6hpZTFxuuZcuNE9CBQhqE0Seu1CoRk84nQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/6.65.7/theme/blackboard.min.css" integrity="sha512-KnHAkH0/78Cyjs1tjV9/+00HK8gu1uKRCCKcWFxX0+rehRh9SYJqiG/2fY4St7H8rPItOsBkgQjN0m4rL5Wobw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="/koala/resources/codemirror-5.53.2/mode/xml/xml.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/6.65.7/theme/ayu-dark.min.css" integrity="sha512-mV3RUXi1gt22jDb4UyRBFhZVFgAIiOfRE6ul+2l1Hcj6glyg6x4xlnjPH+neGm/t6XrFmsMRu4++McQu0asjqg==" crossorigin="anonymous" referrerpolicy="no-referrer" />


<style>
	div{ box-sizing: border-box;}
    .ebEnrollForm{width: 1400px; margin: auto; padding-top: 200px;}
    .ebEnrollForm>form>*{width: 88%; margin: auto; padding-bottom: 50px;}
    .option-area{width: max-content; margin:auto; padding-bottom: 20px;}
    div[class*='_b']{width: 100%; background-color: black;}
    .enrollForm-area span, .modifyBtn-area span, .modifyForm-top span{
        margin: 0px 10px;
        color: rgb(147, 208, 248);
        font-size: 19px;
        font-weight: 700;
    }
    #eb_title, #eb_content {
        background-color: black;
        border: none;
        outline: none;
        color: white;
        font-size: 15px;
    }
/* ======================================================= 수정폼 영역 */
    div[class*='modifyForm-area']{width: 88%; height: 700px; display: none;}
    .modifyForm-top{width: 100%; height: 8%; position:relative;}
    .modifyForm-bottom{width: 100%; height: 92%;}
    .modifyForm-bottom>div{height: 100%; float: left;}
    .modifyForm_1, .modifyForm_3{width: 46%; background-color: black; padding: 10px;}
    .modifyForm-area_info .modifyForm_1, .modifyForm-area_info .modifyForm_3{padding: 10px;}
    .modifyForm_2{width: 8%; display: flex; justify-content: center; align-items: center;}
    .ebEnrollForm textarea{
    	width: 100%;
    	height: 100%;
    	background-color: black;
    	color : white;
    	border: none;
        outline: none;
    	resize: none;
    	overflow-y:auto;
    }
    .reset{cursor:pointer;}
/* ======================================================== 버튼 관련 */
     .ebEnrollForm button{border-radius: 5px;}
     .ebEnrollForm button:hover{cursor: pointer; opacity: 0.5;} 
     .buttons{width: 40%; height: 60px; margin: auto; position: relative;} 
     .buttons>button{ width: 45%; height: 100%; position:absolute; margin: auto;}
/* ======================================================== 스크롤 관련 */     
	.ebEnrollForm textarea::-webkit-scrollbar {width: 4px;}
	.ebEnrollForm textarea::-webkit-scrollbar-thumb {background: gray; border-radius: 10px;}
/* ======================================================== 코드미러 */       
    .CodeMirror{
    	font-family: Arial, monospace;
    	fonc
    }
</style>

<body>
	<%@include file="../../common/header.jsp"%>
	
	<div class="ebEnrollForm">
		<form action="insert" method="post">
		
		<script>
			$(function(){
				
				//라이브러리 최신 버전 가져오기
				$("select[name='settingTitle']").change(function(){
					
					$.ajax({
						url : "version",
						data : {settingTitle : $("select[name='settingTitle']").val()},
						success : function(version){
							$("#version").text("version "+version);
							$("input[name='settingVersion']").val(version);
						},
						error : function(){
							console.log("실패");
						}
					})
				})
				/* 라이브러리 버전 리스트 가져오기
				$("select[name='settingTitle']").change(function(){
					
					$.ajax({
						url : "versionList",
						data : {settingTitle : $("select[name='settingTitle']").val()},
						success : function(vList){
							var str = "";
							for(var i in vList){
								str += "<option value="+vList[i]+">"+vList[i]+"</option>";
							}
							$("select[name='settingVersion']").html(str);
						},
						error : function(){
							console.log("실패");
						}
					})
				})
				*/
				
				//수정폼 카테고리 옵션 변경 (매번 스크롤 될때마다 실행되는 메소드 괜찮은지)
				$(window).scroll(function(){
					if($(".modifyForm-area_code").css("display")=="block" && ($(".modifyForm-area_info").css("display")=="block")){
						$(".modifyBtn-area").css("display", "none");
					}else{
						$(".modifyBtn-area").css("display", "block");
					}
				});
			})
		</script>
		
			<div class="enrollForm-area">
				<div class="option-area">
					<span>category</span>
					<select name="settingTitle" required>
							<option value="">--라이브러리 선택--</option>
						<c:forEach var="c" items="${libList}">
							<option value="${c.settingTitle }">${c.settingTitle}</option>
						</c:forEach>
					</select>
					<span id="version">version </span>
					<input type="hidden" name="settingVersion" value="">
					<!--<select name="settingVersion">
						</select>-->
				</div>
				<div class="title_b" style="height: 30px;">
					<span>title</span> <input type="text" name="title" id="eb_title"
						style="width: 90%;" placeholder="제목을 작성하세요" required>
				</div>
				<div style="height: 5px;"></div><!-- 간격용 -->
				<div class="content_1_b">
					<span>content</span>
				</div>
				<div class="content_2_b" style="height: 150px;">
					<textarea name="content" id="eb_content" placeholder="내용을 작성하세요" required
							style="width: 100%; height: 90%; padding: 5px 55px;"></textarea>
				</div>
			</div>

			<div class="modifyForm-area_code">
				<div class="modifyForm-top">
					<span>code</span>
					<button type="button">cancel</button>
				</div>
				<div class="modifyForm-bottom">
					<div class="modifyForm_1">
						<textarea id="beforeCode" class="codeMirror" cols="30" rows="10" readonly disabled></textarea>
					</div>
					<div class="modifyForm_2">
						<i class="fa-solid fa-angles-right fa-2x reset" style="color: #ffffff;"></i>
					</div>
					<div class="modifyForm_3">
						<textarea name="modifiedCode" class="codeMirror" id="afterCode" cols="30" rows="10" disabled></textarea>
					</div>
				</div>
			</div>
			
			<script>
		    // textarea 태그의 element를 지정
		    var textarea = document.getElementById('editor');
		    // 에디터 설정
		    var editor = CodeMirror.fromTextArea(textarea, {
		        lineNumbers: true,  //왼쪽 라인넘버 표기
		        lineWrapping: true, //줄바꿈. 음.. break-word;
		        matchBrackets: true,
//	 	        theme: "ayu-dark",   //테마는 맘에드는 걸로.
//	 	        mode: 'text/x-java', //모드
		        theme: "blackboard",   //테마는 맘에드는 걸로.
		        mode: 'text/html', //모드
		        val: textarea.value
		    });
		    
		    editor.setSize("100%","100%");

//	 	    function fn_msg() {
//	 	        // 에디터에 입력된 값은 아래와 같이 가져올 수 있다.
//	 	        var text = editor.getValue();
//	 	        alert(text);
//	 	    }
			</script>
			
			<div class="modifyForm-area_info">
				<div class="modifyForm-top">
					<span>manual</span>
					<button type="button">cancel</button>
				</div>
				<div class="modifyForm-bottom">
					<div class="modifyForm_1">
						<textarea id="beforeInfo" cols="30" rows="10" readonly disabled>설명서 가져오기</textarea>
					</div>
					<div class="modifyForm_2">
						<i class="fa-solid fa-angles-right fa-2x reset" style="color: #ffffff;"></i>
					</div>
					<div class="modifyForm_3">
						<textarea name="modifiedInfo" id="afterInfo" cols="30" rows="10" disabled>설명서 가져오기</textarea>
					</div>
				</div>
			</div>
			
			<div class="modifyBtn-area">
				<span style="color: rgb(241, 196, 15);">modify form</span>
				<select name="category"> <!-- 이 값은 받지 않음 -->
					<option value="">--참고자료--</option>
					<option value="code">코드</option>
					<option value="info">설명서</option>
				</select>
				<button type="button">create</button>
				<br><br>
				 <p>code 혹은 menual 수정이 필요한 경우 사용할 수 있는 수정폼입니다.</p>
				 
			</div>
			
			<div class="button-area">
				<div class="buttons">
					<button id="cancelBtn" type="reset">cancel</button>
					<button id="submitBtn" type="submit" style="background-color: rgb(147, 208, 248); right:0;">submit</button>
				</div>
			</div>
			
			<script>
				$(function(){
					
					//수정폼 생성(비동기)
					$(".modifyBtn-area").on("click", "button", function(){
						
						var $category = $("select[name='category']").val();
						
						console.log($("input[name='settingVersion']").val());
						if($("input[name='settingVersion']").val() == ""){
							alert("category를 먼저 선택해주세요 !");
							$("select[name='settingTitle']").focus();
						}else{
							$.ajax({
								
								url : "modifyForm",
								data : {
									settingTitle : $("select[name='settingTitle']").val(),
									settingVersion : $("input[name='settingVersion']").val(),
									category : $category
								},
								success : function(str){
									
									if($category=="code"){
										$("#beforeCode,#afterCode").html(str);
										$("#afterCode").attr("disabled",false);
										$(".modifyForm-area_code").css("display","block");
										$("option[value='code']").css("display","none");
										$("#afterCode").focus();
									}else if($category=="info"){
										$("#beforeInfo,#afterInfo").html(str);
										$("#afterInfo").attr("disabled",false);
										$(".modifyForm-area_info").css("display","block");
										$("option[value='info']").css("display","none");
 										$("#afterInfo").focus();
									}
									$("select[name='category']").find('option:first').prop('selected', true);
									
								},
								error : function(){
									console.log("실패");
								}
							});
						}
					});
					
					//수정폼 선택 삭제
					$(".modifyForm-top ").on("click", "button", function(){
						if(($(this).prev().text())=="code"){
							$(this).parents(".modifyForm-area_code").css("display","none");
							$("#afterCode").attr("disabled",true);
							$("option[value='code']").css("display","block");
						}else{
							$(this).parents(".modifyForm-area_info").css("display","none");
							$("#afterInfo").attr("disabled",true);
							$("option[value='info']").css("display","block");
						}
					});
					
					//수정폼 리셋
					$(".reset").on("click", function(){
						console.log($(this).parent().prev().find('textarea').val());
						var str = $(this).parent().prev().find('textarea').val();
						$(this).parent().next().find('textarea').val(str);
					});
				});
			</script>
		</form>
	</div>
	<%@include file="../../common/footer.jsp"%>
</body>
</html>