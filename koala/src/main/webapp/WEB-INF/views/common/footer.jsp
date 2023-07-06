<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .footer{
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
    .linefooter{
    	width:100%;
    	height: 1%;
        background-color: rgb(172, 171, 169);
        margin: auto;
    }
</style>
</head>
<body>	
    <div class="footer ii">
    	<div class="linefooter"></div>
        <div class="columnTotal">
        <div class="column">
            <div class="item itemhade">Why Koala</div>
            <div class="item">
                <a class="footerAtag ii"  href="/koala/setting/list">Library Helper</a>
            </div>
            <div class="item">
                <a class="footerAtag ii" href="/koala/errorBoard/list">Error_Board</a>
            </div>
            <div class="item">
                <a class="footerAtag ii" href="/koala/qnaBoard/list">QnA_Board</a>
            </div>

<!--             <div class="item more"> -->
<!--                 <a class=footerAtag href="#" style="color: rgb(40, 151, 223);">Exit Site</a> -->
<!--             </div> -->
            <div class="item">
                <a class="footerAtag ii" href="/koala/bulletinBoard/list">Bulletin_Board</a>
            </div>
        </div>
        <div class="column2">
            <div class="item itemhade">
                Study
            </div>
            <div class="item">
                <a class="footerAtag ii" href="https://docs.oracle.com/javase/8/docs/api/" target='_blank'>Java</a>
            </div>
            <div class="item">
                <a class="footerAtag ii" href="https://ko.javascript.info/" target='_blank'>JavaScript</a>
            </div>
            <div class="item">
                <a class="footerAtag ii" href="https://chillin-dev.tistory.com/42" target='_blank'>SQL</a>
            </div>
            <div class="item">
                <a class="footerAtag ii" href="https://velog.io/@ililil9482/Spring%EC%97%90-%EB%8C%80%ED%95%9C-%EC%A0%95%EB%A6%AC-%EA%B8%80" target='_blank'>Spring</a>
            </div>
        </div>
        <div class="column3">
            <div class="item itemhade">
                Reference
            </div>
            <div class="item">
                <a class="footerAtag ii" href="https://start.spring.io/" target='_blank'>Spring Initializr</a>
            </div>
            <div class="item">
                <a class="footerAtag ii" href="https://mvnrepository.com/" target='_blank'>MVN Repository</a>
            </div>
            
        </div>
        <div class="column4">
            <div class="Quiz">
                SQL Cloud
            </div>
            <div class="QuizPlay">
                <a class="footerAtag" id="sqlCloud">Play</a>
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
    
    <script>
    	$(function(){
    		$("#sqlCloud").on("click", function(){    			
				var form = document.createElement("form");
				form.setAttribute("method","GET");
				form.setAttribute("action", "/koala/together/sqlCloud");
				document.charset = "utf-8";
				var hidden = document.createElement("input");
				hidden.setAttribute("type","hidden");
				hidden.setAttribute("name","teamNo");
				hidden.setAttribute("value",0);
				form.appendChild(hidden);
				document.body.appendChild(form);
				form.submit();
    		}).on("mouseenter", function(){
    			$(this).css("cursor", "pointer");
    		});
    	})
    </script>
  
</body>
</html>