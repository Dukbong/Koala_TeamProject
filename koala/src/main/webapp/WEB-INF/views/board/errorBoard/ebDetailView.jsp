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
    .ebDetailView{width: 1200px; margin: auto; padding: 80px 0px;}
    .ebDetailView>div{width: 100%;}
    
    .basic-area{height: 600px; margin-bottom: 50px;}
    .basic-area>div{height: 100%; float: left;}
    .board-area, .reply-area{ width: 50%;}

    .board-area>div{width: 90%;}
    .lib-info{height: 10%; position: relative;}
    .board-form{height: 80%; background-color: black; padding: 10px;}
    .addDetailBtn{height: 10%;}

    #libTitle{
        width: max-content;
        height: 30px;
        background-color: skyblue;
        position: absolute;
        margin: auto;
        left: 0;
        bottom: 0;
    }
    #solved{
        width: max-content;
        border-radius: 5px;
        background-color: rgb(125, 204, 122);
        position: absolute;
        margin: auto;
        right: 0;
        bottom: 0;
    }

    .board-form>div{width: 100%;}
    .board-form *{text-align: center;}
    .board-area{font-size: 15px;}
    span{font-weight: 700; padding-right: 30px;}
    .bWriterDate>div{float: left;}

    .addDetailBtn>div{ 
        width: 30%; 
        height: 100%; 
        margin: auto; 
        position: relative; 
    }
    .addDetailBtn button{
    	position: absolute;
    	margin: auto;
    	bottom: 0;
    	left: 0;
    	right: 0;
    }
    
/*     ======================================================= */
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
    .resetForm{position:absolute; margin:auto; right:0; cursor:pointer;}
    

</style>

<body>
	<%@include file="../../common/header.jsp"%>
	<div class="ebDetailView">
	
	    <div class="basic-area">
	        <div class="board-area">
	            <div class="lib-info">
	                <div id="libTitle">&nbsp;<span><b>${eb.createSetting.settingTitle}</b></span> ${eb.createSetting.settingVersion}&nbsp;</div>
	                <div id="solved">
	                	<c:choose>
	                		<c:when test="${eb.errorBoard.errorType eq 'U'}">&nbsp;user error&nbsp;</c:when>
	                	</c:choose>
	                	<c:choose>
	                		<c:when test="${eb.errorBoard.errorType eq 'S'}">&nbsp;code error&nbsp;</c:when>
	                	</c:choose>
	                </div>
	            </div>
	            <div class="board-form">
	                <div class="bTitle">
	                    <span>제목</span> ${eb.board.title }
	                </div>
	                <hr>
	                <div class="bWriterDate">
	                    <div class="bWriter" style="width: 50%;">
	                        <span>작성자</span> ${eb.board.boardWriter }
	                    </div>
	                    <div class="bDate" style="width: 50%;">
	                        <span>작성날짜</span> ${eb.board.createDate }
	                    </div>
	                </div>
	                <hr>
	                <div class="bContent"> ${eb.board.content }</div>
	            </div>
	            <div class="addDetailBtn">
	            	<div>
	            		<c:if test="${!empty eb.errorBoard.modifiedCode and empty eb.errorBoard.modifiedInfo}">
	            			<button type="button" id="codeDetailBtn">코드 비교폼</button>
	            		</c:if>
	            		<c:if test="${empty eb.errorBoard.modifiedCode and !empty eb.errorBoard.modifiedInfo}">
	            			<button type="button" id="codeDetailBtn">설명서 비교폼</button>
	            		</c:if>
	               	</div>
	            </div>
	        </div>
	        
<!-- 	        <script> -->
// 	        	$(function(){
// 	        		$("#datailBtn").on("click", function(){
	        			
// 	        		});
// 	        	})
<!-- 	        </script> -->
	        
	
	        <div class="reply-area" style="border: 1px solid red">
	            댓글영역입니다.
	        </div>
	
	    </div>
	    
	    <div class="detail-area" style="border: 1px solid blue;">
	    	비교폼 영역
	    	<div class="modifyForm-area_code">
				<div class="modifyForm-top">
					<span>code</span>
					<button type="button">cancle</button>
					<span class="reset"><i class="fa-solid fa-rotate-left fa-lg" style="color: #ffffff;"></i></span>
				</div>
				<div class="modifyForm-bottom">
					<div class="modifyForm_1">
						<textarea id="beforeCode" cols="30" rows="10" readonly disabled>코드 가져오기</textarea>
					</div>
					<div class="modifyForm_2">
						<i class="fa-solid fa-angles-right fa-2x" style="color: #ffffff;"></i>
					</div>
					<div class="modifyForm_3">
						<textarea name="modifiedCode" id="afterCode" cols="30" rows="10" disabled>코드 가져오기</textarea>
					</div>
				</div>
			</div>
			
			<div class="modifyForm-area_info">
				<div class="modifyForm-top">
					<span>manual</span>
					<button type="button">cancle</button>
					<span class="resetForm"><i class="fa-solid fa-rotate-left fa-lg" style="color: #ffffff;"></i></span>
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
	    </div>
	    
    </div>
	<%@include file="../../common/footer.jsp"%>
</body>
</html>