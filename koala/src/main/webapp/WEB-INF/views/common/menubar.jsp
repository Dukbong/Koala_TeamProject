<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- font-awesome Copy Link Tag (아이콘 CDN) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>

    body{margin: 0;}
    #wrap{
        width: 50vw; /*메인페이지는 width: 100vw; 조건걸기*/
        height: 100vh;
        background-color: rgb(40, 151, 223);
        color: white;
    }

    #wrap>div{height: 100%; float: left;}
    #back{width: 25%; text-align: center;}
    #menu-area{width: 75%;}

    #menu-area>div{width: 100%;}
    #title{height: 15%;}
    #title>h1{font-size: 50px; color: rgb(255, 201, 15);}
    #menubar{height: 60%;}
    #icon-area{height: 25%;}
    #icons{width: 20%; height: 100%; background-color: rgb(76, 179, 240); float: right;}
    
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
    <div id="wrap">
        <div id="back">
            <a href=""><i class="fa-solid fa-x fa-xl" style="color: #ffffff; padding-top: 60px;"></i></a>
        </div>
        <div id="menu-area">
            <div id="title">
                <h1 style="color: rgb(255, 201, 15); margin:0; padding-top: 25px;">Koala initializr</h1>
            </div>
            <div id="menubar">
                <ul id="navi">
                    <li><a href="">CreateCode && DownloadFile</a></li>
                    <li><a href="bulletinboard.bo">Community(All user);</a></li>
                    <li><a href="">try{} catch(Error){}</a>
                        <ul>
                            <li><a href="">ex1CreateCodeCode</a></li>
                            <li><a href="">ex2CreateCode</a></li>
                            <li><a href="">ex3CreateCodeCode</a></li>
                        </ul>
                    </li>
                    <li><a href="">response.getWriter().print(QnA);</a>
                        <ul>
                            <li><a href="">ex1CreateCodeCode</a></li>
                            <li><a href="">ex2CreateCode</a></li>
                        </ul>
                    </li>
                    <li><a href="">ORDER BY RANKING DESC;</a></li>
                </ul>
                <div id="comment" style="font-size: 12px; color: rgb(181, 181, 181); padding-top: 10px;">ex1CreateCodeCodeex1CreateCodeCode<br>ex1CreateCodeCodeex1CreateCodeCodeex1CreateCodeCode<br>넣을지 말지 고민</div>
            </div>
            <div id="icon-area">
                <div id="icons">아이콘 영역</div>
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