<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[Koala] Issue</title>
</head>

<style>
	div{ box-sizing: border-box;}
    .ebEnrollForm{width: 1200px; margin: auto; padding-top: 50px;}
    .ebEnrollForm>*{width: 85%; margin: auto; padding-bottom: 50px;}
    .option-area{padding-bottom: 20px; padding-left: 230px;}
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
     
     /*모달*/ 
         .modal-wrap{
        display: none;
        width: 1100px;
        height: 650px;
        position: absolute;
        top: 50%;
        left: 50%;
        margin: -250px 0 0 -550px;
        background-color: rgb(30, 30, 30);
        border: 2px solid gray;
        color: white;
    }
    .modal_close{
    	background-color: rgb(30, 30, 30);
        width: 27px;
        height: 27px;
        position: absolute;
        top: -27px;
        right: 0;
    }
    
    .modifyForm-area{width: 95%; height: 95%; display: block; margin: auto;}
    .modifyForm-top{width: 100%; height: 8%; position: relative;}
    .modifyForm-top>span{ font-size: 20px; color: rgb(255, 201,20); position: absolute; margin: auto; bottom: 5px;}
    .modifyForm-bottom{width: 100%; height: 92%;}
    .modifyForm-bottom>div{height: 100%; float: left;}
    .modifyForm_1, .modifyForm_3{width: 47%; background-color: black; padding : 10px;}
    .modifyForm_2{width: 6%; display: flex; justify-content: center; align-items: center;}
    .reply-area textarea, .modal-area textarea{
    	width: 100%;
    	height: 100%;
    	background-color: black;
    	color : white;
    	resize: none;
    	border: none;
        outline: none;
        overflow-y:auto;
    }
    .modal-area{
    	border: 1px solid gray;
    	width: 100%;
    	height: 100%;
    }
    .ebDetailView button:hover{
    	opacity: 85%;
    }
    
    .hover:hover{cursor: pointer;}
    
	.scroll {overflow-y:auto;}
	.scroll::-webkit-scrollbar {width: 4px;}
	.scroll::-webkit-scrollbar-thumb {background: gray; border-radius: 10px;}
</style>


<body>
	<%@include file="../common/header.jsp"%>
	
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
				<div id="boardNo" style="display: none">${issueDetail.board.boardNo }</div>
				<div id="settingNo" style="display: none">${issueDetail.setting.settingNo }</div>
				<div id="boardWriter" style="display: none">${issueDetail.board.boardWriter }</div>
				<div id="sortDescription" style="display:none;">${issueDetail.setting.sortDescription}</div>
				<div class="option-area">
					<span>category</span> <span id="settingTitle">${issueDetail.setting.settingTitle }</span>
					<span>version</span> <span id="version">${issueDetail.setting.settingVersion }</span>
						<button id="nextError" type="button" class="btn btn-info">NEXT</button>					
					<div style="text-align: right; display:inline; padding-left: 310px; padding-top:50px">
					</div>
				</div>
				<div class="title_b" style="height: 30px;">
					<span>title</span> <input class="ii ic" type="text" name="title" id="eb_title"
						style="width: 85%;" placeholder="제목을 작성하세요" value="${issueDetail.board.title }" readonly>
				</div>
				<div style="height: 5px;"></div><!-- 간격용 -->
				<div class="content_1_b">
					<span>content</span>
				</div>
				<div class="content_2_b" style="height: 150px;">
					<textarea class="ii ic" name="content" id="eb_content" placeholder="내용을 작성하세요" readonly
							style="width: 100%; height: 100%; padding: 5px 55px; resize: none">${issueDetail.board.content }</textarea>
				</div>
				<button type="button" id="testbtn">test</button>
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
				</div>
				<div class="modifyForm-bottom">
					<div class="modifyForm_1">
						설명
						<textarea class="ii ic" id="settingInfo" cols="30" rows="10" style="resize: none">${issueDetail.errorBoard.modifiedInfo }</textarea>
					</div>
					<div class="modifyForm_2">
						<i class="fa-solid fa-angles-right fa-2x" style="color: #ffffff;"></i>
					</div>
					<div class="modifyForm_3">
						코드
						<textarea name="settingCode" id="settingCode" cols="30" rows="10" style="resize: none">${issueDetail.errorBoard.modifiedCode }</textarea>
					</div>
				</div>
			</div>
			<div class="button-area">
				<div class="buttons">
					<button id="cancelw" type="button">cancel</button>
					<button id="errorSuccess" type="button" style="background-color: rgb(147, 208, 248); right:0;">submit</button>
				</div>
			</div>
	</div>
	
	   	<!-- 모달창 영역 -->
    <div class="modal-wrap">
        <div class="modal_close" id="cancel"><i class="fa-solid fa-square-xmark fa-2xl" style="color: #ffd814;"></i></div>
        <div class="modal-area">
        	<div class="modifyForm-area">
				<div class="modifyForm-top">
					<span id="category">code/menual</span>
				</div>
				<div class="modifyForm-bottom">
					<div class="modifyForm_1">
						<textarea id="before" class="scroll" cols="30" rows="10" readonly>ajax로 해당 내용 가져오기</textarea>
					</div>
					<div class="modifyForm_2">
						<i class="fa-solid fa-angles-right fa-2x" style="color: #ffffff;"></i>
					</div>
					<div class="modifyForm_3">
						<textarea id="after" class="scroll" cols="30" rows="10" readonly>ajax로 해당 내용 가져오기</textarea>
					</div>
				</div>
			</div>
        </div>
    </div>
	<%@include file="../common/footer.jsp"%>
	<script>
		// Controller에서 버튼의 id값으로 구분하여 실행 $(this).attr("id")
		var i = 1;
		$("#errorSuccess").on("click", function(){
			alert("writer" + $("#boardWriter").text());
			$.ajax({
				url : "issuesSuccess",
				data : {
					boardNo : $("#boardNo").text(),
					settingNo : $("#settingNo").text(),
					settingTitle : $("#settingTitle").text(),
					settingInfo : $("#settingInfo").val(),
					settingCode : $("#settingCode").val(),
					settingVersion : $("#version").text(),
					boardWriter : $("#boardWriter").text(),
					sortDescription : $("#sortDescription").text()
				},
				type:"POST",
				success : function(data){
					if(data > 0){						
						alert("setting update success");
						location.reload()
					}
				},
				error : function(){
					console.log("error");
				}
			})
		});
		
		$("#nextError").on("click", function(){
			$.ajax({
				url : "issuesDetail",
				data : {
					settingTitle : "${issueDetail.setting.settingTitle }",
					page : i
				},
				success : function(data){
					if("${page}" >= "${size}"){
						alert("마지막 페이지 입니다. 처음으로 돌아갑니다.");
						location.href="/koala/admin/issuesDetail?settingTitle=${issueDetail.setting.settingTitle }&page=1";
					}else{						
						i = Number("${page}") + 1;
						location.href="/koala/admin/issuesDetail?settingTitle=${issueDetail.setting.settingTitle }&page="+i;
					}
				}, error : function(){
					console.log("ajax Error");					
				}
			});
			
// 			$("button[id*='DetailBtn']").on("click", function(){
			$("#testbtn").on("click", function(){
				$('html').animate({scrollTop : $(".ebDetailView").offset().top}, 100);
				$(".modal-wrap").css("display", "block");
				if($(this).val() == "code"){
					$("#category").html("code");
					$("#before").html(str1);
					$("#after").html(str2);
				}else{
					$("#category").html("menual");
					$("#before").html(str3);
					$("#after").html(str4);
				}
			});
			
			$("#cancel").on("click", function(){
				$(".modal-wrap").css("display", "none");
			});
		});
	</script>
</body>
</html>