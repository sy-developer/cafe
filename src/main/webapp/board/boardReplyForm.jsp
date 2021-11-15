<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 게시판 | Cafederia</title>
<link href="../css/styles.css" rel="stylesheet">
<link href="../css/carousel.css" rel="stylesheet">
<link href="../css/badok.css" rel="stylesheet">
<script src="../js/scripts.js"></script>
<style type="text/css">
body {background-color:#f3efe9; transition:all}
</style>
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
	<div class="main_list">
		
		<div class="main_title">
			<h2>QnA 게시판 댓글쓰기</h2>
		</div>
		<br>
			<form action="boardReply.do" method="post" name="boardReplyForm">
				<input type="hidden" value="${page }" name="page">
				<input type="hidden" value="${board_num }" name="board_num">
				<input type="hidden" value="${board_re_ref }" name="board_re_ref">
				<input type="hidden" value="${board_re_lev }" name="board_re_lev">
				<input type="hidden" value="${board_re_seq }" name="board_re_seq">
				<table style="margin-left:auto; margin-right:auto;">
					<tr>
						<td class="td_left">작성자</td>
						<td class="td_right">
							<input type="text" value="${memId}" disabled/>
						</td>
					</tr>
					<tr>
						<td class="td_left">비밀번호</td>
						<td class="td_right">
							<input type="password" name="pass" required="required" placeholder="비밀번호를 입력하세요">
						</td>
					</tr>
					<tr>
						<td class="td_left">제목</td>
						<td class="td_right">
							<input type="text" name="subject" required="required" placeholder="제목을 입력하세요">
						</td>
					</tr>
					<tr>
						<td class="td_left">내용</td>
						<td class="td_right">
							<textarea rows="15" cols="40" name="content"
								required="required" placeholder="내용을 입력하세요"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">							
							<input type="button" class="btn btn-info" value="목록" onclick="'boardList.do?pg=${pg }'">
							<input type="submit" class="btn btn-success" value="댓글등록" onclick="location.href='boardList.do?board_num=${board_num } pg=${pg }">
							<input type="button" class="btn btn-warning" value="뒤로가기" onclick="history.back()">
						</td>
					</tr>
				</table>
			</form>
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