<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ErrorBoard_UpdateForm</title>
</head>

<style>
	div{ box-sizing: border-box;}
    .ebEnrollForm{width: 1400px; margin: auto; padding-top: 200px;}
    .ebEnrollForm>form>*{width: 85%; margin: auto; padding-bottom: 50px;}
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
    div[class*='modifyForm-area']{width: 85%; height: 700px; display: none;}
    .modifyForm-top{width: 100%; height: 8%; position:relative;}
    .modifyForm-bottom{width: 100%; height: 92%;}
    .modifyForm-bottom>div{height: 100%; float: left;}
    .modifyForm_1, .modifyForm_3{width: 47%; background-color: black; padding : 10px;}
    .modifyForm_2{width: 6%; display: flex; justify-content: center; align-items: center;}
    .ebEnrollForm textarea{
    	width: 100%;
    	height: 100%;
    	background-color: black;
    	color : white;
    	resize: none;
    	border: none;
        outline: none;
    }
    .reset{cursor:pointer;}
/* ======================================================== 버튼 관련 */
     button{border-radius: 5px;}
     button:hover{cursor: pointer;} 
     .buttons{width: 25%; height: 50px; margin: auto; position: relative;} 
     .buttons>button{ width: 120px; height: 40px; position:absolute; margin: auto;} 
</style>

<body>
	<%@include file="../../common/header.jsp"%>
	
	<div class="ebEnrollForm">
		<form action="updateBoard" method="post">
			<input type="hidden" name="boardNo" value="${eb.board.boardNo }">
		
		<script>
			$(function(){
				
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
					<span>category</span> ${eb.createSetting.settingTitle }
					<span>version</span> ${eb.createSetting.settingVersion }
				</div>
				<div class="title_b" style="height: 30px;">
					<span>title</span> <input type="text" name="title" id="eb_title"
						style="width: 85%;" placeholder="제목을 작성하세요" value="${eb.board.title }" required>
				</div>
				<div style="height: 5px;"></div><!-- 간격용 -->
				<div class="content_1_b">
					<span>content</span>
				</div>
				<div class="content_2_b" style="height: 150px;">
					<textarea name="content" id="eb_content" placeholder="내용을 작성하세요" required
							style="width: 85%; height: 90%; padding: 5px 55px;">${eb.board.content }</textarea>
				</div>
			</div>

			<div class="modifyForm-area_code">
				<div class="modifyForm-top">
					<span>code</span>
					<button type="button">cancel</button>
				</div>
				<div class="modifyForm-bottom">
					<div class="modifyForm_1">
						<textarea id="beforeCode" cols="30" rows="10" readonly disabled>${eb.createSetting.settingCode }</textarea>
					</div>
					<div class="modifyForm_2">
						<i class="fa-solid fa-angles-right fa-2x reset" style="color: #ffffff;"></i>
					</div>
					<div class="modifyForm_3">
						<textarea name="modifiedCode" id="afterCode" cols="30" rows="10" disabled>${eb.errorBoard.modifiedCode }</textarea>
					</div>
				</div>
			</div>
			
			<div class="modifyForm-area_info">
				<div class="modifyForm-top">
					<span>manual</span>
					<button type="button">cancel</button>
				</div>
				<div class="modifyForm-bottom">
					<div class="modifyForm_1">
						<textarea id="beforeInfo" cols="30" rows="10" readonly disabled>${eb.createSetting.settingInfo }</textarea>
					</div>
					<div class="modifyForm_2">
						<i class="fa-solid fa-angles-right fa-2x reset" style="color: #ffffff;"></i>
					</div>
					<div class="modifyForm_3">
						<textarea name="modifiedInfo" id="afterInfo" cols="30" rows="10" disabled>${eb.errorBoard.modifiedInfo }</textarea>
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
			</div>
			
			<div class="button-area">
				<div class="buttons">
					<button type="reset">cancel</button>
					<button type="submit" style="background-color: rgb(147, 208, 248); right:0;">submit</button>
				</div>
			</div>
			
			<script>
				$(function(){
					
					FormCheck();
					
					//현재 상태에 따라 수정폼 보여주기
					function FormCheck(){
						
						if(${eb.errorBoard.modifiedCode ne null}){
							$(".modifyForm-area_code").css("display","block");
							$("#afterCode").attr("disabled",false);
							$("option[value='code']").css("display","none");
						}
					 	if(${eb.errorBoard.modifiedInfo ne null}){
							$(".modifyForm-area_info").css("display","block");
							$("#afterInfo").attr("disabled",false);
							$("option[value='info']").css("display","none");
						}
					};
					
					
					//수정폼 생성(비동기)
					$(".modifyBtn-area").on("click", "button", function(){
						
						var $category = $("select[name='category']").val();
									
						if($category=="code"){
							$("#afterCode").attr("disabled",false);
							$(".modifyForm-area_code").css("display","block");
							$("option[value='code']").css("display","none");
							$('html').animate({scrollTop : $(".modifyForm-area_code").offset().top}, 300);
						}else if($category=="info"){
							$("#afterInfo").attr("disabled",false);
							$(".modifyForm-area_info").css("display","block");
							$("option[value='info']").css("display","none");
							$('html').animate({scrollTop : $(".modifyForm-area_info").offset().top}, 300);
						}
						$("select[name='category']").find('option:first').prop('selected', true);
							
							
						
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