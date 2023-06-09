<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[Koala] Member List</title>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
	.searchArea{
		margin : auto;
		width: 80%;
		height: 800px;
		background-color: orange; 
		box-sizing: border-box;
	}
	.toparea {
		margin:auto;
		padding-top:60px;
		width: 60%;
		height: 20%;
	 	background-color: red;
	 	box-sizing: border-box;
	}
	.tableArea{
		marigin:auto;
		width: 100%;
		background-color: blue;
		height: 60%;
	 	box-sizing: border-box;
	}
	.topinputbox{
		margin:0 auto;
		width: 70%;
		height: 40%;
		box-sizing: border-box;
	}
	.topselectbox, .topbutton{
		width: 15%;
		height: 40%;
		box-sizing: border-box;
	}
	.toparea div {
		float: left;
		border: 2px solid black;
		box-sizing: border-box;
	}
	.tableList{
		width:60%;

		margin:auto;
		border: 2px solid black;
	}
	.tableList *{
		border: 2px solid black;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="wrap">
		<div class="searchArea">
			<div class="toparea">
				<div class="topselectbox">
					<select style="width: 100%; height: 100%;">
						<option>NAME</option>
						<option>ID</option>
						<option>GRANT</option>
					</select>
				</div>
				<div class=topinputbox>
					<input type="text" placeholder="검색어를 입력해주세요..." name="search" style="width: 100%; height: 100%;">
				</div>
				<div class=topbutton>
					<button type="submit" class="btn btn-primary" style="width: 100%; height: 100%">검색</button>
				</div>
			</div>
			<div class="tableArea">
				<table class="tableList">
					<thead>
						<tr>
							<th width="20%" >No</th>
							<th width="20%">ID</th>
							<th width="20%">Name</th>
							<th width="20%">A</th>
							<th width="20%">B</th>
						</tr>
					</thead>
						
					<tbody>
						<tr>
							<td>1</td>
							<td>2</td>
							<td>3</td>
							<td>4</td>
							<td>5</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="btnArea">
		
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>