<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- [1.0] 캐시 비활 성화  뒤로가기 시 캐시로 인해 제대로 작동 안하는 경우가 많다. -->
<meta http-equiv="Pragma" content="no-cache">
<title>Insert title here</title>

</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
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
        width: 100%;
        height: 180px;
    }

    #header{
        width: 80%;
        height: 99%;
        margin: auto;
    }
    #line{
        width: 80%;
        height: 1%;
        background-color: rgb(172, 171, 169);
        margin: auto;
    }

    #header>div{height: 100%; float: left;}
    #header_1{width: 15%;}
    #header_2{width: 65%;}
    #header_3{width: 20%;}

    #header_2>div{width: 100%;}
    #header_2_1{height: 70%;}
    #header_2_2{height: 29%;}

    #header_1>i{padding-top: 65px;}
    #header_2_1>h1{
        margin: 0;
        font-size: 50px;
        padding-top: 30px;
        color: rgb(40, 151, 223);
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
    
    #header_3_1{
    	border: 1px solid red;
    	height: 100%;
    	width: 100%;
    	top: 0;
    	left: 0;
    	bottom: 0;
    	right: 0;
    	text-align: center;
    	display: flex;
    	justify-content: center;
        flex-direction: column;
    }
    
    #header_3_1>a{
    	text-decoration: none;
    	color: rgb(40, 151, 223);
    	padding: 10px;
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
	
	
/* 	        	if(e.target.id == "dark" || !e.target){ */
/*         		test(e); */
/*             	$("body").css("background-color", "rgb(255, 246, 246)").css("color", "black"); */
/*             	$(".topLine").css("background-color", "white") */
/*             	$(".ii").css("color", "black"); */
            	
/*         	}else{ */
/*         		test(e); */
/*         		$("body").css("background-color", "rgb(30, 30, 30)").css("color", "white"); */
/*         		$(".topLine").css("background-color", "black"); */
/*         		$(".ii").css("color", "#ffffff"); */
/*         	} */
	
	
	
	
	
</style>
<body>
    <div id="wrap">
        <div id="header">
            <div id="header_1">
                <a href="menubar.jsp"><i class="fa-solid fa-bars fa-2xl" style="color: #ffffff;"></i></a>
            </div>
            <div id="header_2">
                <div id="header_2_1">
                    <h1 onclick="location.href='/koala'">Koala initializr</h1>
                </div>
                <div id="header_2_2">
                	<!-- /각 카데고리/이후 주소  ex) /admin/supporter/...-->
                	<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
                	<c:choose>
                		<c:when test="${loginUser.type == 2 && path.indexOf('admin') >= 0 }">                		
	                		<h4 onclick="adminPage();">Koala Admin</h4>
                		</c:when>
                		<c:otherwise>        		
	 	                   <h4>CreateCode && DownloadFile</h4> <!-- 조건문 걸기 -->
                		</c:otherwise>
                	</c:choose>
                </div>
            </div>
            <div id="header_3">
                <div id="header_3_1">
                	<c:choose>
                		<c:when test="${empty loginUser }">
		                	<a href="/koala/member/login">로그인</a>
		                	<a href="/koala/member/enroll">회원가입</a>
                   		</c:when>
                   		<c:otherwise>
                   			<span>${loginUser.userId }</span><br><br>
                   			<select id="myPage">
                   				<option selected>My Page<option>
                   				<option value="ad">Activity Details</option>
                   				<option value="as">Account Settings</option>
                   			</select>
                   			<a href="/koala/member/logout">로그아웃</a>
                   			
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
    <div id="darkmode">
    	<i id="dark" class="fa-solid fa-sun fa-2xl" style="color: rgb(255, 246, 246)" onclick="changeMode(event);"></i> <br><br> <!-- 수정할 것 -->
    	<i id="white" class="fa-solid fa-moon fa-2xl" style="color: rgb(30, 30, 30)" onclick="changeMode(event);"></i>
    </div>
    
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
    		$("body").css("background-color", "rgb(255, 246, 246)").css("color", "black");
        	$(".topLine").css("background-color", "white")
        	$(".ii").css("color", "black");
    	}
    	
    	function whitemode(){
    		$("body").css("background-color", "rgb(30, 30, 30)").css("color", "white");
    		$(".topLine").css("background-color", "black");
    		$(".ii").css("color", "#ffffff");
    	}
        
        
        // 쿠키를 보내기 위한 함수
        function test(e){
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
        	})
        }
        
        //배경 색 - 다크모드:rgb(30, 30, 30) / 라이트모드:rgb(255, 246, 246)
        //글자 색 - 다크모드:white / 라이트모드:black
        //컨텐트 박스 - 다크모드:black / 라이트모드:white
        
        
        // admin page ()
       	function adminPage(){
        	location.href = "/koala/admin/main";
        }
        
        
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
        	}
        })
    </script>
    
    <!-- 알림메세지 -->
  	<c:if test="${not empty msg || not empty param.msgc}">
		<script>
			if("${param.msgc}" != ""){ // 서포터즈 알림 메시지
	 			if(confirm("${param.msgc}")){
	 				//확인 및 취소
	 				$.ajax({
	 					url : "admin/promote.approve",
	 					success : function(dddd){
	 						console.log("result = "  + dddd);
	 						console.log(dddd.clientId);
	 						location.href = "https://github.com/login/oauth/authorize?client_id=" + dddd;
	 					},
	 					error : function(){
	 						console.log("error");
	 					}
	 				});
	 			}else{ // 취소 시 대기중인 상태 풀림.
	 				$.ajax({
	 					url : "admin/promote.cancel",
	 					data : {
	 						client_No : "${loginUser.userNo}"
	 					},
	 					success : function(data){
			 				if(confirm("main으로 이동하시겠습니까?(y)||이전 페이지로 이동하시겠습니까?(n)")){
			 					location.href="/koala";
			 				}else{
			 					history.back();
			 				}	 						
	 					},
	 					error : function(){
	 						console.log("ajax error");
	 					}
	 				});
	 			}	
			}else{ // 일반 알림 메시지
				alert("${msg}");
			}
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>
	
	<!-- 자동완성 끄기 -->
	<script>
		$(function(){
			$("input").attr("autocomplete", "off");
		});
	</script>
</body>
</html>