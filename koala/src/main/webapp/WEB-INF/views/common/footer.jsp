<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .footer{
        background-color: black;
        width: 80%;
        height: 300px;
        margin: auto;
        color: white;
        /* border: 1px solid red; */
    }
    .columnTotal{
        width: 100%;
        height: 80%;
        /* background-color: green; */
    }
    .item{
        /* border: 1px solid red; */
        padding: 4px 4px;
        box-sizing: inherit;
        text-align: left!important;
        width: 100%;
        font-size: 1rem;
        box-sizing: border-box;
    }
    .itemhade{
        line-height: 1.5;
        font-weight: 700;
    } 
    .more{
        color: blue;
    }
    .column, .column2, .column3{
        /* border: 1px solid red; */
        width: 18%;
        height: 100%;
        box-sizing: border-box;
    }
    .column4{
        width: 46%;
        height: 100%;
        /* border: 1px solid red; */
        box-sizing: border-box;
    }
    .column, .column2, .column3, .column4{
        float: left;
    }
    .footerAtag{
        text-decoration: none;
        color: White;
    }
    .Quiz{
        font-size: 4rem;
        font-weight: bold;
        text-align: center;
    }
    .QuizPlay{
        font-size: 4rem;
        font-weight: bold;
        text-align: center;
    }
    .QuizPlay a {
        text-decoration-line :underline;
        text-decoration-color: red;
        text-decoration-thickness : 9px;
        color: rgb(40, 151, 223);
    }
    .footerEnd{
        width: 100%;
        height: 20%;
        /* border: 1px solid blue; */
        font-size: 1rem;
        color: rgb(149, 149, 149);
    }
    #line{
    	height: 1%;
    	border: 1px solid White;
    }
</style>
</head>
<body>	
    <div class="footer">
    	<div id="line"></div>
        <div class="columnTotal">
        <div class="column">
            <div class="item itemhade">Why Koala</div>
            <div class="item">
                <a class=footerAtag href="#">DownLoad & Copy</a>
            </div>
            <div class="item">
                <a class=footerAtag href="#">Error_Board</a>
            </div>
            <div class="item">
                <a class=footerAtag href="#">Bulletin_Board</a>
            </div>
            <div class="item">
                <a class=footerAtag href="#">QnA_Board</a>
            </div>
            <div class="item more">
                <a class=footerAtag href="#" style="color: rgb(40, 151, 223);">Exit Site</a>
            </div>
        </div>
        <div class="column2">
            <div class="item itemhade">
                Study
            </div>
            <div class="item">
                <a class=footerAtag href="#">Java</a>
            </div>
            <div class="item">
                <a class=footerAtag href="#">JavaScript</a>
            </div>
            <div class="item">
                <a class=footerAtag href="#">SQL</a>
            </div>
            <div class="item">
                <a class=footerAtag href="#">Spring</a>
            </div>
        </div>
        <div class="column3">
            <div class="item itemhade">
                Reference
            </div>
            <div class="item">
                <a class=footerAtag href="https://start.spring.io/">Spring Initializr</a>
            </div>
            <div class="item">
                <a class=footerAtag href="https://mvnrepository.com/">MVN Repository</a>
            </div>
            
        </div>
        <div class="column4">
            <div class="Quiz">
                Multi Quiz
            </div>
            <div class="QuizPlay">
                <a class="footerAtag" href="#">Play</a>
            </div>
        </div>
    </div>
        <div class="footerEnd">
            ProjectName : Koala /
            Team : chun, choi, jang, park, Han <br>
            This is a project that allows beginners to easily configure difficult settings and library settings in Spring...<br>
            Copyright @ 20230107-20230707 KH academy C lecture room
        </div>
    </div>
</body>
</html>