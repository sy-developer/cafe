<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
body {background-color:#f3efe9; transition:all}
h1 {text-align:center;}
.page_notice_search{padding:20px; }
.page_notice_search p {position:static; width:100%; }
.page_notice_search p input {width:68%; }
.page_notice_search p a { width:28%; }
.write_button {text-align:right}
.notice_table {margin:auto; padding:auto;}
</style>
<title>공지사항 | Cafederia</title>
<link href="../css/styles.css" rel="stylesheet">
<link href="../css/carousel.css" rel="stylesheet">
<link href="../css/badok.css" rel="stylesheet">
<script src="../js/scripts.js"></script>
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
							<!--     <li class="active"><a href="#">Home</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>   -->
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
								<li class="market"><a href="#market">장바구니</a></li>
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
		</div>
	</div>
	<!-- boardView 시작 -->
	<div class="main_list">
		<div class="main_title">
			<h1>공지사항 상세보기</h1>
		</div>
		<br>
		
		<div class="table-responsive">
		<table class="table">
			<tr>
				<td colspan="3" style="font-size:30px">${noticeDTO.notice_subject }</td>
			</tr>
			<tr align="center">
				<td width="120">글번호 : ${noticeDTO.notice_num }</td>
				<td width="120">작성자 : ${noticeDTO.notice_id }</td>
				<td width="120">조회수 : ${noticeDTO.notice_readcount }</td>
			</tr>
			<tr align="center">
				<td colspan="3" height="300" valign="top">
					${noticeDTO.notice_content }
				</td>
			</tr>
		</table>
		</div>
		<input type="button" value="목록" onclick="location.href='noticeList.do?pg=${pg }'">
		<!-- 글수정과 글삭제는 관리자만 보이게 설정함 -->
		<c:if test="${memId == noticeDTO.notice_id}">
			<input type="button" id="list_btn" value="글수정" onclick="location.href='noticeModifyForm.do?notice_num=${notice_num }&pg=${pg }'">	
			<input type="button" id="delete_btn" value="글삭제" onclick="location.href='noticeDelete.do?notice_num=${notice_num }&pg=${pg }'">
		</c:if>
	</div>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<script src="../js/holder.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>