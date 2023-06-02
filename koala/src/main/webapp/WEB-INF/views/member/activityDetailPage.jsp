<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#select-mypage a{
        color: darkcyan;
        text-decoration: none;
    }


    #content{
        height: 100%;
        width: 100%;
    }

    #content1>div{
        float: left;
        height:70%;
    }
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div id="select-mypage">
        <ul>
            <li><a href="">Activity Details</a></li>
            <li><a href="">Account Settings</a></li>
        </ul>
    </div>
    <hr>
    <div style="height: 1000px;" >

        <div id="content">
            <div id="content1">
                <div id="con1-area">
                    <div id="profile">
                        <img src="피치.png" alt="">
                    </div>
                    <div id="nickname">
                        <span>천병국입니다.</span>
                    </div>
                </div>
                <div id="con2-area">
                    <div><span>Lv.1 Bronze</span></div>
                    <div><span>Points : 165165pts</span></div>
                    <div><span>Followers : 0</span></div>
                </div>
                <div id="introduce-area">
                    <div id="introduce-box">
                        <form action="update.me">
                            <textarea name="" id="" cols="30" rows="5" style="resize: none;"></textarea><br>
                            <button type="submit" style="background-color: blue;">Update</button>
                        </form>
                    </div>
                </div>
            </div>
            <div id="content2">
                <div id="select-list">
                    <ul>
                        <li style="list-style-type: none;"><a href="">Board</a></li>
                        <li style="list-style-type: none;"><a href="">Reply</a></li>
                        <li style="list-style-type: none;"><a href="">Liked</a></li>
                        <li style="list-style-type: none;"><a href="">Following</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div id="list-area" style="width:80%; height: 70%; background-color: rgb(53, 12, 12);">
            
        </div>

    </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>