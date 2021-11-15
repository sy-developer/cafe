<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/scripts.js?v=6"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.entry {
	width: 410px;
	height: 510px;
	background-image: url("../img/pop.jpg");
}

h6.title {
	text-shadow: 1px 1px 2px #666666;
	color: white;
	padding-top: 455px;
	padding-left: 235px;
	text-align: center;
}

img {
	width: 395px;
	height: 485px;
}
</style>
</head>
<body>
	<div class="entry">
		<h6 class="title">
			<input type="checkbox" id="check" onclick="closePopup();">
			<fontsize=3> <b>오늘하루열지않기</b></fontsize>
			<!-- 닫기창 버튼 쓰려면 위의 input태그에서 onclick 요소 빼고 밑의 버튼 주석풀면 됨 -->
			<!-- <button onclick="closePopup();">닫기</button>
			 -->
		</h6>
	</div>
</body>
</html>