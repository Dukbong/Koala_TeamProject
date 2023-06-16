<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>

	div{
 		/* border: 1px solid white; */
		box-sizing: border-box;
	}
	


    #outer{
        height: 1300px;
        width: 80%;
    	margin: auto;
    }
    
	#select-mypage a{
		height: 10%;
        color: darkcyan;
        text-decoration: none;
    }
    
    #content{
    	height: 100%;
    	width: 100%;
    }
    
    #content1,#content2,#content3{
    	margin: auto;
    	width: 80%;
    	margin-bottom: 5%;
    	background-color: black;
    	padding: 30px;
    }
    
    #content1{
    	height: 40%;
    }
    #content2{
    	height: 15%;
    }
    
    #content3{
    	height: 25%;
    }
    
    .sub-title{
    	font-size: 35px;
    	color: rgb(220, 135, 55);
    	height: 60px;
    }
    
    #info-area{
    	width: 100%;
    	height: 80%;
    }
    
    form{
    	height: 100%;
    	width: 100%;
    }
    
    #area1,#area2{
    	height: 100%;
    	display: inline-block;
    	float:left;
    }
    
    #area1{
    	width: 60%;
    }
    
    .noneChange{
    	height:50%;
    }
    
    
    
    .changeAble{
    	height:40%;
    }
    
    .pack{
    	margin: 20px 0px;
    }
    
    .pack>label{
    	font-size: 20px;
    }
    
    .box{
        display: block;
        padding: 5px;
        border: 1px solid lightgray;
        border-radius: 5px;
        height: 50px;
        width: 80%;
        font-size: 16px;
    }
    
    .readonly{
    	background-color: black;
    	color: white;
    }
    
    #area2{
    	width: 40%;
    }
    
    #profile{
    	height:80%;
    }
    
    #ubt{
    	height:15%;
    	padding: 10px;
    	text-align: center;
    }
    
    
    #delete-area{
    	color: red;
    	height: 70%;
    	widht: 100%;
    }
    
    #warning-message,#warning-btn{
    	height: 100%;
    	display: inline-block;
    	float:left;
    }
    
    #warning-message{
    	width: 85%;
    	font-size: 25px;
    }
    
    #warning-btn{
    	width: 15%;
    	padding: 15px;
    }
	
	#warning-btn>button{
    	float: right;
    	margin-right: 0px;
    	margin-bottom: 0px;
	}
	
	.btn-size{
		height: 40px;
		width: 100px;
	}
	
	.modal{
		color: black;
		-webkit-user-select: none;
		-moz-user-select: none;
		-ms-user-select: none;
		user-select: none;
	}
	
	
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div id="outer">
		
	    
		<div id="content">
			<div id="content1">
				<div class="sub-title">
					<span>Account Info</span>
				</div>
				<div id="info-area">
						<div id="area1">
							<div class="noneChange">				
								<div class="pack">
					                <label for="userId">ID</label><br>
					                <input type="text" class="box readonly" id="userId"name="userId" value="aaaa${loginUser.userId }" readonly>
			            		</div>
			            		
			            		<div class="pack">
									<label for="email">Email</label><br>
				        	        <input type="email" class="box readonly" id="email" name="email" value="${loginUser.email }" readonly>
			            		</div>
							</div>
							
							<div class="changeAble">
								<div class="pack">
				                	<label for="nickName">Nickname</label><br>
									<input type="text" class="box" id="nickName" placeholder="닉네임" name="nickName" required value="${loginUser.nickName }">
		            			</div>
							</div>
		            		
						</div>
					<form action="/koala/member/profile" method="post">
						<div id="area2">
							<div id="profile">
								<div align="center">
									<span>Profile Image</span>
								</div>
								<div align="center" style="margin-top: 30%;">
									<img alt="" src="">
									<span style="font-size:40px;">이미지</span>
								</div>
							</div>
							
							<div id="ubt">
								<button class="btn-size">Change</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			
			<div id="content2">
				<div class="sub-title">
					<span>Change Password</span>				
				</div>
				<div id="password-area">
					<div id="">
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#updatePwdModal">
						  Change
						</button>
					</div>
				</div>
			</div>
			
			
			<!-- Modal -->
			<div class="modal fade" id="updatePwdModal" tabindex="-1">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="changePwdLabel">비밀번호 변경</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        	현재 비밀번호 : <input type="password" name="userPwd" required><br>
			        	변경할 비밀번호 : <input type="password" name="newPwd" id="newPwd" required><br>
			      </div>
			      <div class="modal-footer">
			        <button type="button" id="updatePwd" class="btn btn-primary">Update</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			<script>
				var pwdExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/; //영문,숫자 8자리 이상
				
				$(function(){
					$("#updatePwd").on("click", function(){
						if(pwdExp.test($("#newPwd").val())){
							$.ajax({
								url:"/koala/member/updatePwd",
								method:"post",
								data:{
									userPwd:$("#updatePwdModal input[name=userPwd]").val(),
									newPwd:$("#updatePwdModal input[name=newPwd]").val()
								},
								success:function(result){
									if(result==1){
										alert("성공적으로 변경되었습니다.");
										
										$("#updatePwdModal").modal("hide");
									}else if(result==0){
										alert("다시 입력해주세요.");
										
										$("#updatePwdModal input[name=userPwd]").val("");
										$("#updatePwdModal input[name=newPwd]").val("");
										
										$("#updatePwdModal input[name=userPwd]").focus();
									}
								},
								error:function(){
									alert("통신오류~!");
								}
							});
						}else{
							alert("비밀번호 양식을 확인해주세요.");
							$("#newPwd").focus();
						}
					});
				});
			</script>
			
			
			
			<div id="content3">
				<div class="sub-title">
					<span>Account Delete</span>				
				</div>
				<div id="delete-area">
					<div id="warning-message">
						<p>
							Once you delete your account, there is no going back.<br>
							Please be certain.
						</p>
					</div>
					<div id="warning-btn">
						<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteAccountModal">Delete</button>
					</div>
				</div>
			</div>
			
			<!-- Modal -->
			<div class="modal fade" id="deleteAccountModal" tabindex="-1">
			  <div class="modal-dialog modal-dialog-centered modal-lg">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="changePwdLabel" style="color: red;">정말로 삭제하시겠습니까?</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        	<p>
			        		-계정 삭제 후에도 관련 데이터는 30일 동안 서버에 보관되고, 이후 영구적으로 계정이 삭제됩니다.<br>
			        		-삭제된 계정으로의 접근 및 서비스 이용은 불가능합니다.<br>
			        		-삭제 이후 데이터 복구가 불가능하니 사전에 필요한 정보를 백업해주세요.<br>
			        	</p>
			      </div>
			      <div class="modal-footer">
			      	<span style="color: orange;">계정 삭제를 진행하시려면 delete_account_${loginUser.userId }를 입력하시고 Delete버튼을 클릭하세요.</span><br>
			      	<div class="input-group" style="width:80%;">
				      	<input type="text" id="inputText" class="form-control" placeholder="delete_account_nickname" onselect="return: null;">
				      	<button class="btn btn-danger" type="button" id="deleteAccount">Button</button>
			      	</div>
			      </div>
			    </div>
			  </div>
			</div>
			
			<script>
				$(function(){
					//모달창이 닫히면 안에 값을 초기화
					$(".modal").on("hidden.bs.modal", function(){
						$(".modal input").val("");
					});
					
					//모달창안에서 delete버튼 누르면
					$("#deleteAccount").on("click", function(){
						
						var inputText = $("#deleteAccountModal #inputText").val();
						
						if(inputText === "delete_account_${loginUser.userId}"){
							
							if(window.confirm("정말로 삭제하시겠습니까?")){
								//예 누르면 비동기통신으로 삭제 진행
								$.ajax({
									url:"/koala/member/deleteMember",
									method:"post",
									data:{
										userId:${loginUser.userId}
									},
									success:function(result){
										if(result>0){
											alert("계정 삭제완료");
											
											$("#deleteAccountModal").modal("hide");
										}else{
											alert("계정 처리중 오류발생!");
										}
									},
									error:function(){
										alert("통신오류");
									}
								});
	
							}else{
								alert("봐줌ㅋ");
							}
							
						}else{
							//입력값 틀림
							alert("다시 입력해주세요.");
							$("#inputText").val("");
							$("#inputText").focus();							
						}
					});
				});
			</script>
		</div>
	</div>
	    
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>