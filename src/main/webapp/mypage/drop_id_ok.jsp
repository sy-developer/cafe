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

<title>EZEN 2Team Project</title>
<link href="../css/change_pw.css" rel="stylesheet">
<link href="../css/styles.css" rel="stylesheet">
<link href="../css/drop_id.css" rel="stylesheet">
<script src="../js/scripts.js"></script>
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
							<c:if test="${memId == null}">
								<!--로그인 전 -->
								<li class="login"><a href="../member/loginForm.jsp">로그인</a></li>
								<li class="join"><a href="../member/joinForm.jsp">회원가입</a></li>
								<li class="market"><a href="#">장바구니</a></li>
							</c:if>

							<c:if test="${memId != null}">
								<!--로그인 후 -->
								<li class="logout"><a href="../member/logout.do">로그아웃</a></li>
								<li class="내정보"><a href="../mypage/mypage.do">내정보</a></li>
								<li class="market"><a href="../market/market.do">장바구니</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</nav>

			<div style="padding-top: 50px;">
				<main class="out-main">


					<c:if test="${result == 0}">
						<div class="out-wrap">
							<h1>회원탈퇴실패</h1>
							<div class="center">
								<br>
								<h3>다시 한번 생각하라는 기회 ^_^</h3>
								<br> <a href="../main/main.do"> <input
									class="click-btn2" type="submit" value="메인으로가기"></a>
							</div>
						</div>
					</c:if>
					
					<c:if test="${result == 1}">
						<div class="out-wrap">
							<h1>회원탈퇴..완료..</h1>
							<div class="center">
								<br>
								<h3>소중한 고객님, 안녕히 가세요..</h3>
								<br> <a href="../member/joinForm.jsp"> <input
									class="click-btn2" type="submit" value="회원가입하기"></a>
							</div>
						</div>
					</c:if>

				</main>
			</div>
		</div>

	</div>




	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/holder.js"></script>
	<script src="../js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
