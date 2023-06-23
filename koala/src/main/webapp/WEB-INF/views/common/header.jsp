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

</head>
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

    #header_1 i{padding-top: 65px;}
    #header_2_1>h1{
        margin: 0;
        font-size: 55px;
        font-weight: 600;
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
    #header_3_1>div{width: 100%; height: 100%;}
    #header_3_1 li{width: 200px; height: 30px;} 
    #myPage{width: 100%; height: 100%;}
    
    .ac-wrap{
    	margin: auto;
    	width: 80%;
    }
    
    .ac-wrap>ul{
    	list-style-type: none;
    	padding: 0;
    	padding-top: 40px;
    }
    
    .ac-wrap>ul>li{
    	height: 100%;
    	width: 100%;
		border-radius: 50px;
    	background-color: rgb(50, 50, 50);
    	margin-bottom: 10px;
    	/* margin: 10px; */
    }
    
    /* *{box-sizing: border-box;} */
    
    .ac-wrap>ul>li:hover{
    	background-color: rgb(40, 40, 40);
    }
    
    .ac-wrap>ul>li>a{
    	display: block;
    	/* padding: 10px; */
    	text-decoration: none;
    	text-align: center;
    	color: white;
    	
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
</style>
<body>
    <div id="wrap">
        <div id="header">
            <div id="header_1">
                <a href="../common/menubar.jsp"><i class="fa-solid fa-bars fa-2xl" style="color: #ffffff;"></i></a>
            </div>
            <div id="header_2">
                <div id="header_2_1">
                    <h1 onclick="location.href='/koala'">Koala initializr</h1>
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
                		<c:when test='${path.contains("multi/play") || path.contains("together/ssss")}'>
                			<h4 class="headerName" onclick="adminPage();">Koala SQL Cloud</h4>     
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
                				
                				<c:when test="${path.contains('ad') or path.contains('boardList') or path.contains('replyList') or path.contains('likedList') or path.contains('followingList')}">
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
                <div id="header_3_1">
                	<c:choose>
                		<c:when test="${empty loginUser }">
               				<div class="ac-wrap">
            	    			<ul>
        	        				<li><a href="/koala/member/login">로그인</a></li>
    	            				<li><a href="/koala/member/enroll">회원가입</a></li>                				
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
                   					<li><a href="/koala/member/logout">로그아웃</a></li>
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
        	$(".ic").css("background-color", "white").css("color","black");
    	}
    	
    	function whitemode(){
    		$("body").css("background-color", "rgb(30, 30, 30)").css("color", "white");
    		$(".topLine").css("background-color", "black");
    		$(".ii").css("color", "#ffffff");
    		$(".ic").css("background-color", "black").css("color","#ffffff");
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
        	});
        }
        
        //배경 색 - 다크모드:rgb(30, 30, 30) / 라이트모드:rgb(255, 246, 246)
        //글자 색 - 다크모드:white / 라이트모드:black
        //컨텐트 박스 - 다크모드:black / 라이트모드:white
        
        
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