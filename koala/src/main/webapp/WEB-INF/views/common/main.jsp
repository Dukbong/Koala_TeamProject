<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Koala</title>
</head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>

    .wrapper{
        width: 80%;
        height: 800px;
        margin: auto;
    }
    .space{
        width: 100%;
        height: 10%;
    }
    .main_area{
        width: 100%;
        height: 50%;
        background-color: rgba(136, 133, 147, 0.87);
        text-align: center;
        position: relative;
    }
    .main_area_opening>span{
        font-size: 23px;
        font-weight: bold;
        color: white;
    }
    .main_body{
        margin-left: 90px;
        margin-right: 90px;
        margin-top: 50px;
        justify-content: space-between;
        display: flex;
        flex-direction : row;
    }

    .body1,.body2,.body3{
        width: 30%;
        height: 200px;
        color: white;
        cursor: pointer;
    }

    .item_name{
        margin-top: 10px;
        font-size: 30px;
        font-weight: bold;
    }
    .body_logo1{
        float: right;
        margin-top: 30px;
        margin-right: 30px;
    }
    .body_logo2,.body_logo3{
        text-align: center;
    }
    .body_title{
        font-size: 28px;
        font-weight: bold;
        text-align: center;
    }
    .body_logo2{
        margin-top: 20px;
    }
    .item_info{
        margin-top: 30px;
        font-size: 11px;
    }
    .main_image{
        position: absolute;
        width: 100%;
        opacity: 10%;
    }
    .main_image2,.main_area_opening{
        position: absolute;
        margin: auto;
        width: 100%;
        margin-top: 50px;
    }
    .main_area_opening{
        margin-top: 330px;
    }


</style>
<body>
	<jsp:include page="header.jsp"/>
	
    <div class="wrapper">
    <div class="space"></div>
        <div class="main_area">
            <div class="main_image" style="height: 100%;">
                <img src="resources/common/털.png" style="height: 100%; width: 100%;"alt="">
            </div>
            <div class="main_image2">
                <img src="resources/common/코알라로고_문구有.png" id="koala_logo" style="width: 400px;" alt="">
            </div>
            <div class="main_area_opening">
                <span>KH Academy</span>&nbsp;&nbsp;&nbsp;<span> 2023.05.30</span>
            </div>
        </div>

        <div class="main_body">
            <div class="body1">
                <span style="font-size: 20px;">2.56.141</span>
                <div class="body_logo1">
                    <img src="resources/common/reload.png" style="width: 50px;" alt="">
                </div>
                <div class="item_name">
                    <span>filter</span>
                </div>
                <div class="item_info">
                    <p>여기는 설명이 들어가는 부분입니다. 설명을 넣어주세요. 긴 설명이 들어가는 부분. 길게 설명을 넣어주는 부분입니다.
                        여기는 설명이 들어가는 부분입니다. 설명을 넣어주세요. 긴 설명이 들어가는 부분. 길게 설명을 넣어주는 부분입니다.
                    </p>
                </div>
            </div>
            <div class="body2">
                <div class="body_logo2">
                    <img src="resources/common/download.png" style="width: 90px;" alt="">
                </div>
                <div class="body_title" style="margin-top: 10px;">
                    <span>Download</span>
                </div>
            </div>
            <div class="body3">
                <div class="body_logo3">
                    <img src="resources/common/free-icon-cloud-upload-4007710.png" style="width: 120px;" alt="">
                </div>
                <div class="body_title">
                    <span>CreateFile</span>
                </div>
            </div>
        </div>

    </div>
    <jsp:include page="footer.jsp"/>
</body>
</html>