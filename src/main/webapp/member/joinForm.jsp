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

<link href="../css/styles.css" rel="stylesheet">

<script src="../js/scripts.js"></script>
<script src="../js/terms_conditions.js"></script>

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
							<li class="market"><a href="#">장바구니</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</div>

	<div align="center">
		<h2 class=cb>회원이용약관</h2>
		<br>
		<form name="joinForm" method="post" action="../member/joinForm_end.jsp"
			onSubmit="return CheckForm()">

			<div style="margin-bottom: 30px">
				<font style="margin-bottom: 10px;" class="cb" color="#207DBB">
					회원 가입 전 아래의 이용 약관을 읽어 보시기 바랍니다. 약관에 동의하신다면 아래의 [동의] 버튼을 눌러 주세요.</font>
			</div>

			<table border="0" cellpadding="10" cellspacing="0">
				<tbody>
					<tr>

						<td><textarea name="" cols="71" rows="12" class="">																						■ 개인정보의 수집 및 이용목적
																						회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.
																						ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 - 콘텐츠 제공 , 구매 및 요금 결제
																						ο 회원 관리 - 회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인 , 불만처리 등 민원처리
																						ο 마케팅 및 광고에 활용 - 이벤트 등 광고성 정보 전달

																						■ 수집하는 개인정보 항목
																						회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
																						ο 수집항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 비밀번호 질문과 답변 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일 , 직업 , 결혼여부 , 법정대리인정보 , 쿠키 , 결제기록
																						ο 개인정보 수집방법 : 홈페이지(회원가입) 

																						■ 개인정보의 보유 및 이용기간
																						회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.
																						단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.

																						보존 항목 : 로그인ID
																						보존 근거 : 컨텐츠 이용 ID 중복 방지
																						보존 기간 : 3개월

																						보존 항목 : 생년월일
																						보존 근거 : 악용목적에 의한 가입 및 탈퇴방지
																						보존 기간 : 탈퇴일로 3일

																						보존 항목 : 서비스 이용기록
																						보존 근거 : 전자상거래등에서의 소비자보호에 관한 법률
																						보존 기간 : 5년
																						</textarea></td>
					</tr>


					<tr>
						<td valign="top"><input type="checkbox" class="select-item"
							id="Agreement1">동의하십니까</td>
					</tr>

					<tr>
						<td><textarea name="" cols="71" rows="12" class="굴림">	
																																											■ 개인정보 제공
																					회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.
																					- 이용자들이 사전에 동의한 경우
																					- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우
					
																						</textarea></td>
					</tr>

					<tr>
						<td valign="top"><input type="checkbox" class="select-item"
							id="Agreement2">동의하십니까?</td>
					</tr>

					<tr>

						<td><textarea name="" cols="71" rows="12" class="굴림">	
																																											■ 개인정보 제공
																					회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.
																					- 이용자들이 사전에 동의한 경우
																					- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우
					
																						</textarea></td>
					</tr>

					<tr>
						<td valign="top"><input type="checkbox" class="select-item"
							id="Agreement3">동의하십니까?</td>
					</tr>
					<tr>
						<td valign="top"><input type="checkbox" class="select-all"
							onchange="changeCheckbox();">전부 동의</td>
					</tr>
				</tbody>
			</table>
			<input style="padding: 0.5rem" type="submit" value="동의">
			<button style="padding: 0.5rem" type="button"
				onclick="location.href= '../main/main.jsp' ">동의안함</button>


		</form>
	</div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/holder.js"></script>
	<script src="../js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
