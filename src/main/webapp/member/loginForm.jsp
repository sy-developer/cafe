<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../assets/favicon.ico">

<title> sykim Project</title>

<link href="../css/styles.css" rel="stylesheet">

<script src="../js/scripts.js"></script>
<!-- 네이버 로그인 api -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
<!-- 카카오톡 로그인 api -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


<link href="../css/carousel.css" rel="stylesheet">
</head>

<link rel="stylesheet" href="../css/base.css">
<link rel="stylesheet" href="../css/a.css">


<style>
span, a, p, h1, input {
	font-family: cm;
}

div>input {
	font-family: cm;
}
</style>
<body style="margin-top: 100px">

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
							<li class="market"><a href="../market/market.jsp">장바구니</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</div>


	<div class="login-wrap">
		<div style="text-align: left; color: gray;">
			<a class="decox" href="../main/main.do">홈</a>><span>로그인</span>
		</div>

		<form action="login.do" method="post" name="loginForm">
			<!-- 아이디 입력창 -->
			<input class="form-input login-id" type="text" name="id" required
				placeholder='아이디를 입력하세요.'>

			<!-- 비밀번호 입력창 -->
			<input class="form-input login-pw" type="password" name="pwd"
				required placeholder='비밀번호를 입력하세요.'>



			<div class="login-checkbox-wrap">
				<input class="login-checkbox" type="checkbox" name="autologin">
				<span>자동로그인</span>
			</div>

			<!-- 로그인 버튼 -->
			<input class="cm form-input login-submit" type="submit" value="로그인">
			<div class="login-list login-list__sns mt_25">
				<div id="naverIdLogin" class="login-list-item" style="background: limegreen">
					<a href="javascript:;" class="sns-btn login-naver"
						onClick="window.open('https://nid.naver.com/nidlogin.login?mode=form&url=https%3A%2F%2Fwww.naver.com', 'login_popup', 'width=430,height=590,scrollbar=yes');">
						네이버 로그인 </a>
				</div>
				<div class="login-list-item">
					<a href="javascript:;" id="kakao-login-btn"
						class="sns-btn login-kakao"
						onClick="window.open('https://kauth.kakao.com/oauth/authorize?client_id=16c1a7732550f65d8a66aeb7f1d6b836&redirect_uri=http://localhost:8080/Test_s3/main/main.jsp&response_type=code', 'login_popup', 'width=430,height=590,scrollbar=yes');">
						카카오계정 로그인 </a>
				</div>
			</div>

		</form>
		<div style="text-align: left">
			<ul>
				<li><a class="decox" href="../member/id_find.jsp">아이디/비밀번호 찾기</a></li>
				<li><a class="decox" href="../member/joinForm.jsp">회원가입</a></li>
			</ul>
			<br>
		</div>

		<hr>

		<!-- FOOTER -->
		<footer>
			<p class="pull-right">
				<a href="#">Back to top</a>
			</p>
			<p>
				&copy; 2014 Company, Inc. &middot; <a href="#">Privacy</a> &middot;
				<a href="#">Terms</a>
			</p>
		</footer>



	</div>

	<!-- 네이버아디디로로그인 초기화 Script -->
	<script type="text/javascript">
		var naverLogin = new naver.LoginWithNaverId(
				{
					clientId : "rVLBg8l8toponyYrrJGd",
					callbackUrl : "http://localhost:8080/Test_s3/member/NaverLoginSDK.jsp",
					isPopup : false, /* 팝업을 통한 연동처리 여부 */
					loginButton : {
						color : "green",
						height : 60
					}
				/* 로그인 버튼의 타입을 지정 */
				});

		/* 설정정보를 초기화하고 연동을 준비 */
		naverLogin.init();
	</script>
	<!-- 카카오아이디로로그인 초기화 script-->
	<script type='text/javascript'>
		//<![CDATA[
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('4becd27333f80c3addc1a299f94ecd04'); //여기서 아까 발급받은 키 중 javascript키를 사용해준다.
		// 카카오 로그인 버튼을 생성합니다.
		//console.log(Kakao.isInitialized()); // sdk초기화여부판단
		Kakao.Auth.createLoginButton({
			container : '#kakao-login-btn',
			success : function(authObj) {
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(res) {
						alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력
						alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력
						console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
						window.location.replace('http://localhost:8080/Test_s3/main/main.do?kakao_Id="user_kakao"');		                                        
					}
				})
			},
			fail : function(error) {
				//alert(JSON.stringify(error));
			}
		});
		//]]>
	</script>
</body>
</html>