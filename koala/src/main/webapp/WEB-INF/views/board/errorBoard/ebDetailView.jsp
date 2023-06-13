<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    div{ box-sizing: border-box;}
    .ebDetailView{width: 1200px; height:800px; margin: auto; padding: 80px 0px;}
    .ebDetailView>div{height: 100%; float: left;}
    .board-area, .reply-area{ width: 50%;}

    .board-area>div{width: 90%;}
    .lib-info{height: 10%; position: relative;}
    .board-form{height: 80%; background-color: black; padding: 10px;}
    .admin-button{height: 10%;}

    #libTitle{
        width: max-content;
        height: 30px;
        background-color: skyblue;
        position: absolute;
        margin: auto;
        left: 0;
        bottom: 0;
    }
    #solved{
        width: max-content;
        border-radius: 5px;
        background-color: rgb(125, 204, 122);
        position: absolute;
        margin: auto;
        right: 0;
        bottom: 0;
    }

    .board-form>div{width: 100%;}
    .bWriterDate>div{float: left;}



    .admin-button>div{
        width: 50%;
        height: 100%;
        margin: auto;
        position: relative;
    }

    #codeError, #userError{
        width: 40%;
        position: absolute;
        margin: auto;
        bottom: 0;
    }


</style>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="ebDetailView">

        <div class="board-area">
            <div class="lib-info">
                <div id="libTitle">&nbsp;<span>Lombok</span> version 2.0.7&nbsp;</div>
                <div id="solved">&nbsp;solved&nbsp;</div>
            </div>
            <div class="board-form">
                <div class="bTitle">
                    <span>제목</span> 롬복 오류발견 조치해주세요
                </div>
                <hr>
                <div class="bWriterDate">
                    <div class="bWriter" style="width: 50%;">
                        <span>작성자</span> admin
                    </div>
                    <div class="bDate" style="width: 50%;">
                        <span>작성날짜</span> 2023-05-19
                    </div>
                </div>
                <hr>
                <div class="bContent">내용입니다. 내용테스트입니다. 테스트입니다요.</div>
                <div class="addDetailBtn">
                    <button type="button">자세히보기</button>
                </div>
            </div>
            <div class="admin-button">
                <div>
                    <button type="button" id="codeError" style="left: 0;">코드오류</button>
                    <button type="button" id="userError" style="right: 0;">사용자오류</button>
                </div>
            </div>
        </div>

        <div class="reply-area" style="border: 1px solid red">
            댓글영역입니다.
        </div>

    </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>