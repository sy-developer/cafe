 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>카페데리아 | Cafederia</title>

<!-- Bootstrap core CSS -->
<link href="../css/styles.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="../js/scripts.js?v=6"></script>

<!-- Custom styles for this template -->
<link href="../css/carousel.css" rel="stylesheet">
</head>
<!-- NAVBAR
================================================== -->
<body onload="openPopup('popup.jsp')">
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
								<li class="mypage"><a href="../mypage/mypage.do">내정보</a></li>
								<li class="market"><a href="../market/market.do">장바구니</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</div>


	<!-- Carousel
    ================================================== -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img class="first-slide"
					src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
					alt="First slide">
				<div class="container">
					<div class="carousel-caption">
						<!--  <h1>Example headline.</h1>
              <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>  -->
						<img class="png" alt="그림이 없어영" src="../img/1.PNG">
					</div>
				</div>
			</div>
			<div class="item">
				<img class="second-slide"
					src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
					alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
						<!-- <h1>Another example headline.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p> -->
						<img class="png" alt="그림이 없어영" src="../img/2.PNG">
					</div>
				</div>
			</div>
			<div class="item">
				<img class="third-slide"
					src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
					alt="Third slide">
				<div class="container">
					<div class="carousel-caption">
						<!-- <h1>One more for good measure.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p> -->
						<img class="png" alt="그림이 없어영" src="../img/3.PNG">
					</div>
				</div>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!-- /.carousel -->


	<!-- Marketing messaging and featurettes
    ================================================== -->
	<!-- Wrap the rest of the page in another container to center all the content. -->

	<div class="container marketing">

		<c:if test="${memId == null }">
			<h1 style="text-align: center;">환영합니다!!! 카페데리아를 이용하시려면 로그인해주세요!!</h1>
		</c:if>
		<c:if test="${memId != null}">
			<!-- Three columns of text below the carousel -->
			<div class="row">
				<div class="col-lg-4">
					<img class="img-circle" src="../storage/${dto_a.image }" alt="그림없음"
						width="140" height="140">
					<h2>${dto_a.menu_name }</h2>
					<p>${dto_a.info }</p>
					<p>
						<a class="btn btn-default"
							href="../menu/menuView.do?sep=${sep_a }&stock_num=${dto_a.stock_num }"
							role="button">View details &raquo;</a>
					</p>
				</div>
				<!-- /.col-lg-4 -->
				<div class="col-lg-4">
					<img class="img-circle" src="../storage/${dto_b.image }" alt="그림없음"
						width="140" height="140">
					<h2>${dto_b.menu_name }</h2>
					<p>${dto_b.info }</p>
					<p>
						<a class="btn btn-default"
							href="../menu/menuView.do?sep=${sep_b }&stock_num=${dto_b.stock_num }"
							role="button">View details &raquo;</a>
					</p>
				</div>
				<!-- /.col-lg-4 -->
				<div class="col-lg-4">
					<img class="img-circle" src="../storage/${dto_c.image }" alt="그림없음"
						width="140" height="140">
					<h2>${dto_c.menu_name }</h2>
					<p>${dto_c.info }</p>
					<p>
						<a class="btn btn-default"
							href="../menu/menuView.do?sep=${sep_c }&stock_num=${dto_c.stock_num }"
							role="button">View details &raquo;</a>
					</p>
				</div>
		</c:if>

		<!-- /.col-lg-4 -->
	</div>
	<!-- /.row -->


	<!-- START THE FEATURETTES -->

	<hr class="featurette-divider">
	<c:if test="${memId != null}">

		<div class="row featurette">
			<div class="col-md-7">
				<h4 class="featurette-heading">
					${dto_mug.menu_name } <br> <span class="text-muted"
						style="font: bold;">${dto_mug.price }원</span>
				</h4>
				<p class="lead">${dto_mug.info }</p>
			</div>
			<div class="col-md-5">
				<img class="featurette-image img-responsive center-block"
					src="../storage/${dto_mug.image }" alt="Generic placeholder image">
			</div>
		</div>

		<hr class="featurette-divider">

		<div class="row featurette">
			<div class="col-md-7">
				<h4 class="featurette-heading">
					${dto_glass.menu_name } <br> <span class="text-muted"
						style="font: bold;">${dto_glass.price }원</span>
				</h4>
				<p class="lead">${dto_glass.info }</p>
			</div>
			<div class="col-md-5">
				<img class="featurette-image img-responsive center-block"
					src="../storage/${dto_glass.image }"
					alt="Generic placeholder image">
			</div>
		</div>

		<hr class="featurette-divider">

		<div class="row featurette">
			<div class="col-md-7">
				<h4 class="featurette-heading">
					${dto_tum.menu_name } <br> <span class="text-muted"
						style="font: bold;">${dto_tum.price }원</span>
				</h4>
				<p class="lead">${dto_tum.info }</p>
			</div>
			<div class="col-md-5">
				<img class="featurette-image img-responsive center-block"
					src="../storage/${dto_tum.image }" alt="Generic placeholder image">
			</div>
		</div>
	</c:if>

	<hr class="featurette-divider">

	<!-- /END THE FEATURETTES -->


	<!-- FOOTER -->
	<footer>
		<p class="pull-right">
			<a href="#">Back to top</a>
		</p>
		<p>
			&copy; 2014 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a
				href="#">Terms</a>
		</p>
	</footer>

	</div>
	<!-- /.container -->


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


