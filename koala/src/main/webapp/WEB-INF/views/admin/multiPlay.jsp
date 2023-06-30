<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[Koala] Multi Quiz</title>
</head>
<style>
	.codeleft, .coderight{
		box-sizing: border-box;
		float: left;
	}
</style>
<body>
	<%@include file="../common/header.jsp" %>
	<div id="testShow" style="margin:auto; width: 80%; height: 700px; color:white; padding-top: 200px;">
		<div class="ii codeleft" style="width: 50%; height: 100%;">
		
		</div>
		
		<div class="ii coderight" style="width: 50%; height: 100%;">
		
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
// 		$(function(){
			// 웰컴 메시지 뿌리기
				var playComment  = "@KoalaMulti~";
				    playComment += "public class Koala~~";
					playComment += "`private String userName;~";
					playComment += "`private String fontColor;~~";
					playComment += "`public Koala KoalaPlayer(String userName){ ~";
					playComment += "``this.userName = userName;~";
					playComment += "``fontColot = rgbMaker();~";
					playComment += "``return this;~";
					playComment += "`}~";
					
					playComment += "`public void GameStart(Koala koala){ ~";
					playComment += "``GameGo(koala);~";
					playComment += "`}~";
					playComment += "}";
				
				var showComment = playComment.split("");
				var str = "";
				
				var showCount = 0;
				var it = setInterval(function(){
				  if(showCount < showComment.length){
					  str += showComment[showCount];
					  showCount++;
					if(showComment[showCount] == '`'){
						showComment[showCount] = '';
						str += "&nbsp;&nbsp;&nbsp;&nbsp;"
					}
					if(showComment[showCount] == "~"){
						showComment[showCount] = '';
						str += "<br>";
					}
				      $(".codeleft").html(str);
				  }else{
				    clearInterval(it);
				    str += "<br><button type='button' onclick='testing();'> 입장 하기 </button>";
				    $(".codeleft").html(str);
				  }
				}, 0); // 적정 40, 테이트시 0
				
				function testing(){
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
				}
	</script>
</body>
</html>