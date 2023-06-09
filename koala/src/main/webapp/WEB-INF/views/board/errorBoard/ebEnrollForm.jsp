<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
	div{ box-sizing: border-box;}
    .ebEnrollForm{width: 1200px; margin: auto; padding-top: 50px;}
    .ebEnrollForm>form>*{width: 85%; margin: auto; padding-bottom: 50px;}
    .option-area{padding-bottom: 20px; padding-left: 330px;}
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
    .modifyForm-top{width: 100%; height: 8%;}
    .modifyForm-bottom{width: 100%; height: 92%;}
    .modifyForm-bottom>div{height: 100%; float: left;}
    .modifyForm_1, .modifyForm_3{width: 47%; background-color: black;}
    .modifyForm_2{width: 6%; display: flex; justify-content: center; align-items: center;}
/* ======================================================== 버튼 관련 */
    button{border-radius: 5px;}
    .buttons{width: 25%; margin: auto;}
    .buttons>button{ width: 100px; height: 30px;}
</style>

<body>

	<%@include file="../../common/header.jsp"%>
	
	<div class="ebEnrollForm">

		<form action="insert">
		
			<div class="enrollForm-area">
				<div class="option-area">
					<span>category</span>
					<select name="settingTitle">
						<option value="전체">전체</option>
						<option value="Common dbcp">Common dbcp</option>
						<option value="Mybatis">Mybatis</option>
					</select>
					<span>version</span>
					<select name="settingVersion">
						<option value="전체">전체</option>
						<option value="1.0.0">1.0.0</option>
					</select>
				</div>
				<div class="title_b" style="height: 30px;">
					<span>title</span> <input type="text" name="title" id="eb_title"
						style="width: 85%;" placeholder="제목을 작성하세요" required>
				</div>
				<div style="height: 5px;"></div>
				<!-- 간격용 -->
				<div class="content_1_b">
					<span>content</span>
				</div>
				<div class="content_2_b" style="height: 150px;">
					<textarea name="content" id="eb_content"
						style="resize: none; width: 85%; height: 90%; padding: 5px 55px;"
						placeholder="내용을 작성하세요" required></textarea>
				</div>
			</div>

			<div class="modifyForm-area_code">
				<div class="modifyForm-top">
					<span>code</span>
					<button>cancle</button>
				</div>
				<div class="modifyForm-bottom">
					<div class="modifyForm_1">
						<div id="beforeCode">코드 가져오기</div>
					</div>
					<div class="modifyForm_2">
						<i class="fa-solid fa-angles-right fa-2x" style="color: #ffffff;"></i>
					</div>
					<div class="modifyForm_3">
						<textarea name="modifiedCode" id="afterCode" cols="30" rows="10">코드 가져오기</textarea>
					</div>
				</div>
			</div>
			
			<div class="modifyForm-area_info">
				<div class="modifyForm-top">
					<span>manual</span>
					<button>cancle</button>
				</div>
				<div class="modifyForm-bottom">
					<div class="modifyForm_1">
						<div id="beforeInfo">설명서 가져오기</div>
					</div>
					<div class="modifyForm_2">
						<i class="fa-solid fa-angles-right fa-2x" style="color: #ffffff;"></i>
					</div>
					<div class="modifyForm_3">
						<textarea name="modifiedInfo" id="afterInfo" cols="30" rows="10">설명서 가져오기</textarea>
					</div>
				</div>
			</div>
			
			<div class="modifyBtn-area"> <!-- 수정폼 두개 생성되면 안보이게 -->
				<span style="color: rgb(241, 196, 15);">modify form</span>
				<select name="category"> <!-- 이 값은 무시해야 하나 / 전송 클릭 시 disabled 되게? -->
					<option value="code">코드</option>
					<option value="info">설명서</option>
				</select>
				<button type="button" id="createModifyForm">create</button>
			</div>
			
			<script>
				$(function(){
					$("#createModifyForm").on("click", function(){
							var $category = $("select[name='category']").val();
						$.ajax({
							
							
							url : "modifyForm",
							data : {
								settingTitle : $("select[name='settingTitle']").val(),
								settingVersion : $("select[name='settingVersion']").val(),
								category : $category
							},
							success : function(str){
								//$("div[class$="+$category+"]").css("display","block");
								
								if($category=="code"){
									$(".modifyForm-area_code").css("display","block");
									$("#beforeCode,#afterCode").html(str);
								}else{
									$(".modifyForm-area_info").css("display","block");
									$("#beforeInfo,#afterInfo").html(str);
								}
								
								
								
							},
							error : function(){
								console.log("실패");
							}
							
						});
					});
				});
				
			</script>
	
			
			<div class="button-area">
				<div class="buttons">
					<button>cancle</button>
					<button type="submit" style="background-color: rgb(147, 208, 248);">submit</button>
				</div>
			</div>
			
		</form>

	</div>
	
	<%@include file="../../common/footer.jsp"%>
	
</body>
</html>