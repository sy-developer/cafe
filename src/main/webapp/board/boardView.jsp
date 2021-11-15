<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA게시판 | Cafederia</title>
<link href="../css/styles.css" rel="stylesheet">
<link href="../css/carousel.css" rel="stylesheet">
<link href="../css/badok.css" rel="stylesheet">
<script src="../js/scripts.js"></script>
<script src="../js/boardScript.js"></script>
<script type="text/javascript">		
	$(document).ready(function(){
		var formObj = $("form[name='readForm']");		
		//댓글 수정 View
		$(".replyUpdateBtn").on("click", function(){
			location.href = "/board/replyUpdateView?bno=${read.bno}"
							+ "&page=${scri.page}"
							+ "&perPageNum=${scri.perPageNum}"
							+ "&searchType=${scri.searchType}"
							+ "&keyword=${scri.keyword}"
							+ "&rno="+$(this).attr("data-rno");
		});
		//댓글 삭제 View
		$(".replyDeleteBtn").on("click", function(){
			location.href = "/board/replyDeleteView?bno=${read.bno}"
				+ "&page=${scri.page}"
				+ "&perPageNum=${scri.perPageNum}"
				+ "&searchType=${scri.searchType}"
				+ "&keyword=${scri.keyword}"
				+ "&rno="+$(this).attr("data-rno");
		});
	})
</script>
<style type="text/css">
h1 {text-align:center;}
body{background-color:#f3efe9; transition:all}
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
								<li class="내정보"><a href="../member/joinForm.do">내정보</a></li>
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
			<h1>QnA게시판 글 상세보기</h1>
		</div>
		<br>
		
		<div class="table-responsive">
		<table class="table">
			<tr>
				<td colspan="3" style="font-size:30px">${boardDTO.board_subject }</td>
			</tr>
			<tr align="center">
				<td width="120">글번호 : ${boardDTO.board_num }</td>
				<td width="120">작성자 : ${boardDTO.board_id }</td>
				<td width="120">조회수 : ${boardDTO.board_readcount }</td>
			</tr>
			<tr align="center">
				<td colspan="3" height="300" valign="top">
					${boardDTO.board_content }
				</td>
			</tr>
		</table>
		</div>
		<input type="button" class="btn btn-info" value="목록" onclick="location.href='boardList.do?pg=${pg }'">
		<!-- 글수정과 글삭제는 로그인된 사람과 글쓴 사람이 같을 때만 보이게 설정함 -->
		<c:if test="${memId == boardDTO.board_id}">
			<input type="button" class="btn btn-success" value="글수정" onclick="location.href='boardModifyForm.do?board_num=${board_num }&pg=${pg }'">	
			<input type="button" class="btn btn-warning" value="글삭제" onclick="location.href='boardDelete.do?board_num=${board_num }&pg=${pg }'">
		</c:if>
		<!-- 댓글쓰기는 로그인 된 사람들만 보이게 설정함 -->
		<c:if test="${memId != null}">
			<input type="button" class="btn btn-dark" value="댓글달기" onclick="location.href='boardReplyForm.do?board_num=${board_num }&pg=${pg }'">
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