<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA게시판 | Cafederia</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link href="../css/styles.css" rel="stylesheet">
<link href="../css/carousel.css" rel="stylesheet">
<link href="../css/badok.css" rel="stylesheet">
<script src="../js/scripts.js"></script>
<script type="text/javascript">
	function isLogin(board_num) {
		//alert("boardView.do?seq=" + seq + "&pg=" + ${pg});
		if(${memId == null}) {
			alert("먼저 로그인 하세요.");
		} else {
			location.href = "../member/loginForm.do";
		}
	}
	
</script>
<style type="text/css">
body {background-color:#f3efe9; transition:all}
h1 {text-align:center;}
.page_qna_search{padding:20px; }
.page_qna_search p {position:static; width:100%; }
.page_qna_search p input {width:68%; }
.page_qna_search p a { width:28%; }
.write_button {text-align:right}
.qna_table {margin:auto; padding:auto;}
table tr th {font-size:17px;}
#subjectA:link {color:black; text-decoration: none;}
#subjectA:visited {color:black; text-decoration: none;}
#subjectA:hover {color:blue; text-decoration: underline;}
#subjectA:active {color:black; text-decoration: none;}
.page_qna_search {margin:0; padding:0;}

/* paging */
.paging {color: blue; text-decoration: none;}
.currentPaging {color: red; text-decoration: underline;}
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
		</div>
	</div>
	<!-- 게시판 리스트 보기 시작 -->
	<div class="main_list">
	
		<div class="main_title">
			<h1 style="margin: auto;">QnA 게시판</h1>
		</div>
		<br>
		
		<div class="list_start">
			<input type="text" id="search_bar" placeholder="검색어를 입력해 주세요."> 
			<a href="#" class="sub_con_search">
				<img alt="검색" src="../img/magnifying-icon-style.png" width="17" height="17">
			</a>
			<!-- 로그인 상태일 경우, 글쓰기 항목 보이기 -->			 
			<c:if test="${memId != null }">
				<a href="boardWriteForm.jsp" class="write_button">글쓰기</a>
			</c:if>
		</div>
			<table class="table table-hover table-striped text-center">
				<thead>
					<tr align="center">
						<th>번호</th>
						<th text-align="center">제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="dto" items="${list }">
					<tr>
						<td>${dto.board_num }</td>
						<td>
						<c:if test="${memId != null }">
							<a href="boardView.do?board_num=${dto.board_num}&pg=${pg}" 
							id="subjectA" onclick="isLogin(${dto.board_num})">
							${dto.board_subject } </a>
						</c:if>
						<c:if test="${memId == null }">
							<a href="../member/loginForm.jsp" 
							id="subjectA" onclick="isLogin(${dto.board_num})">
							${dto.board_subject } </a>
						</c:if>
						</td>
						
						
						<td>${dto.board_id }</td>
						<td>${dto.logtime }</td>
						<td>${dto.board_readcount }</td>
					</tr>
				</c:forEach>
				</tbody>
				<!-- 페이지 표시 -->
				
				<tr>
					<td colspan="5" align="center">
						
						<c:if test="${startPage > 3 }">			
							[ <a class="paging" href="boardList.do?pg=${startPage - 1 }">이전</a> ]
						</c:if>
								
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<c:if test="${pg == i }">
							[ <a class="currentPaging" href="boardList.do?pg=${i }">${i }</a> ]
						</c:if>
				
						<c:if test="${pg != i }">
							[ <a class="paging" href="boardList.do?pg=${i }">${i }</a> ]
						</c:if>
					</c:forEach>				
			
						<c:if test="${endPage < totalP }">						
							[ <a class="paging" href="boardList.do?pg=${endPage + 1 }">다음</a> ]
						</c:if>
					</td>
				</tr>
				
			</table>
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