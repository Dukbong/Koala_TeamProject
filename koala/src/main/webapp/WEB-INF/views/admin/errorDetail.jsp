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
    .ebEnrollForm{width: 1200px; margin: auto; padding-top: 50px;}
    .ebEnrollForm>*{width: 85%; margin: auto; padding-bottom: 50px;}
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
    div[class*='modifyForm-area']{width: 85%; height: 600px; display: block;}
    .modifyForm-top{width: 100%; height: 8%; position:relative;}
    .modifyForm-bottom{width: 100%; height: 92%;}
    .modifyForm-bottom>div{height: 100%; float: left;}
    .modifyForm_1, .modifyForm_3{width: 47%; background-color: black; padding : 10px;}
    .modifyForm_2{width: 6%; display: flex; justify-content: center; align-items: center;}
    textarea{
    	width: 100%;
    	height: 100%;
    	background-color: black;
    	color : white;
    	resize: none;
    	border: none;
        outline: none;
    }
    .reset{position:absolute; margin:auto; right:0; cursor:pointer;}
/* ======================================================== 버튼 관련 */
     button{border-radius: 5px;}
     button:hover{cursor: pointer;} 
     .buttons{width: 25%; height: 50px; margin: auto; position: relative;} 
     .buttons>button{ width: 120px; height: 40px; position:absolute; margin: auto;} 
</style>

<body>
	<%@include file="../common/header.jsp"%>
	
	<c:if test="${not empty errorSet }">
	<div class="ebEnrollForm" style="padding-top: 200px;">
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
					<span>category</span> ${errorSet.createSetting.settingTitle }
					<span>version</span> ${errorSet.createSetting.settingVersion }
					<div style="text-align: right; display:inline; padding-left: 310px; padding-top:50px">
						<button id="nextError" type="button" class="btn btn-info">NEXT</button>					
					</div>
				</div>
				<div class="title_b" style="height: 30px;">
					<span>title</span> <input class="ii ic" type="text" name="title" id="eb_title"
						style="width: 85%;" placeholder="제목을 작성하세요" value="${errorSet.board.title }" readonly>
				</div>
				<div style="height: 5px;"></div><!-- 간격용 -->
				<div class="content_1_b">
					<span>content</span>
				</div>
				<div class="content_2_b" style="height: 150px;">
					<textarea class="ii ic" name="content" id="eb_content" placeholder="내용을 작성하세요" readonly
							style="width: 100%; height: 100%; padding: 5px 55px; resize: none">${errorSet.board.content }</textarea>
				</div>
				<br>
				<!-- paing 처리 -->
				<span>남은 오류 개수 [ ${size } ]</span>
<!-- 				<div> -->
<!-- 					<button>prev</button><button>next</button> -->
<!-- 				</div> -->
			</div>
			
			<div class="modifyForm-area_code">
				<div class="modifyForm-top">
					<span>code</span>
<!-- 					<span class="reset"><i class="fa-solid fa-rotate-left fa-lg" style="color: #ffffff;"></i></span> -->
				</div>
				<div class="modifyForm-bottom">
					<div class="modifyForm_1">
						<textarea class="ii ic" id="beforeCode" cols="30" rows="10" style="resize: none" readonly disabled>${errorSet.createSetting.settingCode }</textarea>
					</div>
					<div class="modifyForm_2">
						<i class="fa-solid fa-angles-right fa-2x" style="color: #ffffff;"></i>
					</div>
					<div class="modifyForm_3">
						<textarea name="modifiedCode" id="afterCode" cols="30" rows="10" style="resize: none" disabled>${errorSet.errorBoard.modifiedCode }</textarea>
					</div>
				</div>
			</div>
			
			<div class="modifyForm-area_info">
				<div class="modifyForm-top">
					<span>manual</span>
<!-- 					<span class="reset"><i class="fa-solid fa-rotate-left fa-lg" style="color: #ffffff;"></i></span> -->
				</div>
				<div class="modifyForm-bottom">
					<div class="modifyForm_1">
						<textarea id="beforeInfo" cols="30" rows="10" style="resize: none" readonly disabled>${errorSet.createSetting.settingInfo }</textarea>
					</div>
					<div class="modifyForm_2">
						<i class="fa-solid fa-angles-right fa-2x" style="color: #ffffff;"></i>
					</div>
					<div class="modifyForm_3">
						<textarea name="modifiedInfo" id="afterInfo" cols="30" rows="10" style="resize: none" disabled>${errorSet.errorBoard.modifiedInfo }</textarea>
					</div>
				</div>
			</div>
			<div class="button-area">
				<div class="buttons">
					<button id="userError" type="button">User</button>
					<button id="koalaError" type="button" style="background-color: rgb(147, 208, 248); right:0;">Koala</button>
				</div>
			</div>
	</div>
	</c:if>
	<c:if test="${empty  errorSet}">
		<div class="notFound" style="width:80%; height: 200px; margin:auto; text-align: center; padding-top: 65px;">
			<h1 style="font-size:50px; font-weight: bold;">NOT FOUND ERROR...!</h1>
		</div>
	</c:if>
	<%@include file="../common/footer.jsp"%>
	<script>
		// Controller에서 버튼의 id값으로 구분하여 실행 $(this).attr("id")
		var i = 1;
		$("#userError").on("click", function(){
			$.ajax({
				url : "errorDivision",
				data : {
					tag : $(this).attr("id"),
					bno : ${errorSet.board.boardNo}
				},
				success : function(data){
					if(data > 0){
						alert("사용자 오류로 분류 되었습니다.");
						location.reload();
					}
				},
				error : function(){
					console.log("error");
				}
			});
		});
		
		$("#koalaError").on("click",function(){
			$.ajax({
				url : "errorDivision",
				data : {
					tag : $(this).attr("id"),
					bno : ${errorSet.board.boardNo}
				},
				success : function(data){
					if(data > 0){
						alert("코알라 오류로 분류 되었습니다.");
						location.reload();
					}
				},
				error : function(){
					console.log("error");
				}
			});
		});
		
		$("#nextError").on("click", function(){
			$.ajax({
				url : "errorDetail",
				data : {
					settingTitle : "${errorSet.createSetting.settingTitle }",
					page : i
				},
				success : function(data){
					alert("${page >= size }")
					if("${page}" >= "${size}"){
						location.href="/koala/admin/errorDetail?settingTitle=${errorSet.createSetting.settingTitle }&page=1";
						i = 1;
					}else{						
						i = Number("${page}") + 1;
						location.href="/koala/admin/errorDetail?settingTitle=${errorSet.createSetting.settingTitle }&page="+i;
					}
				}, error : function(){
					console.log("ajax Error");					
				}
			})
		});
	</script>
</body>
</html>