<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA게시판 | Cafederia</title>
<link href="../css/styles.css" rel="stylesheet">
<link href="../css/carousel.css" rel="stylesheet">
<link href="../css/badok.css" rel="stylesheet">
<script src="../js/scripts.js"></script>
<script src="../js/boardScript.js?v=5"></script>
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
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-expanded="false">상품보기<span
									class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="../menu/menuList.do?sep=a">커피/주스</a></li>
									<li class="divider"></li>
									<li><a href="../menu/menuList.do?sep=b">케이크</a></li>
									<li class="divider"></li>
									<li><a href="#">마카롱/크로플</a></li>
								</ul></li>
							<li class="dropdown" style="width: 650px"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown" role="button"
								aria-expanded="false">고객센터<span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="../notice/noticeList.do">공지사항</a></li>
									<li class="divider"></li>
									<li><a href="boardList.do">QnA</a></li>
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
								<li class="market"><a href="../market/market.do\">장바구니</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</div>
	
	<div class="main_list">
		
		<div class="main_title">
			<h1 style="margin: auto;">글 수정하기</h1>
		</div>
		<br>
		<form name="boardModifyForm" action="boardModify.do" method="post">
			<input type="hidden" name="board_num" value="${board_num }">
			<input type="hidden" name="pg" value="${pg }">
			<table style="margin-left:auto; margin-right:auto;">
				<tr>
					<th>작성자</th>
					<td><input type="text" value="${memId }" disabled></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" size="43" name="subject" value="${boardDTO.board_subject}"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="15" cols="45" name="content">${content }</textarea></td>
				</tr>
				<c:if test="${memId == memId}">
				<tr>
					<td colspan="2" align="center">
						<input type="button" class="btn btn-info" value="목록" onclick="location.href='boardList.do?pg=${pg }'">
						<input type="button" value="글수정" onclick="checkBoardModify()">
						<input type="reset" value="다시 작성">
					</td>
				</c:if>
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