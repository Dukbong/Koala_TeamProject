<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<style>
body {
	background-color: black;
	box-sizing: border-box;
}

.wrapper {
	width: 100%;
	height: 1200px;
	padding-top : 200px;
}

.body_content {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	align-items: center;
	width: 80%;
	margin: auto;
}

.top_area {
	width: 100%;
	height: 15%;
	display: flex;
	align-items: center;
	margin-bottom: 30px;
}

.board_title {
	width: 30%;
	float: left;
	margin-left: 30px;
}

.board_title>span {
	color: rgb(255, 201, 20);
	font-size: 40px;
	font-weight: bold;
}

.control_area {
	width: 57%;
	height: 100%;
	display: flex;
	justify-content: end;
	margin-bottom: -60px;
}

.control_area button {
	margin-right: 10px;
}

.control_area button[type="reset"]:hover {
	font-weight: bold;
	border: 1px solid grey;
}

.control_area button[type="submit"]:hover {
	font-weight: bold;
	border: 1px solid grey;
}

.control_area button[type="reset"] {
	/*         background-color: rgb(206, 145,120); */
	border: 1px solid grey;
	background-color: transparent;
	color: rgb(206, 145, 120);;
	/*         font-weight: bold; */
	width: 70px;
	height: 30px;
	border-radius: 4px;
	cursor: pointer;
	font-size: 12px;
}

.control_area button[type="submit"] {
	/*         background-color: rgb(106, 153,85); */
	background-color: transparent;
	border: 1px solid grey;
	color: rgb(106, 153, 85);
	/*         font-weight: bold; */
	width: 70px;
	height: 30px;
	border-radius: 4px;
	cursor: pointer;
	font-size: 12px;
}

.middle_area {
	color: white;
	width: 80%;
	height: 400px;
	text-align: left;
}

.middle_area table {
	width: 100%;
	height: 100%;
	border-top: 1px solid grey;
	border-bottom: 1px solid grey;
	border-collapse: collapse;
	margin-bottom: 20px;
}

.middle_area table>thead>tr>th {
	height: 30px;
	border-bottom: 1px solid grey;
	color: rgb(255, 201, 20);
	font-size: 13px;
}

.middle_area table>tbody>tr>td:last-child {
	vertical-align: top;
	padding-top: 20px;
	padding-left: 20px;
	font-size: 11px;
}

.button_area button {
	background-color: rgb(156, 220, 254);
	border-radius: 4px;
	font-weight: bold;
	height: 40px;
	width: 70px;
	font-size: 12px;
	cursor: pointer;
}

.button_area button[type=submit]:hover {
	background-color: rgb(86, 156, 214);
	color: white;
}

.bottom_area {
	margin-top: 80px;
	width: 80%;
}

.bottom_area table {
	border-top: 1px solid grey;
	color: white;
	text-align: center;
	width: 100%;
	font-size: 11px;
	/* border-collapse : collapse; */
	padding-bottom: 30px;
}

.bottom_area table tr>td {
	border-bottom: 1px solid grey;
	height: 40px;
}

.bottom_area table tr>td:nth-child(2) {
	text-align: left;
}

#reply_table button {
	background-color: rgb(156, 220, 254);
	font-size: 10px;
	font-weight: bold;
	color: black;
	width: 60px;
	height: 25px;
	border-radius: 4px;
	cursor: pointer;
	border: none;
}

#reply_table button:hover {
	background: rgb(86, 156, 214);
	color: white;
}

.reply_insert {
	width: 100%;
	display: flex;
	align-items: center;
}

.reply_insert textarea {
	width: 90%;
}

.repBtn {
	width: 10%;
	margin-left: 10px;
	margin-right: 10px;
	height: 30px;
	background-color: rgb(255, 201, 20);
	border-radius: 5px;
	font-weight: bold;
	font-size: 12px;
	cursor: pointer;
}

.repBtn:hover, .repBtn_area button:hover {
	background-color: black;
	color: rgb(255, 201, 20);
	border: 1px solid grey;
}

.repBtn_area {
	margin-top: 30px;
}

.repBtn_area button {
	background-color: rgb(255, 201, 20);
	width: 60px;
	font-size: 11px;
	height: 30px;
	border-radius: 5px;
	cursor: pointer;
	font-weight: bold;
}


.selected-reply {
	color: red; /* 원하는 폰트 색상으로 변경 */
}

.replyDel {
	background-color: red;
}
</style>
<body>
	<%@include file="../../common/header.jsp"%>
	<div class="wrapper">
		<div class="body_content">
			<div class="top_area">
				<div class="board_title">
					<span>QnA</span>
				</div>
				<div class="control_area">
					<c:choose>
						<c:when test="${b.boardWriter eq loginUser.nickName }">
							<button type="reset" onclick="formSubmit(1)">글 삭제</button>
							<button type="submit" onclick="formSubmit(2)">수정</button>
						</c:when>
						<c:otherwise>
							<button type="reset" style="visibility: hidden;">글 삭제</button>
							<button type="submit" style="visibility: hidden;">수정</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<script>
				function formSubmit(num) {
					var formObj = $("<form>");
					var bno = $("<input>").prop("type", "hidden").prop("name",
							"boardNo").prop("value", "${b.boardNo}");
					var filepath = $("<input>").prop("type", "hidden").prop(
							"name", "filePath").prop("value",
							"${at.changeName}");
					var obj = formObj.append(bno);

					if (num == 1) {
						obj.attr("action", "update").attr("method", "get");
					} else {
						obj.append(filePath);
						obj.attr("action", "delete").attr("method", "post");
					}
				}
			</script>

			<div class="middle_area">
				<table>
					<thead>
						<tr>
							<th style="width: 10%; text-align: center;">${b.boardNo}</th>
							<th colspan="3">${b.title }</th>
						</tr>
						<tr>
							<th style="text-align: center;">${b.boardWriter}</th>
							<th style="width: 10%;">조회 ${b.count}</th>
							<th style="width: 15%;">${b.createDate}</th>
							<th>첨부 파일 &nbsp; ${at.originName}</th>

						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="4">${b.content}</td>
						</tr>
					</tbody>
				</table>
				<div class="button_area">
					<button type="button">
						<i class="fa-solid fa-comment-dots fa-lg"></i> <span id="rcount"></span>
					</button>
					<c:choose>
						<c:when test="${b.boardWriter != loginUser.nickName }">
							<button type="submit" onclick="updateLike(this);" class="likeIt">
								<i class="fa-regular fa-heart fa-lg"></i> <span id="likeCount">
									 ${b.liked }
								</span>
							</button>
						</c:when>
						<c:otherwise>
							<button type="submit" disabled>
								<i class="fa-regular fa-heart fa-lg"></i> <span id="likeCount">
									 ${b.liked } 
								</span>
							</button>
						</c:otherwise>
					</c:choose>

				</div>
			</div>

			<script>
			
				var selected = false;
				window.onload = function() {
					initLike();
					
				};
			
			
				function checkSelectedReply(replyId) {

					var selectedReplyNo = $(this).closest("tr").find(
							"td:first-child").text();
					$.ajax({
						url : "chkSelectedReply",
						method : "GET",
						data : {
							replyId : replyId,
							boardNo : "${boardNo}",
							replyNo : selectedReplyNo
						},
						success : function(response) {
							if (response === "selected") {
								selected = true;
								$("#reply_table").prepend($("#" + replyId));
								$("#" + replyId + ".selectBtn").prop(
										"disabled", true)
							}
						},
						error : function() {
							console.log("통신 실패");
						}
					})
				}
				$(function() {
					selectReplyList();
				});

				function selectReply(loginUser) {	
							$.ajax({
								url : "selectReply.bo",
								data : {
									boardNo : "${b.boardNo}",
								},
								success : function(list) {
									var result = "";
									// 							console.log("여기들어온 닉네임은 "+loginUser);
									var boardWriter = "${b.boardWriter}";
									// 							console.log("글 작성자는 "+boardWriter);
									for ( var i in list) {
										var replyId = list[i].replyId;
										result += "<tr data-reply-id='"+list[i].replyId+"'>"
												+ "<td>"
												+ list[i].replyNo
												+ "</td>"
												+ "<td>"
												+ list[i].replyWriter
												+ "</td>"
												+ "<td>"
												+ list[i].replyContent
												+ "</td>"
												+ "<td>"
												+ list[i].createDate + "</td>"

										//게시글 작성자인 경우에만 채택 버튼 추가
										if (loginUser === boardWriter && !selected) {
											console.log(loginUser + "입니다.");
											result += "<td>"
													+ "<button class='selectBtn' style='background-color:lightseagreen'>채택"
													+ "</button>" + "</td>"
										} else if (loginUser === list[i].replyWriter) {
											result += "<td>"
													+ "<button class='replyDel' style='background-color:darkmagenta'>삭제"
													+ "</button>" + "</td>"
										} else {
											result += "<td>" + "</td>"
										}

										result += "</tr>"

										checkSelectedReply(replyId); //채택 여부 확인
									}

									$("#reply_table").html(result);
									$("#rcount").text(list.length);

								},
								error : function() {
									console.log("댓글 목록 조회 실패");
								}
							});
				}
				function selectReplyList() {

					var loginUser;//로그인 사용자 닉네임 저장할 변수

					$.ajax({
						url : "getUserNick",
						method : "GET",
						dataType : "json",
						success : function(response) {
							var loginUser = response.userNickName;//닉네임 뽑아내기
							selectReply(loginUser);
						},
						error : function() {
							console.log("통신 실패");
						}
					});

				}

				$(document)
						.on(
								"click",
								".selectBtn",
								function() {

									// 					console.log("채택 선택해보기");
									// 					var selectedReplyId = $(this).closest("tr").data("reply-id");
									// 				    var selectedReplyNo = $(this).closest("tr").data("reply-no");
									// 					var selectedButton = $(this);//선택된 버튼 요소 
									var selectedReplyNo = $(this).closest("tr")
											.find("td:first-child").text();

									console.log("replyNo" + selectedReplyNo);
									$
											.ajax({
												url : "qnaSelect",
												method : "POST",
												data : {
													boardNo : "${b.boardNo}",
													replyNo : selectedReplyNo
												},
												success : function(result) {

													if (result === "success") {

														$(this).prop(
																"disabled",
																true);
														$(this)
																.css(
																		"background-color",
																		"blue");
														var selectedReply = $(
																this).closest(
																"tr").detach();
														$("#reply_table")
																.prepend(
																		selectReply);
														$(this).not(this)
																.hide();

													}

												},
												error : function() {
													console.log("통신 실패");
												}
											});
								})

				function insertReply() {//댓글 삽입

					$.ajax({
						url : "insertReply.bo",
						data : {
							replyWriter : "${loginUser.userNo}",
							replyContent : $("#content").val(),
							refBno : "${b.boardNo}"
						},
						success : function(result) {
							if (result === "success") {
								alert("댓글이 등록되었습니다.");
								selectReplyList();
								$("#content").val("");
							}
						},
						error : function() {
							console.log("댓글 작성 통신 실패")
						}
					});
				}
				
				function initLike() {
					var boardNo = "${b.boardNo}";
					var userNo = "${loginUser.userNo}";
					var boardWriter = "${b.boardWriter}";
					var likeCnt = "${b.liked}";
					var isLiked = ${b.liked} !== 0 ? 1 : 0;

					if (isLiked) {
						$(".likeIt").css("background-color", "crimson");//버튼 색 변경
						$(".likeIt").find("i").removeClass(
								"fa-regular fa-heart").addClass(
								"fa-solid fa-heart");//채운 하트
					} else {
						$(likeIt).css("background-color",
								"rgb(156, 220, 254)");//예전 버튼 색으로 돌리기
						$(btn).find("i").removeClass(
								"fa-solid fa-heart").addClass(
								"fa-regular fa-heart");//빈 하트
					}
					$("#likeCount").text(likeCount);
					

					//본인 게시글인지 확인
// 					if (userNo != boardWriter) {
// 						//로그인 유저가 다른 사람의 게시글에 좋아요를 눌렀을 때
// 						$(btn).css("background-color", "crimson");
// 						$(btn).find("i").removeClass("fa-regular fa-heart")
// 								.addClass("fa-solid fa-heart");
// 					}
				}
				

				function updateLike(btn) {
					var boardNo = "${b.boardNo}";
					var userNo = "${loginUser.userNo}";
					var boardWriter = "${b.boardWriter}";

					$.ajax({
						type : "POST",
						url : "updateLike",
						dataType : "json",
						data : {
							boardNo : boardNo,
							userNo : userNo,
							boardWriter : boardWriter
						},
						success : function(response) {
							var likeCount = response.likeCouunt;//좋아요 개수
							var isLiked = response.isLiked;//좋아요 여부

							if (isLiked) {
								console.log("처음하는 추천");
								alert("추천되었습니다!");
								$(btn).css("background-color", "crimson");//버튼 색 변경
								$(btn).find("i").removeClass(
										"fa-regular fa-heart").addClass(
										"fa-solid fa-heart");//채운 하트
							} else {
								alert("추천이 취소되었습니다.");
								$(btn).css("background-color",
										"rgb(156, 220, 254)");//예전 버튼 색으로 돌리기
								$(btn).find("i").removeClass(
										"fa-solid fa-heart").addClass(
										"fa-regular fa-heart");//빈 하트
							}
							$("#likeCount").text(likeCount);
						},
						error : function() {
							console.log("통신 실패");
						}
					});
					//본인 게시글인지 확인
					if (userNo != boardWriter) {
						//로그인 유저가 다른 사람의 게시글에 좋아요를 눌렀을 때
						$(btn).css("background-color", "crimson");
						$(btn).find("i").removeClass("fa-regular fa-heart")
								.addClass("fa-solid fa-heart");
					}
				}
			</script>


			<div class="bottom_area">
				<table id="reply_table">

				</table>
				<div class="reply_insert">
					<c:choose>
						<c:when test="${not empty loginUser }">
							<textarea class="form-control" name="content" id="content"
								cols="30" rows="5" style="resize: none;"></textarea>
							<button class="repBtn" onclick="insertReply();">등록</button>
						</c:when>
						<c:otherwise>
							<textarea class="form-control" name="content" id="content"
								cols="30" rows="5" style="resize: none;" readonly>로그인 후 이용 가능합니다.</textarea>
							<button class="repBtn" disabled>등록</button>
						</c:otherwise>
					</c:choose>
				</div>

				<div class="repBtn_area">
					<button type="button" id="backList" style="width:60px;">목륵으로</button>
					<c:if test="${not empty loginUser }">
						<button type="submit" onclick="insertBoard();">글쓰기</button>
					</c:if>
				</div>

				<script>
					document.querySelector('#backList').onclick = function() {
						history.back();
					}

					function insertBoard() {
						location.href = "enrollForm";
					}
				</script>
			</div>
		</div>
	</div>

	<jsp:include page="../../common/footer.jsp" />
</body>
</html>