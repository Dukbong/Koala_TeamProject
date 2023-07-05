<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    #menu{
        width: 950px;
        height: 100vh;
        background-color: rgb(40, 151, 223);
        color: white;
        transform: translatex(-950px);
		transition: transform 0.4s ease-in-out;
        position: fixed;
        z-index: 10;
    }
    /* 위에서 내려오는 메뉴바
    #menu{
        width: 100%;
        height: 100vh;
        background-color: rgb(40, 151, 223);
        color: white;
        transform: translatey(-100%);
		transition: transform 0.4s ease-in-out;
        position: fixed;
        z-index: 10;
    }
    */

    #menu>div{height: 100%; float: left;}
    #back{width: 25%; text-align: center;}
    #menu-area{width: 75%;}
    
    #menu-area>div{width: 100%;}
    #menu-title{height: 15%;}
    #menu-title>h1{font-size: 50px; font-weight: 700; color: rgb(255, 201, 15); text-shadow: 2px 2px 2px rgb(40,30,223); margin:0; padding-top: 40px;}
    #menubar{height: 60%;}
    #icon-area{height: 25%;}
    #icons{width: 20%; height: 100%; float: right; position: relative;}
    #icons>a>img{width: 50px; height: 50px; position: absolute; margin: auto; bottom: 50px; right: 50px;}
/*     #icons>img:hover{cursor: pointer;} */
    
    #navi{
        list-style-type: none;
        margin: 0px;
        padding: 0px;
        }
    #navi>li{
        width: 70%;
        height: 100%;
        vertical-align: top;
    }
    #navi a{
        text-decoration: none;
        color: white;
        font-size: 30px;
        font-weight: 800;
        width: 100%;
        height: 100%;
        display: block;
        line-height: 50px;
    }
    #navi a:hover{color: rgb(248, 185, 147);}
    #navi>li>ul{
        list-style-type: none;
        padding: 0;
        padding-left: 50px;
        display: none; 
    }
    #navi>li>ul a{font-size: 20px;}
    #navi>li>ul a:hover{font-size: 21px;}
    #navi>li>a:hover+ul{display: block;}
    #navi>li>ul:hover{display: block;}
</style>
<body>
    <div id="menu">
        <div id="back">
            <i id="menuOffBtn" class="fa-solid fa-x fa-xl" style="color: #ffffff; padding-top: 70px;"></i>
        </div>
        <div id="menu-area">
            <div id="menu-title">
                <h1>Koala initializr</h1>
            </div>
            <div id="menubar">
                <ul id="navi">
                    <li><a href="">CreateCode && DownloadFile</a>
                        <ul>
                            <li><a href="">ex1CreateCodeCode</a></li>
                            <li><a href="">ex2CreateCode</a></li>
                            <li><a href="">ex3CreateCodeCode</a></li>
                        </ul>
                    </li>
                    <li><a href="/koala/bulletinBoard/list">Community(All user);</a></li>
                    <li><a href="/koala/errorBoard/list">try{} catch(Error){}</a></li>
                    <li><a href="/koala/qnaBoard/list">response.getWriter().print(QnA);</a></li>
                    <li><a href="/koala/rankingBoard/rankingPage">ORDER BY RANKING DESC;</a></li>
                </ul>
                <div id="comment" style="font-size: 12px; color: rgb(181, 181, 181); padding-top: 10px;">koala initializr koala initializr koala initializr<br>koala initializr koala initializr koala initializr koala initializr</div>
            </div>
            <div id="icon-area">
                <div id="icons"><a href="https://github.com/1000baamK/Koala_TeamProject"><img alt="" src="/koala/resources/common/깃허브.png"></a></div>
            </div>
        </div>
    </div>
    <script>
    	//메뉴 호버 시 아래 컨텐트 내용 안보이게 하기 (수정할 것)
        $(function(){
            $("#navi li").mouseenter(function(){
                if(this.children[1]!=undefined){
                    $("#comment").css("display", "none");
                }
            });
            $("#navi li ul li").mouseenter(function(){
                    $("#comment").css("display", "none");
            });
            $("#navi li").mouseout(function(){
                if(this.children[1]!=undefined){
                    $("#comment").css("display", "block");
                }
            });
            $("#navi li ul li").mouseout(function(){
                    $("#comment").css("display", "block");
            });
        });
    </script>
</body>
</html>