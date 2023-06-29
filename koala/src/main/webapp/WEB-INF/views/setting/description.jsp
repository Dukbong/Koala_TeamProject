<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CreateCode&&DownloadFiles</title>
</head>
<style>
    body{
        background-color: black;
        box-sizing: border-box;
        }
    .wrapper{
        width: 100%;
        height: 1200px;
    }
    .header{
        width: 100%;
        height: 18%;
    }
    .body_content{
        display: flex;
        justify-content: center;
        align-items: center;
        width: 80%;
        height: 80%;
        margin: auto;
        position: relative;
    }
    .block{
        /* border: 1px solid red; */
        height: 80%;
        width: 50%;
        display: flex;
        flex-direction: column;
        display: inline-block;
        /* background-color: ; */
        background-color: rgba(53, 44, 59, 0.5);
        
    }

    .block_title{
        margin-top: 20px;
        font-size: 35px;
        color: rgb(156, 220, 254);
        font-weight: bold;
        margin-bottom: 30px;
        margin-left: 30px;

    }
    #versionHistory{
        border-radius: 5px;
        height: 30px;
        float: right;
        margin-right: 40px;
        margin-top: 30px;
        background-color: rgb(41, 23, 44);
        color: white;
        font-weight: bold;
    }

    .choice_title{
        margin-top: 30px;
        color: rgb(255, 201, 20);
        font-size: 20px;
        font-weight: bold;
        margin-left: 20px;
    }
    .choice_content {
        margin-top: 30px;
        display: flex;
        color: white;
        font-size: 20px;
        margin-left: 30px;
    }
    .choice_content>input[type="text"]{
        border-radius: 5px;
        width: 300px;
        height: 25px;
    }
    #choiceSub{
        float: right;
        border-radius: 5px;
        margin-right: 50px;
        background-color: rgb(255, 201, 20);
        font-size: 20px;
        margin-top: 30px;
        height: 40px;
        width: 100px;
        cursor: pointer;
        font-weight: bold;
    }
    #choiceSub:hover{
        border: 2px solid grey;
        background-color: black;
        color: rgb(255, 201, 20);
    }
    .code_content{
        color: white;
        margin-left: 50px;
        background-color: 000000;
        opacity: 0.9;
        font-size: 15px;
    }
    .commonStyle{
        color: rgb(86,156,214);
    }
    .addStyle{
        color: grey;
    }
    hr{
        height:100vh;
        width:.5vw;
        border-width:0;
        color:#000;
        background-color:#000;
        }
    .button_area{
        float: right;
        margin-top: 250px;
        margin-right: 50px;
    }
    .button_area>button{
        height: 30px;
        font-weight: bold;
        font-size: 18px;
        border-radius: 5px;
        height: 40px;
        width: 100px;
        cursor: pointer;
        margin-left: 20px;
        /* color: white; */
    }
    .button1{
        background-color: #4B0082;
        color: #D9D2D9;
    }
    .button2{
        background-color: #D9D2D9;
        color: #4B0082
    }
    .button1:hover,.button2:hover{
        background-color: black;
        color: #4B0082;
        border: 2px solid grey;
    }
    /* .button2:hover{
        background-color: black;
        color: #D9D2D9;
    } */
    .howToTitle{
        font-size: 28px;
        color: rgb(106, 153, 85);
        margin-left: 30px;
        font-weight: bold;
    }
    #description_part1,#description_part2{
        padding: 30px;
        color: white;
    }
    .desTitle{
        font-size: 25px;
        font-weight: bold;
    }
    .desContent{
        font-size: 15px;
    }

</style>
<body>
<%@include file="/WEB-INF/views/common/header.jsp"%>
    <div class="wrapper">
        <div class="header">

        </div>
        <div class="body_content">
            <div class="block">
                <div class="block_title">
                    <span>ojdbc 설명서</span>
                </div>
                <div class="description">
                    <p id="description_part1">Commons Library(http://commons.apache.org/)는 아파치 재단에서 관리하고 있는 라이브러리로 
                        프로그램 개발 시 재사용 가능한 자바 컴포넌트들을 모아둔 라이브러리다. <br> 
                        아파치 재단에서는 프로젝트에서 유틸리티 클래스와 공통적으로 사용되는 기능 등을 다른 프로젝트에서 재사용 가능하도록 
                        컴포넌트 형태로 개발해 Apache Commons Library라는 이름으로 배포하고 있다. <br>
                        대부분의 아파치 프로젝트에서는 중복 개발을 피하기 위해 Commons Library를 기본적으로 사용하고 있고, 
                        전 세계적으로도 많은 개발자들이 Commons Library를 사용하고 있다. <br>
                        그 숫자는 지금도 증가하고 있으며 Commons Library는 구글 라이브러리와 더불어 전 세계적으로 가장 많이 사용되고 있는 라이브러리다. </p>
                </div>
                <div class="howTo">
                    <span class="block_title">다운로드 방법</span>
                    <div id="description_part2">
                        <span class="desTitle">How To Copy Code?</span> <br>
                        <p class="desContent">Press the Copy Button at the bottom<br>
                        Or Drag the whole content
                        </p>
                        <br><br>
                        <span class="desTitle">How To DownLoad File?</span><br>
                        <p class="desContent">Press the DownLoad button at the bottom<br>
                        You can check the generated zip file</p>
                    </div>
                </div>
                
            </div>
            <hr>
            <div class="block">
                <div class="block_title">
                    <span>commons 1.0</span>
                    <select name="version" id="versionHistory">
                        <option value="commons 2.0.7">commons 2.0.8</option>
                        <option value="commons 2.0.7">commons 2.0.7</option>
                        <option value="commons 2.0.7" style="text-decoration: line-through;">commons 2.0.6</option>
                        <option value="commons 2.0.7" style="text-decoration: line-through;">commons 2.0.5</option>
                        <option value="commons 2.0.7" style="text-decoration: line-through;">commons 2.0.4</option>
                    </select>
                </div>
                <div class="code_content" id="copy_code">
                    <span class="commonStyle">&lt;dependency&gt;</span><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;groupId&gt;</span><span>org.springframework</span><span class="commonStyle">&lt;/groupId&gt;</span><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;artifacId&gt;</span><span>spring-context</span><span class="commonStyle">&lt;/artifactId&gt;</span><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;version&gt;</span><span>${org.springframework-version}</span><span class="commonStyle">&lt;/version&gt;</span><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;exclusions&gt;</span> <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="addStyle">&lt;--Exclude Commons Logging in favor of SLF4j --&gt;</span><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;exclusion&gt;</span><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;groupId&gt;</span><span>${Koala.driveClassName}</span><span class="commonStyle">&lt;/groupId&gt;</span><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;artifactId&gt;</span><span>${Koala.url}</span><span class="commonStyle">&lt;/artifactId&gt;</span><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;/exclusion&gt;</span><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;/exclusions&gt;</span> <br>
                    <span class="commonStyle">&lt;/dependency&gt;</span><br>
                    <span class="commonStyle">&lt;dependency&gt;</span><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;groupId&gt;</span><span>{Koala.userName}</span><span class="commonStyle">&lt;/groupId&gt;</span><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;artifacId&gt;</span><span>{Koala.password}</span><span class="commonStyle">&lt;/artifactId&gt;</span><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;version&gt;</span><span>${org.springframework-version}</span><span class="commonStyle">&lt;/version&gt;</span><br>
                    <span class="commonStyle">&lt;/dependency&gt;</span><br>
                    <div class="button_area">
                        <button type="button" id="copyBtn" class="button1">Copy</button><button type="button" class="button2">Download</button>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    
    <script>
        var codeArea = document.getElementById("copy_code");

        document.getElementById("copyBtn").onclick=()=>{

            var spanElements = codeArea.getElementsByTagName("span");//span태그만 가져오기
            var spanContents = "";

            for(var i=0; i<spanElements.length; i++){
                spanContents += spanElements[i].textContent; //span태그 안의 내용만
            }
            window.navigator.clipboard.writeText(spanContents).then(()=>{
                //복사 완료 시 호출
                alert('복사되었습니다!');
            });
        }
    </script>
 <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>