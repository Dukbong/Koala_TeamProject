<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ErrorBoard_EnrollForm</title>
<!-- CodeMirror -->
<script src="/koala/resources/codemirror-5.53.2/lib/codemirror.js"></script>
<script src="/koala/resources/codemirror-5.53.2/mode/sql/sql.js"></script>
<script src="/koala/resources/codemirror-5.53.2/mode/clike/clike.js"></script>
<link rel="stylesheet" href="/koala/resources/codemirror-5.53.2/lib/codemirror.css">
<link rel="stylesheet" href="/koala/resources/codemirror-5.53.2/theme/darcula.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<style>
	div{ box-sizing: border-box;}
    .ebEnrollForm{width: 1200px; margin: auto; padding-top: 50px;}
    .ebEnrollForm>form>*{width: 85%; margin: auto; padding-bottom: 50px;}
    .option-area{padding-bottom: 20px; padding-left: 290px;}
    div[class*='_b']{width: 100%; background-color: black;}
    .enrollForm-area span, .modifyBtn-area span, .modifyForm-top span{
        margin: 0px 10px;
        color: rgb(147, 208, 248);
        font-size: 18px;
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
    div[class*='modifyForm-area']{width: 85%; height: 600px; display: none;}
    .modifyForm-top{width: 100%; height: 8%; position:relative;}
    .modifyForm-bottom{width: 100%; height: 92%;}
    .modifyForm-bottom>div{height: 100%; float: left;}
    .modifyForm_1, .modifyForm_3{width: 47%; background-color: black;}
    .modifyForm-area_info .modifyForm_1, .modifyForm-area_info .modifyForm_3{padding: 10px;}
    .modifyForm_2{width: 6%; display: flex; justify-content: center; align-items: center;}
    textarea{
    	width: 100%;
    	height: 100%;
    	background-color: black;
    	color : white;
    	border: none;
        outline: none;
    	resize: none; /*왜 안되는지 확인해보기*/
    }
    .reset{position:absolute; margin:auto; right:0; cursor:pointer;}
/* ======================================================== 버튼 관련 */
     .ebEnrollForm button{border-radius: 5px;}
     button:hover{cursor: pointer;} 
     .buttons{width: 25%; height: 50px; margin: auto; position: relative;} 
     .buttons>button{ width: 120px; height: 40px; position:absolute; margin: auto;}
     
     .CodeMirror {
		width: 100%;
		height: 100%;
		box-sizing: border-box;
	}
</style>

<body>
	<%@include file="../../common/header.jsp"%>
	
	<div class="ebEnrollForm">
		<form action="insert" method="post">
		
		<script>
			$(function(){
				
				//라이브러리 버전 가져오기
				$("select[name='settingTitle']").change(function(){
					
					$.ajax({
						url : "version",
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
				
				//수정폼 카테고리 옵션 변경    //계속 실행되는건데 괜찮은지?
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
					<span>version</span>
					<select name="settingVersion">
					</select>
				</div>
				<div class="title_b" style="height: 30px;">
					<span>title</span> <input type="text" name="title" id="eb_title"
						style="width: 85%;" placeholder="제목을 작성하세요" required>
				</div>
				<div style="height: 5px;"></div><!-- 간격용 -->
				<div class="content_1_b">
					<span>content</span>
				</div>
				<div class="content_2_b" style="height: 150px;">
					<textarea name="content" id="eb_content" placeholder="내용을 작성하세요" required
							style="width: 85%; height: 90%; padding: 5px 55px;"></textarea>
				</div>
			</div>

			<div class="modifyForm-area_code">
				<div class="modifyForm-top">
					<span>code</span>
					<button type="button">cancle</button>
					<span class="reset"><i class="fa-solid fa-rotate-left fa-lg" style="color: #ffffff;"></i></span>
				</div>
				<div class="modifyForm-bottom">
					<div class="modifyForm_1">
						<textarea id="beforeCode" class="codeMirror" cols="30" rows="10" readonly disabled></textarea>
					</div>
					<div class="modifyForm_2">
						<i class="fa-solid fa-angles-right fa-2x" style="color: #ffffff;"></i>
					</div>
					<div class="modifyForm_3">
						<textarea name="modifiedCode" class="codeMirror" id="afterCode" cols="30" rows="10" disabled></textarea>
					</div>
				</div>
			</div>
			
			<script>
		
		$(function() {
			$(".codeMirror").on("change keyup paste", function() {
				var text = $(".codeMirror").val();
				console.log(text);
			});
			
            var codeEditor = null;
            var showCodeEditor = false;
            
            
            
            var textArea = document.getElementById("beforeCode");
            
            console.log(textArea.value);
            
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
            }
			
			openCodeEditor();
		})
	</script>
			
			<div class="modifyForm-area_info">
				<div class="modifyForm-top">
					<span>manual</span>
					<button type="button">cancle</button>
					<span class="reset"><i class="fa-solid fa-rotate-left fa-lg" style="color: #ffffff;"></i></span>
				</div>
				<div class="modifyForm-bottom">
					<div class="modifyForm_1">
						<textarea id="beforeInfo" cols="30" rows="10" readonly disabled>설명서 가져오기</textarea>
					</div>
					<div class="modifyForm_2">
						<i class="fa-solid fa-angles-right fa-2x" style="color: #ffffff;"></i>
					</div>
					<div class="modifyForm_3">
						<textarea name="modifiedInfo" id="afterInfo" cols="30" rows="10" disabled>설명서 가져오기</textarea>
					</div>
				</div>
			</div>
			
			<div class="modifyBtn-area">
				<span style="color: rgb(241, 196, 15);">modify form</span>
				<select name="category"> <!-- 이 값은 무시  -->
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
					<button type="reset">cancle</button>
					<button type="submit" style="background-color: rgb(147, 208, 248); right:0;">submit</button>
				</div>
			</div>
			
			<script>
				$(function(){
					
					//수정폼 생성(비동기)
					$(".modifyBtn-area").on("click", "button", function(){
						
						var $category = $("select[name='category']").val();
						
						if($("select[name='settingVersion']").val() == null){
							alert("category를 먼저 선택해주세요 !");
						}else{
							$.ajax({
								
								url : "modifyForm",
								data : {
									settingTitle : $("select[name='settingTitle']").val(),
									settingVersion : $("select[name='settingVersion']").val(),
									category : $category
								},
								success : function(str){
									
									if($category=="code"){
										$("#beforeCode,#afterCode").html(str);
										$("#afterCode").attr("disabled",false);
										$(".modifyForm-area_code").css("display","block");
										$("option[value='code']").css("display","none");
										$('html').animate({scrollTop : $(".modifyForm-area_code").offset().top}, 300);
									}else if($category=="info"){
										$("#beforeInfo,#afterInfo").html(str);
										$("#afterInfo").attr("disabled",false);
										$(".modifyForm-area_info").css("display","block");
										$("option[value='info']").css("display","none");
										$('html').animate({scrollTop : $(".modifyForm-area_info").offset().top}, 300);
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
						var str = $(this).parent().next().children().eq(0).find('textarea').val();
						$(this).parent().next().children().eq(2).find('textarea').val(str);
					});
				});
			</script>
		</form>
	</div>
	<%@include file="../../common/footer.jsp"%>
</body>
</html>