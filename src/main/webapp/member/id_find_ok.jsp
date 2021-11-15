<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../assets/favicon.ico">

<title>sykim Project</title>

<link href="../css/styles.css" rel="stylesheet">

<!--  이부분이 주석풀리면 네비게이션에 영향을 주더라
<link href="../css/common.min.css" rel="stylesheet">
-->

<script src="../js/scripts.js"></script>

<link href="../css/find_id_result.css" rel="stylesheet">
<link href="../css/carousel.css" rel="stylesheet">

</head>
<body>
	<div class="navbar-wrapper">
		<div class="container">

			<nav class="navbar navbar-inverse navbar-static-top">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar"
							aria-expanded="false" aria-controls="navbar">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="../main/main.do">스벅 카피</a>
					</div>
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav">

							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-expanded="false">상품보기<span
									class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="../menu/menuList.do?sep=a">커피/주스</a></li>
									<li class="divider"></li>
									<li><a href="../menu/menuList.do?sep=b">케이크</a></li>
									<li class="divider"></li>

									<li><a href="../menu/menuList.do?sep=c">샌드위치/샐러드</a></li>
								</ul></li>
							<li class="dropdown" style="width: 650px"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown" role="button"
								aria-expanded="false">고객센터<span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="../notice/noticeList.do">공지사항</a></li>
									<li class="divider"></li>
									<li><a href="../board/boardList.do">QnA</a></li>
								</ul></li>
							<li class="login"><a href="../member/loginForm.jsp">로그인</a></li>
							<li class="join"><a href="../member/joinForm.jsp">회원가입</a></li>
							<li class="market"><a href="../market/market.do">장바구니</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		<main>

			<div class="find-wrap">
				<br> <br>
				<h1>내 계정 찾기</h1>

				<div class="center">

					<br>
					<c:if test="${search_id != null}">
						<h3>
							소중한 ${name}님의 아이디는
							<P></P>
							<span>${search_id }</span>입니다
						</h3>
					</c:if>
					<c:if test="${search_id == null}">
						<h3>입력하신 정보로 해당 ID를 찾을수 없습니다.</h3>
					</c:if>
					<br>


					<!-- 이 다음에 할 거 링크-->
					<div class="change_after">
						<a href="../member/loginForm.jsp"> <input class="click-btn2"
							type="submit" value="로그인하기"></a> 
						<a href="../member/pw_find.jsp"> <input class="click-btn2"
							type="submit" value="비밀번호찾기"></a>
					</div>


					<div class="change_after"></div>
				</div>
			</div>

		</main>
	</div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/holder.js"></script>
	<script src="../js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
