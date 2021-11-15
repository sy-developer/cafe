<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!-- 우편번호 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link href="../css/styles.css" rel="stylesheet">

<!--  이부분이 주석풀리면 네비게이션에 영향을 주더라
<link href="../css/common.min.css" rel="stylesheet">
-->

<script src="../js/scripts.js"></script>
<script src="../js/redundancy_check.js?v=5"></script>
<script src="../js/postcode.js"></script>


<link href="../css/carousel.css" rel="stylesheet">
<link rel="stylesheet" href="../css/base.css">

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
	</div>

	<div align="center">

		<div style="margin-top: 100px">
			<h2 class="cb">회원가입</h2>
		</div>

		<br>

		<!-- 	<form action="/home/member/join.do"> -->
		<!-- 
		form을 만들 때에는 전송방식을 설정할 수 있다.
		- GET : 주소를 이용하여 요청과 데이터 모두 전달하는 방식
			- 장점 : 간편하게 사용이 가능하다
			- 단점 : 길이 제한이 있다(256byte) , 주소창에 데이터가 노출된다
			- 주로 간편한 select 등을 수행할 때 사용
		- POST : 요청 바디(request body)에 데이터를 첨부하여 전달하는 방식
			- 장점 : 길이 제한이 없다. 데이터가 주소창에 노출되지 않는다
			- 단점 : 요청을 보내기 위해서 도구가 많이 필요하다(form 등), 한글과 같은 유니코드가 깨져서 저장된다
			- 이 방식으로 전송한 데이터를 복구하기 위해서는 request.setCharacterEncoding() 명령이 필요
			- 주로 등록과 같은 복잡한 데이터 전송에 사용
	 -->
		<form action="join.do" method="post" name="joinForm_end">
			<table border="0">
				<tbody>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="member_id" required
							placeholder="5~20자 영문 또는 숫자 " id="parent"> <input
							type="button" value="ID중복확인" onclick="checkId()"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="member_pw" required
							placeholder="8~16자 영문 또는 숫자"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="member_name" required
							placeholder="한글 8자 이내"></td>
					</tr>
					<tr>
						<th rowspan="3">주소</th>
						<td>
							<!-- 우편번호는 6자정도 크기에 6자까지만 입력하도록 설정 --> <input type="text"
							name="post" size="6" maxlength="6" placeholder="우편번호"> <!-- 버튼은 눌러도 지금 당장은 효과가 없다(자바스크립트 배워야 함) -->
							<input type="button" onclick="findAddress();" value="우편번호 찾기">
						</td>
					</tr>
					<tr>
						<td><input type="text" name="base_addr" size="50"
							placeholder="기본주소"></td>
					</tr>
					<tr>
						<td><input type="text" name="extra_addr" size="50"
							placeholder="상세주소"></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" name="member_phone" required
							placeholder="- 제외"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" name="member_email" required
							placeholder="@ 포함"></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input type="date" name="member_birth" required>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2" align="center">
						<input style="padding: 0.5rem;" type="submit" value="가입하기">
						<input style="padding: 0.5rem;" type="reset" value="취소하기" onclick="location.href= '../main/main.jsp'">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>

		<!-- FOOTER -->
		<footer>
			<p>
				&copy; 2014 Company, Inc. &middot; <a href="#">Privacy</a> &middot;
				<a href="#">Terms</a>
			</p>
		</footer>

	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/holder.js"></script>
	<script src="../js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
