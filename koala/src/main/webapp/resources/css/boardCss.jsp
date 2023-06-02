<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QnA_list</title>
</head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
    body{
        background-color: black;
        box-sizing: border-box;
        }
    .wrapper{
        width: 100%;
        height: 1000px;
    }
    .header{
        width: 100%;
        height: 18%;
    }
    .body_content{
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
        width: 80%;
        margin: auto;
    }
    .top_area{
        width: 100%;
        height: 15%;
        display: flex;
        align-items: center;
        margin-bottom: 30px;
    }
    .board_title{
        width: 30%;
        float: left;
        margin-left: 30px;
        margin-right: -30px;
    }
    .board_title>span{
        color: rgb(255, 201,20);
        font-size: 40px;
        font-weight: bold;
    }
    .search_area{
        width: 50%;
        float: left;
    }
    .search_area select{
        width: 15%;
        border: 2px solid rgb(86, 156,214);
        text-align: center;
    }
    .search_area input{
        width: 70%;
        border: 2px solid rgb(86, 156,214);
    }

    .search_area select,
    .search_area input[type="search"],
    .search_area button {
        height: 30px;
        background-color: black;
        color: white;
        font-size: 11px;
        border-radius: 3px;
    }
    .search_area button {
        background-color: rgb(156, 220, 254);
        cursor: pointer;
        color: black;
        font-weight: bold;
        width: 10%;
    }
    .search_area button:hover{
        background-color: rgb(86, 156,214);
        color: white;

    }
    .middle_area{
        color: white;
        width: 90%;
        height: 500px;
        text-align: center;
    }
    .middle_area table{
        width: 100%;
        height: 100%;
        font-size: 11px;
        border-top: 1px solid grey;
        border-bottom: 1px solid grey;

    }
    .middle_area table>thead{
        height: 10%;
        font-size: 13px;
        color: rgb(255, 201,20);        
    }
    .middle_area table>tbody{
        cursor: pointer;
    }
    .middle_area table > thead > tr>th{
    border-bottom: 1px solid grey;
    }
    .middle_area table > tbody > tr > td:nth-child(2){
        text-align: left;
    }
    .middle_area table > tbody > tr:hover{
        opacity: 85%;
    }
    .middle_area table > tbody > tr:nth-child(-n+2){
        color: rgb(206, 145, 120);
        font-weight: bold;
    }
    .bottom_area{
        display: flex;
        justify-content: center;
        margin-top: 40px;
        cursor: pointer;
    }

    .bottom_area>ul>li{
        color: white;
        font-size: 13px;
        font-weight: 700;
        list-style: none;
        float: left;
        margin-right: 10px;

    }
    .bottom_area>ul>li:hover{
        color: rgb(255, 201,20);
    }

    .bottom_area > ul{
        margin: 0;
        padding: 0;
    }

</style>
<body>

</body>
</html>