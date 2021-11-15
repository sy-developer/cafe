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
<link href="../css/mypage.css" rel="stylesheet">
<link href="../css/user_info.css" rel="stylesheet">

<link href="../css/styles.css" rel="stylesheet">

<!--  이부분이 주석풀리면 네비게이션에 영향을 주더라
<link href="../css/common.min.css" rel="stylesheet">
-->

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
			<main>
				<aside class="sidebar_a">
					<ul>
						<li><a href="../mypage/mypage.do"> 회원정보 </a></li>
						<li><a href="../mypage/mypageUpdate.do"> 회원정보수정 </a></li>
						<li><a href="../mypage/check_pw.jsp"> 비밀번호변경 </a></li>
						<li><a href=""> 장바구니 </a></li>
						<li><a href="">위시리스트</a></li>
						<li><a href=""> 구매내역 </a></li>
						<li><a href="../mypage/drop_id.jsp">회원탈퇴</a></li>
					</ul>
				</aside>
				<section>
					<article class="container_a">


						<div class="editdiv">
							<h1 id="edith1">회원 정보</h1>

							<table class="edittable">
								<tr>
									<th>아이디</th>
									<td>${dto.id }</td>
								</tr>
								<tr>
									<th>이름</th>
									<td>${dto.name}</td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td>${dto.age}</td>
								</tr>
								<tr>
									<th>핸드폰번호</th>
									<td>${dto.tel}</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>${dto.email}</td>
								</tr>
								<tr>
									<th>우편번호</th>
									<td>${dto.addr1}</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>${dto.addr2}</td>
								</tr>
								<tr>
									<th>상세주소</th>
									<td>${dto.addr3}</td>
								</tr>
							</table>

						</div>
						<br> <br>

					</article>

				</section>
			</main>
		</div>

	</div>




	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/holder.js"></script>
	<script src="../js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
