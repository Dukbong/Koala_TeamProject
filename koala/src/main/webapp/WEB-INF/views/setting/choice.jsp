<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DownloadFiles</title>
</head>
<style>
    body{
        background-color: black;
        box-sizing: border-box;
        }
    .wrapper{
        width: 100%;
        height: 1200px;
        padding-top: 200px;
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
        border: none;
    }
    .button2{
        background-color: #D9D2D9;
        color: #4B0082;
        border: none;
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


</style>
<body>
<%@include file="/WEB-INF/views/common/header.jsp"%>
    <div class="wrapper">
        <div class="body_content">
            <div class="block">
                <div class="block_title">
                    <span>commons</span>
                </div>
                <div class="choice_area">
                    <!-- <form action="code.bo"> -->
                        <div class="choice_title">
                            <span>&lt;선택사항&gt;</span>
                        </div>
                        <div class="choice_content">
                            <input type="radio" id="choice" name="firstChoice">
                            <label for="choice">true</label>
                            <input type="radio" id="choice2" name="firstChoice">
                            <label for="choice">false</label>
                        </div>
                        
                        <div class="chArea">

                            <div class="choice_title">
                                <span>&lt;driver class name&gt;</span>
                            </div>
                            <div class="choice_content" id="classInput">
                                <input type="text" id="driverClassNameInput" placeholder="Koala.driveClassName">
                            </div>
                            <div class="choice_title">
                                <span>&lt;url&gt;</span>
                            </div>
                            <div class="choice_content" id="urlInput">
                                <input type="text" id="driverUrlInput" placeholder="Koala.url">
                            </div>
                            <div class="choice_title">
                                <span>&lt;user name&gt;</span>
                            </div>
                            <div class="choice_content" id="nameInput">
                                <input type="text" id="userNameInput" placeholder="Koala.userName">
                            </div>
                            <div class="choice_title">
                                <span>&lt;password&gt;</span>
                            </div>
                            <div class="choice_content" id="pwdInput">
                                <input type="text" id="passwordInput" placeholder="Koala.password">
                            </div>
    
                            <input type="submit" id="choiceSub" value="submit">
                        </div>
                    <!-- </form> -->
                </div>
                
            </div>
            <hr>
            <div class="block">
                <div class="block_title">
                    <span>commons 1.0</span>
                    <select name="version" id="versionHistory">
                        <option value="commons 2.0.7">commons 2.0.7</option>
                        <option value="commons 2.0.7">commons 2.0.7</option>
                        <option value="commons 2.0.7">commons 2.0.7</option>
                        <option value="commons 2.0.7">commons 2.0.7</option>
                        <option value="commons 2.0.7">commons 2.0.7</option>
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
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;groupId&gt;</span><span name="changeClass">Koala.driveClassName</span><span class="commonStyle">&lt;/groupId&gt;</span><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;artifactId&gt;</span><span name="changeUrl">Koala.url</span><span class="commonStyle">&lt;/artifactId&gt;</span><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;/exclusion&gt;</span><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;/exclusions&gt;</span> <br>
                    <span class="commonStyle">&lt;/dependency&gt;</span><br>
                    <span class="commonStyle">&lt;dependency&gt;</span><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;groupId&gt;</span><span name="${changeName}">Koala.userName</span><span class="commonStyle">&lt;/groupId&gt;</span><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;artifacId&gt;</span><span name="changePwd">Koala.password</span><span class="commonStyle">&lt;/artifactId&gt;</span><br>
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
        //코드 카피하기
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



 

        var driverClassNameInput = document.getElementById("driverClassNameInput");
        var urlInput = document.getElementById("driverUrlInput");     
        var userNameInput = document.getElementById("userNameInput");
        var passwordInput = document.getElementById("passwordInput");
        

        //입력창 내용 옮기기
        document.getElementById("choiceSub").addEventListener("click",function(){


            var driveClassNameElements = document.getElementsByName("changeClass");
            var urlElements = document.getElementsByName("changeUrl");
            var userNameElements = document.getElementsByName("changeName");
            var passwordElements = document.getElementsByName("changePwd");
            console.log(urlInput.value);
            for (var i = 0; i < driveClassNameElements.length; i++) {
                driveClassNameElements[i].textContent = driverClassNameInput.value;
            }
            for (var i = 0; i < urlElements.length; i++) {
                urlElements[i].textContent = urlInput.value;
            }
            for (var i = 0; i < userNameElements.length; i++) {
                userNameElements[i].textContent = userNameInput.value;
            }
            for (var i = 0; i < passwordElements.length; i++) {
                passwordElements[i].textContent = passwordInput.value;
            }
        });



    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>