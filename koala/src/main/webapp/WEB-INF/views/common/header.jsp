<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.hoju.koala.admin.model.vo.Client"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- [1.0] 캐시 비활 성화  뒤로가기 시 캐시로 인해 제대로 작동 안하는 경우가 많다. -->
<meta http-equiv="Pragma" content="no-cache">
<title>Insert title here</title>
<!-- 부트스트랩cdn -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

<!-- sockjs 라이브러리 -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1.6.1/dist/sockjs.min.js"></script>

</head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- font-awesome Copy Link Tag (아이콘 CDN) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

	.notosanskr * { 
	 font-family: 'Noto Sans KR', sans-serif;
	}
    body{
        background-color: rgb(30, 30, 30);
        color: white;
        positon: relative;
        font-family: 'Noto Sans KR', sans-serif;
    }
    #wrap{
        width: 1500px;
    	position: absolute;
    	z-index: 1;
    }
    #wrap>div{
    	width: 100%;
    	height: 150px;
    	background-color: rgb(30, 30, 30);
    	position: fixed;
    }
    #header{
        width: 1400px;
        height: 99%;
        margin: auto;
    }
    #line{
        width: 1500px;
        height: 1%;
        background-color: rgb(100, 100, 100);
        margin: auto;
    }
    #header>div{height: 100%; float: left;}
    #header_1{width: 15%;}
    #header_2{width: 70%;}
    #header_3{width: 5%;}
    #header_4{width: 10%;}

    #header_2>div{width: 100%;}
    #header_2_1{height: 70%;}
    #header_2_2{height: 29%;}

    #header_1 i{padding-top: 70px;}
    #header_1 i:hover, #back>i:hover{cursor: pointer;}
    #header_2_1>h1{
        margin: 0;
        padding-top: 35px;
    }
    #header_2_1>h1>span{
        font-size: 50px;
        font-weight: 700;
		color: rgb(40, 150, 223);
		text-shadow: 2px 2px 2px rgb(40,30,223);
	}
    #header_2_1:hover{
    	cursor: pointer;
    }
    #header_2_2>h4{
        margin: 0;
        font-size: 20px;
        padding-top: 10px;
        color: rgb(248, 185, 147);
    }
    
    #header_3{
    	padding-top: 10px;
    }
    
    #header_4_1{
    	height: 100%;
    	width: 100%;
        flex-direction: column;
    }
    #header_4_1 div{width: 100%; height: 100%;}
    #header_4_1 li{width: 150px; height: 30px;}
    #myPage{width: 100%; height: 100%; border: 0; text-align: center;}

    .ac-wrap>ul{
    	list-style-type: none;
    	padding-top: 30px;
    }
    .ac-wrap>ul>li, .ac-wrap>ul>li>select{
		border-radius: 50px;
    	background-color: rgb(50, 50, 50);
    	color: white;
    	margin-bottom: 10px;
    }
    .ac-wrap>ul>li>select>option{border-radius: 50px;}
    .ac-wrap>ul>li:hover{
    	background-color: rgb(40, 40, 40);
    }
    .ac-wrap a{
    	display: block;
    	text-decoration: none;
    	text-align: center;
    	color: white;
    	line-height: 28px;
    }
    
	#darkmode{
		position: absolute;
		position: fixed;
		margin: auto;
		right: 5%;
		bottom:5%;
	}
	/* 페이징 버튼 처리 css */
	#pagingArea {width:fit-content; margin:auto;}
	
	
	.ac-wrap>i:hover{
		cursor:pointer;
	}
	
	.modal{
		color: black;
	}
	
	
	/* 채팅방 css */

#chat-room {
    height:100%;
    /* 임시 */
    outline:2px solid black;
    position:relative;
}

#chat-room .message-box {
    padding:0 0.7rem;
    overflow-y:scroll;
    height:calc(100% - 4.4rem);
}



#chat-room .chat-message {
    margin-left:3rem;
    margin-top: 1rem;
    position:relative;
}

#chat-room .chat-message > section {
    position:absolute;
    top:0;
    left:-3rem;
}

#chat-room .chat-message > span {
    display:block;
}

#chat-room .chat-message > section {
    font-size:3rem;
}


#chat-room .chat-message::after {
    content:"";
    display:block;
    clear:both;
}

#chat-room .chat-message > div {
    background-color:white;
    float:left;
    padding:0.8rem;
    border-radius:1rem;
    clear:both;
    font-weight:bold;
    font-size:1.46rem;
    box-shadow: 1px 1px 0 rgba(0,0,0,0.3);
}

#chat-room .chat-message.mine > div {
    background-color: skyblue;
    float:right;
    box-shadow: -1px 1px 0 rgba(0,0,0,0.3);
}

#chat-room .chat-message.mine > span {
    display:none;
}

#chat-room .chat-message.mine > section {
    display:none;
}

#chat-room .input-box {
    position:absolute;
    bottom:0;
    left:0;
    width:100%;
}

#chat-room .input-box #text-input {
    width:100%;
    display:block;
    border:0;
    outline:none;
    padding-right:8.5rem;
    padding-left:1rem;
    padding-top:0.1rem;
    font-size:1.4rem;
    line-height:4rem;
    font-weight:bold;
    box-sizing:border-box;
}

#chat-room .input-box .btn-plus {
    position:absolute;
    top:0;
    left:0;
    width:4rem;
    height:100%;
    background-color:#D1D1D1;
}


#chat-room .input-box .btn-submit {
    position:absolute;
    right:1rem;
    top:50%;
    transform:translateY(-50%);
    padding:10px;
    background-color:#fdf01b;
    padding:10px;
    color: black;
    border-radius:3px;
    font-size:1.3rem;
    box-shadow:0 1px 10px rgba(0,0,0,0.2);
    user-select:none;
}

#chat-room .input-box .btn-emo {
    position:absolute;
    right:6rem;
    top:50%;
    transform:translateY(-50%);
    font-size:2rem;
    color:#CBCBCB;
    user-select:none;
}




</style>
<body>
	<script>
		$(function(){
			$("#menuOnBtn").on("click", function(){ //메뉴바 펼치기
 				$('#menu').css("transform","translateX(0px)");
				//$('#menu').css("transform","translateY(0px)");
			});
			$("#menuOffBtn").on("click", function(){ //메뉴바 닫기
				$('#menu').css("transform","translateX(-950px)");
				//$('#menu').css("transform","translateY(-100%)");
			})
		});
	</script>
    <%@include file="menubar.jsp"%>
    <div id="wrap">
    <div>
        <div id="header">
            <div id="header_1">
                <i id="menuOnBtn" class="fa-solid fa-bars fa-2xl" style="color: #ffffff;"></i>
            </div>
            <div id="header_2">
                <div id="header_2_1">
                    <h1 onclick="location.href='/koala'"><span>Koala </span><span style="color:white; font-size: 30px;"> initializr</span></h1>
                    
                </div>
                <div id="header_2_2">
                	<!-- /각 카데고리/이후 주소  ex) /admin/supporter/...-->
                	<!-- 각자 맘에 드는 이름으로 바꾸시면 됩니다. -->
                	<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
                	<c:choose>
                		<c:when test='${path.contains("admin")}'>
                		<c:choose>
                			<c:when test='${path.contains("main")}'>
		                		<h4 class="headerName" onclick="adminPage();">Admin Page</h4>                			
                			</c:when>
                			<c:when test='${path.contains("supporters.list")}'>
                				<h4 class="headerName" onclick="adminPage();">Admin Supporter Management</h4>     
                			</c:when>
                			<c:when test='${path.contains("issuearea.list")}'>
                				<h4 class="headerName" onclick="adminPage();">Admin Issues Management</h4>     
                			</c:when>
                			<c:when test='${path.contains("member.list")}'>
                				<h4 class="headerName" onclick="adminPage();">Admin Member Management</h4>     
                			</c:when>
                			<c:when test='${path.contains("errorcheck.list")}'>
                				<h4 class="headerName" onclick="adminPage();">Admin Error Management</h4>     
                			</c:when>
                			<c:when test='${path.contains("waitingLibrary.list")}'>
                				<h4 class="headerName" onclick="adminPage();">Admin WaitingLibrary</h4>     
                			</c:when>
                			<c:when test='${path.contains("blockip.list")}'>
                				<h4 class="headerName" onclick="adminPage();">Koala Black List</h4>     
                			</c:when>
                			<c:when test='${path.contains("errorDetail")}'>
                				<h4 class="headerName" onclick="adminPage();">Koala ErrorDetail</h4>     
                			</c:when>
                		</c:choose>    
                		</c:when>
                		<c:when test='${path.contains("together/sqlCloud")}'>
                			<h4 class="headerName" onclick="sqlMain();">Koala SQL Cloud</h4>     
                		</c:when>
                		<c:when test='${path.contains("errorBoard")}'>
                		<!-- koala/errorBoard/~~~ >> 설희 -->                		
	                		<h4 class="headerName" onclick="errorBoardPage();">ErrorBoard</h4>
                		</c:when>
                		<c:when test='${path.contains("member")}'>
                		<!-- koala/member/~~~ >> 병국 -->
                			<c:choose>
                				<c:when test="${path.contains('enroll')}">
			                		<h4 class="">Enroll</h4>					
                				</c:when>
                				
                				<c:when test="${path.contains('ad') || path.contains('boardList') || path.contains('replyList') || path.contains('likedList') || path.contains('followingList') || path.contains('contributions')}">
                					<h4 class="">Activity Details</h4>
                				</c:when>
                				
                				<c:when test="${path.contains('as')}">
                					<h4 class="">Account Settings</h4>
                				</c:when>
                				
                			</c:choose>     		
                		</c:when>
                		<c:when test='${path.contains("qnaBoard")}'>
                		<!-- koala/qnaBoard/~~~ >> 지수 -->                		
	                		<h4 class="headerName" onclick="qnaBoardPage();">QnaBoard</h4>
                		</c:when>
                		<c:when test='${path.contains("createSetting")}'>
                		<!-- koala/createSetting/~~~ >> 공통 -->                		
	                		<h4 class="headerName" onclick="adminPage();">CreateCode && DownloadFile</h4>
                		</c:when>
                		<c:when test='${path == "/index.jsp"}'>
                		<!-- main 페이지 -->                		
	                		<h4>Koala Main</h4>
                		</c:when>
                		<c:otherwise>        		
                		<!-- 기타 페이지 (에러 등등) -->
	 	                   <h4 onclick="mainPage();">Koala Help</h4> <!-- 조건문 걸기 -->
                		</c:otherwise>
                	</c:choose>
                </div>
            </div>
            
            <div id="header_3">
            	<c:if test="${not empty loginUser }">
					${loginUser.nickName }님 <br>
					<i id="message-icon" class="fa-regular fa-comment fa-2xl" data-bs-toggle="modal" data-bs-target="#messengerModal"></i>
            	</c:if>
            </div>
            
            <div id="header_4">
                <div id="header_4_1">
                	<c:choose>
                		<c:when test="${empty loginUser }">
               				<div class="ac-wrap">
            	    			<ul>
        	        				<li><a href="/koala/member/login">Login</a></li>
    	            				<li><a href="/koala/member/enroll">Sign up</a></li>                				
	                			</ul>
               				</div>
                   		</c:when>
                   		<c:otherwise>
                   			<div class="ac-wrap">
                   				<ul>
                   					<li>
		                	   			<select id="myPage">
		            	       				<option>My Page</option>
		        	           				<option value="ad">Activity Details</option>
		    	               				<option value="as">Account Settings</option>
			                   			</select>
                   					</li>
                   					<li><a href="/koala/member/logout">Logout</a></li>
                   				</ul>
                   			</div>
                   			
                   			<script>
                   				$(function(){
                   					$("#myPage").change(function(){
                   						if(this.value == "ad"){
                   							console.log("hi");
                   							location.href = "/koala/member/ad?userId=${loginUser.userId}";
                   						}else if(this.value == "as"){
                   							location.href = "/koala/member/as";
                   						}
                   					});
                   				});
                   			</script>
                   		</c:otherwise>
                	</c:choose>
                </div>
            </div>
        </div>
        <div id="line"></div>
    </div>
    </div>
    <div id="darkmode">
    	<i id="dark" class="fa-solid fa-sun fa-2xl" style="color: rgb(255, 246, 246)" onclick="changeMode(event);"></i> <br><br> <!-- 수정할 것 -->
    	<i id="white" class="fa-solid fa-moon fa-2xl" style="color: rgb(30, 30, 30)" onclick="changeMode(event);"></i>
    </div>
    
    <!-- 메신저 모달창 -->
    <div class="modal fade" id="messengerModal" tabindex="-1">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">메신저</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	
	      	<div class="input-group mb-3">
			  <input type="text" id="searchUser" name="searchUser" class="form-control" placeholder="닉네임 검색">
			  <button class="btn btn-outline-secondary" type="button" id="searchUserBtn">Search</button>
			</div>
	        
        	<table id="searchList">
        	</table>
        	<hr>
	        <p>최근 연락하던 유저</p>
	        
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 메신저 스크립트 -->
	<script>
		$(function(){
			$("#searchUserBtn").on("click", function(){
				var searchUser = $("#messengerModal #searchUser").val();
				
				console.log(searchUser);
				
				$.ajax({
					url:"/koala/member/searchUser",
					data:{
						searchUser:$("#messengerModal #searchUser").val()
					},
					success:function(list){
						var str = "<tr><th>--검색결과--</th></tr>";
						
						if(list != null){
							for(var i in list){
								str += "<tr id='connectChat' data-bs-toggle='modal' data-bs-target='#chatRoomModal'>"
									 + "<td>"+list[i].nickName+"</td>"
									 + "</tr>";
							}
						}else{
							str += "<tr><td>조회된 회원이 없습니다.</td></tr>";
						}
						
						
						$("#searchList").html(str);
					},
					error:function(){
						alert("유저 찾기 통신 오류");
					},
					complete:function(){
						$("#searchUser").val("");
					}
				});
				
				
			});
			
			$(".modal").on("hidden.bs.modal", function(){
				$("#searchList").html("");
			});
		});
	</script>
	
	<!-- 채팅방 모달창 -->
    <div class="modal fade" id="chatRoomModal" tabindex="-1">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">채팅방</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      
	      
	   		<div id="chat-room" style="height: 600px;">
			    <div class="message-box">
			        <div class="message-group">
			            <div class="chat-message other">
			                <section><i class="fa fa-user"></i></section>
			                <span>관리자</span>
			                <div>반갑소</div>
			            </div>
			            
			            <div class="chat-message mine">
			                <section><i class="fa fa-user"></i></section>
			                <span>테스트</span>
			                <div>어허이..</div>
			            </div>
			        </div>
			    </div>
			    
			    <div class="input-box">
			        <input type="text" id="text-input">
			        <div class="btn-emo">
			            <i class="fa fa-smile-o" aria-hidden="true"></i>
			        </div>
			        <div class="btn-submit">
			            <span>전송</span>
			        </div>
			    </div>
			</div>
			
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 채팅방 스크립트 -->
	<script>
		$(function(){
			
			var sockJS;
			
			//chat채팅방 들어가면 웹소켓 생성
			//$("#connectChat").on("click", function(){
				//sockJS = new SockJS("/chat");
			//});
			
			sockJS.onopen = function(){
				console.log("sockjs open");
			}
			
			sockJS.onclose = function(){
				console.log("sockjs close");
			}
						
			sockJS.onerror = function(){
				console.log("sockjs error");
			}
			
			//sockJS.onmessage = function(data){
				
			//}
			
			//모달닫히면 종료.
			$("#chatRoomModal").on("hidden.bs.modal", function() {
				//sockJS.close();
		  	});
			
			
			
			
			//입력하고 엔터하면 submit버튼 눌림
			$("#chat-room>.input-box>input").on("keydown", function(e){
				if(e.keyCode == 13){
					e.preventDefault();
					$("#chat-room>.input-box>.btn-submit").click();
				}
			});
			
			//submit버튼이 클릭 되면
			$("#chat-room>.input-box>.btn-submit").on("click", function(){
				var msg = $("#chat-room>.input-box>input").val();
				console.log(msg);
				
				
				
				var str = "";
				
				str += "<div class='chat-message mine'>"
					 + "<section><i class='fa fa-user'></i></section>"
					 + "<span>${loginUser.nickName}</span>"
					 + "<div>"+msg+"</div>"
					 + "</div>";
				
				$("#chat-room>.message-box>.message-group").append(str);
				   
				$("#chat-room>.input-box>input").val("");
				
				//sockJS.send(msg);
			});
		    
			
		});
		
	</script>
	<!-- <script>
		$(function(){
			var sock = new SockJS()
			//메세지 입력
			$("#msg").on("keydown", function(e){
				if(e.keyCode == 13){
					e.preventDefault();
					$("#sendMsg").click();
				}
			});
			
			$("#sendMsg").on("click", function(){
				console.log("hi");
			});
		})
	</script> -->
    
    
    
    
    <script>

    	$(function(){
    		var mode = "${cookie.mode.value}";
    		if(mode == "dark"){
    			darkmode();
    		}else{
    			whitemode();
    		}
    	})
    
        function changeMode(e){
        	if(e.target.id == "dark" || !e.target){
        		test(e);
        		darkmode();
        	}else{
        		test(e);
        		whitemode();
        	}
        }
    	
    	function darkmode(){
    		$("body, #wrap>div").css("background-color", "rgb(255, 246, 246)").css("color", "black");
        	$(".topLine").css("background-color", "white")
        	$(".ii").css("color", "black");
        	$(".ic").css("background-color", "white").css("color","black");
    	}
    	
    	function whitemode(){
    		$("body, #wrap>div").css("background-color", "rgb(30, 30, 30)").css("color", "white");
    		$(".topLine").css("background-color", "black");
    		$(".ii").css("color", "#ffffff");
    		$(".ic").css("background-color", "black").css("color","#ffffff");
    	}
        
        
        // 쿠키를 보내기 위한 함수
        /* function test(e){
        	$.ajax({
        		url : "/koala/admin/mode.check",
        		data : {
        			mode : e.target.id,
        		},
        		success : (data)=>{
        		},
        		error : ()=>{
        			console.log("mode check aJax error");
        		}
        	});
        } */
        
        //배경 색 - 다크모드:rgb(30, 30, 30) / 라이트모드:rgb(255, 246, 246)
        //글자 색 - 다크모드:white / 라이트모드:black
        //컨텐트 박스 - 다크모드:black / 라이트모드:white
        
        // sqlCloudMain()
        function sqlMain(){
        	location.href="/koala/together/sqlCloud?teamNo=0";
        }
        
        // admin page ()
       	function adminPage(){
        	location.href = "/koala/admin/main";
        }
        // errorBoard page ()
       	function errorBoardPage(){
        	location.href = "/koala/errorBoard/list";
        }
        // qnaBoard page ()
       	function qnaBoardPage(){
        	location.href = "/koala/qnaBoard/list";
        }
        // main으로 Page()
        function mainPage(){
        	location.href="/koala/";
        }
        
        $(".headerName").on("mouseenter", function(){
        	$(this).css("cursor", "pointer");
        })
        
        
        // jang : IP 차단용 코드 입니다.
        $(function(){
        	var blockIp;
        	if(blockIp != ""){
        		// 배포시 주석 풀기... (차단 되어 사용이 불가능하다.)
/*          		if(navigator.appVersion.indexOf("MSIE6.0") >= 0){
        			parent.window.close();
        		}else{
        			alert("진짜 꺼져");
        			parent.window.open("about:black","_self").close();
        		}   */
        	}})
         </script>
    
    <!-- 알림메세지 -->
    <c:choose>
    	<c:when test="${not empty msg && empty param.msgc }">
    		<script>
				alert("${msg}");				    	
    		</script>
    		<c:remove var="msg" scope="session"/>
    	</c:when>
    </c:choose>
    
	<!-- 자동완성 끄기 -->
	<script>
		$(function(){
			$("input").attr("autocomplete", "off");
		});
	</script>

</body>
</html>