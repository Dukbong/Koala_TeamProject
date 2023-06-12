<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>

	*{
		box-sizing: border-box;
	}
	#content{
		margin: auto;
		width: 80%;
		height: 1000px;
	}
	
	#insert-form{
		width: 100%;
		height: 100%;
	}
	
	#content_1{
		width: 100%;
		height: 100%;
		margin: 0 auto;
		border: 1px solid #dadada;
		border-radius: 5px;
		margin-top: 15px;
		margin-bottom: 15px;
	}
	
	#enroll-area{
		height: 100%;
		width: 100%;
	}
	
	
	.box{
		float: left;
		width: 60%;
		height: 40px;
		border: 1px solid #dadada;
		padding: 10px;
		border-radius: 5px;
		margin-bottom: 20px;
	}
	
	textarea{
		width: 100%;
	}
	
	#center{
		width: 50%;
		height: 80%;
		padding:5% 0;
	}
	
	label,#ToU{
		float: left;
	}
	
	#no-float{
		float: none;
	}
	
	.pack{
		float: left;
		width: 100%;
	}
	
	.pack>button{
		float: left;
		height: 40px;
		width: 80px;
		padding: 10px;
		border-radius: 5px;
		margin-bottom: 20px;
	}
	
	#level{
    	appearance: none;
    	border-radius: 10px;
	}
	
	.hide{
		display: none;
	}
	
</style>
</head>
<body>
	<script>
		var code = "";
		
		//유효성(정규표현식)
		var idCheck = true;
		var pwdCheck = true;
		var nickCheck = true;
		var emailCheck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		$(function(){
			/* 아이디 중복 쳌크*/
			if(idCheck){ //유효성통과하면
				$("#userId").on("keyup", function(){
					
					console.log($("#userId").val());
					
					$.ajax({
						url:"/koala/member/idCheck",
						data:{
							inputId : $("#userId").val()
						},
						success:function(result){
							if(result>0){
								//중복
								$("#id_able").css("display", "none");
								$("#id_disable").css("display","block");
							}else{
								$("#id_disable").css("display","none");
								$("#id_able").css("display", "block");
							}
						},
						error:function(){
							alert("통신실패");
						}
					});
				});
			}
			
			/* 비밀번호 재확인이랑 일치하는지*/
			if(pwdCheck){
				$("#checkPwd").on("keyup", function(){
					var userPwd = $("#userPwd").val();
					var checkPwd = $("#checkPwd").val();
					
					if(userPwd == checkPwd){//일치하다면
						$("#pwd_no").css("display", "none");
					}else{
						$("#pwd_no").css("display", "block");
					}
				});
			}
			
			
			/* 닉네임 중복 체크 */
			if(nickCheck){
				$("#nickName").on("keyup", function(){
					
					console.log($("#nickName").val());
					
					$.ajax({
						url:"/koala/member/nickCheck",
						data:{
							inputNick : $("#nickName").val()
						},
						success:function(result){
							if(result>0){
								//중복
								$("#nick_disable").css("display","block");
							}else{
								$("#nick_disable").css("display","none");
							}
						},
						error:function(){
							alert("통신실패");
						}
					});
				});
			}
			
			/* 이메일에 인증코드 보내기 */
			$("#emailSend").on("click", function(){
				
				if(emailCheck.test($("#email").val())){
					
					$.ajax({
						url:"/koala/member/emailCheck",
						data:{
							inputEmail:$("#email").val()
						},
						success:function(result){
							
							console.log("code : "+result);
							code = result;
							alert("이메일에 인증번호를 보냈습니다.");
						},
						error:function(){
							alert("통신실패");
						}
					});
					
				}else{
					alert("이메일을 다시 입력해주세요.");
				}
				
			});
			
			/* 보낸 인증번호와 맞는지 확인 */
			$("#emailCheck").on("click", function () {
				var inputCode = $("#certiCode").val();
				
				if(inputCode === code){
					$("#certi_no").css("display", "none");
					$("#certiCode").css("display", "none");
					$("#certi_yes").css("display", "inline-block");
					
				}else{
					$("#certi_no").css("display", "block");
				}
			});
			
			
		});
		
		
	</script>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div id="content">
		<div id="content_1" align="center">
	        <div id="enroll-area">
	            <form action="insert" method="post" id="insert-form">
	            	<div id="center">
	            		<div id="pack">
			                <label for="userId">ID</label>
			                <input type="text" class="box" id="userId" placeholder="아이디" name="userId" required>
			                <span class="hide" id="id_able">사용 가능한 아이디입니다.</span>
			                <span class="hide" id="id_disable">이미 사용중인 아이디입니다.</span>
	            		</div>

	            		<div class="pack">
			                <label for="userPwd">Password</label>
			                <input type="password" class="box" id="userPwd" placeholder="비밀번호" name="userPwd" required><span style="font-size: 15px;">보안성</span>
			                <progress max="4" value="0" id="level"></progress>
			                <span class="hide">비밀번호 양식을 지켜주세요.</span>
	            		</div>
						
	            		<div class="pack">
			                <label for="checkPwd">Password Check</label>
			                <input type="password" class="box" id="checkPwd" placeholder="비밀번호 재확인" required>
			                <span class="hide" id="pwd_no">비밀번호가 일치하지 않습니다.</span>
	            		</div>
	            		
	            		<div class="pack">
			                <label for="nickName">Nickname</label>
			                <input type="text" class="box" id="nickName" placeholder="닉네임" name="nickName" required>
			                <span class="hide">올바른 닉네임명을 입력해주세요.</span>
			                <span class="hide" id="nick_disable">이미 사용중인 닉네임입니다.</span>
	            		</div>
	            		
	            		<div class="pack">
		     	           <label for="email">Email</label>
		        	        <input type="email" class="box" id="email" placeholder="이메일" name="email">
		        	        <button type="button" id="emailSend">send</button>
	            		</div>
	            		
	            		<div class="pack">
			                <label for="address">Verification Code</label>
			                
			                <input type="text" class="box" id="certiCode" placeholder="인증번호" required><button type="button" id="emailCheck">check</button>
			                <span class="hide" id="certi_no">인증번호가 일치하지 않습니다.</span>
			                <input type="text" class="box hide" id="certi_yes" readonly value="인증 완료" style="background-color: blue;">
	            		</div>
		
		                <span id="ToU">Terms of Use</span>
		                <textarea cols="30" rows="10" style="resize:none; height: 200px">
[코알라] 회원가입 및 개인정보 수집 및 이용약관

제 1조 (목적)
이 약관은 [코알라]에서 제공하는 서비스를 이용하는 회원의 개인정보 보호를 위해 회원가입 시 개인정보 수집 및 이용에 관한 내용을 규정함을 목적으로 합니다.

제 2조 (수집하는 개인정보의 항목)
[코알라]은 회원가입을 위해 아래와 같은 개인정보를 수집합니다.

- 이메일 주소: 회원 식별 및 서비스 이용에 필요한 정보로 사용됩니다.
- 비밀번호: 회원 계정 보호 및 개인정보 보안을 위해 사용됩니다.
- 닉네임 또는 사용자명: 서비스 내에서 회원을 구분하고, 타인에게 공개될 경우 회원의 동의를 받습니다.

제 3조 (개인정보의 수집 및 이용목적)
[코알라]은 수집한 개인정보를 다음의 목적으로 사용합니다.
- 회원 식별 및 서비스 제공: 회원의 식별과 서비스 이용에 필요한 정보로 사용됩니다.
- 서비스 개선 및 맞춤화: 회원의 서비스 이용 패턴 및 선호도를 분석하여 서비스를 개선하고 맞춤화합니다.
- 고객 지원 및 문의 응답: 회원의 문의나 요청에 대한 응답 및 서비스 관련 공지사항 전달에 사용됩니다.
- 마케팅 및 광고 활동: 회원의 동의 하에 개인정보를 활용하여 서비스와 관련된 마케팅 및 광고 활동을 진행할 수 있습니다.

제 4조 (개인정보의 보유 및 이용기간)
[코알라]은 회원 탈퇴 시 또는 개인정보 이용목적 달성 시까지 개인정보를 보유 및 이용하며, 법령에 따라 보관할 필요가 있는 경우에는 해당 법령에서 정한 기간 동안 개인정보를 보관합니다.

제 5조 (개인정보의 제3자 제공)
[코알라]은 회원의 개인정보를 본래의 목적 이외에 제3자에게 제공하지 않습니다. 다만, 회원의 사전 동의를 받은 경우 또는 법령에 의거하여 제공되는 경우에는 예외로 합니다.

제 6조 (개인정보의 안전성 확보)
[코알라]은 개인정보보호법에서 정한 기술적, 관리적, 물리적 보호조치를 취하여 회원의 개인정보를 안전하게 관리합니다.

제 7조 (회원의 권리와 의무)
회원은 언제든지 자신의 개인정보를 열람하고 수정할 수 있습니다. 회원은 개인정보의 수집 및 이용에 대한 동의를 거부할 권리가 있습니다. 단, 이 경우 서비스 이용에 제한이 있을 수 있습니다. 회원은 자신의 개인정보를 최신의 상태로 유지하여 정확한 정보를 제공해야 합니다. 회원은 자신의 개인정보에 대한 보안을 유지해야 하며, 타인에게 개인정보가 유출되지 않도록 주의해야 합니다.

제 8조 (개인정보 관리 책임자)
[코알라]은 회원의 개인정보를 보호하고 개인정보와 관련된 불만을 처리하기 위해 개인정보 관리 책임자를 지정하여 운영하고 있습니다. 개인정보 관련 문의사항은 아래의 연락처로 문의하여 주시기 바랍니다.

이름: 
이메일: 
전화번호:
		                </textarea>
		                <input type="checkbox" id="agree">
		                <label for="agree" id="no-float">이용약관 및 개인정보 수집에 동의합니다.</label>
		               	
		               	<div>
			                <button type="button">submit</button>		               	
		               	</div>
	            	</div>
	            </form>
	        </div>
	    </div>
	    
	</div>
	
	<script>
	</script>
	
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>