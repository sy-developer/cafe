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

<title>sykim Project</title>
<link href="../css/market.css" rel="stylesheet">
<link href="../css/styles.css" rel="stylesheet">


<script src="../js/scripts.js"></script>
<!--<script src="../js/market.js?v=1"></script>-->
<script src="../js/basket.js?v=2"></script>
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
		</div>
	</div>

	<div>
		<h3 style="text-align: center; margin: 100px 20px 10px 10px;">주문하실
			상품을 선택해주세요</h3>
	</div>
	<br />
	<div id="frame" class="aaa">
		<div>
			<form method="get" action="">
				<table class="calculation1">
					<thead>
						<tr>
							<th colspan="7" class="right"
								style="background-color: antiquewhite;"><input
								type="button" class="btn default"
								style="width: 110px; padding: 10px; margin-bottom: 3px; font-size: 15px; background: white"
								value="선택상품구매" onclick="javascript:basket.credit();"> <input
								type="button" class="btn default"
								style="width: 90px; padding: 10px; margin-bottom: 3px; font-size: 15px"
								value="삭제하기" onclick="javascript:basket.delItem();"></th>
						</tr>
						<tr>
							<th><input style="width: 10px;" type="checkbox" id="check"
								class="cart_all_click" onchange="javascript:basket.selectAll();"></th>
							<th style="width: 280px; height: 50px;"><span>이미지</span></th>
							<th style="width: 450px;"><span>상품정보</span></th>
							<th style="width: 80px;">판매가</th>
							<th style="width: 20px;">수량</th>
							<th style="width: 80px;">적립금</th>
							<th style="width: 100px;">배송비</th>
						</tr>
					</thead>
					<tbody>

						<tr style="height: 90px; background-color: #fff;">
							<td colspan="7"><c:forEach var="dto" items="${list }">
									<div class="row data">
										<tr style="height: 90px; background-color: #fff;">
											<td
												style="text-align: left; text-align: center; border-right: none; width: 3%">
												<input type="checkbox" name="cart_no" id="p_no"
												class="checked" value=${dto.stock_num }
												onclick="javascript:basket.checkItem();">
											</td>
											<td style="border-left: none; border-right: none;"
												id="p_name">${dto.menu_name }<br> <a href="#">
													<img src="../storage/${dto.image }" width="100px"
													height="100px"> <!--dto에 image값이 없음  -->
											</a>

											</td>
											<td
												style="text-align: left; padding-left: 10px; border-left: none; font-weight: bold;">${dto.info }</td>

											<td><span style="padding-left: 10px;" id="p_price"
												value=${dto.price }>${dto.price }</span>원</td>

											<td style="width: 50px;">
												<!-- 이 배치가 바뀌면 프로그래밍에 문제가 생김(강사 왈) --> <input type="number"
												style="text-align: right; width: 40px; margin-bottom: 3px;"
												name="cart_cnt" calss="p_num" min="1" max="99" step="1"
												value="${dto.amount }"> <input type="button"
												class="btn default" style="border-radius: 3px; size: 10px;"
												value="변경" onclick="sendEdit(this);"> <input
												type="hidden" value=${dto.stock_num }>


											</td>
											<td>----</td>

											<td>${fee }원<br>
											</td>

										</tr>
									</div>
								</c:forEach></td>
						</tr>

					</tbody>

					<tfoot>
						<tr style="height: 60px;">
							<td colspan="5"
								style="border-right: none; text-align: left; padding-left: 10px;">
								<span> </span>
							</td>
							<td colspan="5"
								style="border-left: nonoe; text-align: right; padding-right: 10px;">
								<!-- 전체 핪 데이터 데이터 처리 문구 필요 --> 상품금액 : <span id="sum_p_price">0</span>원
								+ <span id="deliver">${fee }</span><span>원 = </span><span
								id="finalPrice">0+${fee }원</span>&nbsp;<span
								style="font-weight: bold; font-size: 15pt;"></span>
							</td>
						</tr>


					</tfoot>
				</table>
			</form>
		</div>



		<%--결제예정금액--%>

		<table class="calculation2">
			<tr>
				<th style="width: 350px;">총 상품금액</th>
				<th style="width: 350px;">총 배송비</th>
				<th style="width: 750px; padding: 22px 0;"><span>결제예정금액</span></th>
			</tr>

			<tr style="background-color: #fff;">
				<td style="padding: 22px 0;"><span class="price"
					id="sum_p_price2">0</span>원</td>
				<td><span class="price" id="deliver2">0</span>원</td>
				<td><span class="price" id="finalPrice2">0</span>원</td>

			</tr>
		</table>
		<br /> <br />
	</div>

	<div style="margin: 10px 10;" align="center">
		<a href="../main/main.do">
			<button class="btn default backBtn btnfloat2"
				style="background-color: gray; color: #fff;">홈으로</button>
		</a> <a href="">
			<button class="btn default backBtn btnfloat2"
				style="background-color: gray; color: #fff;">마이페이지 가기</button>
		</a> <a href="">
			<button class="btn default backBtn btnfloat2"
				style="background-color: gray; color: #fff;">위시리스트 가기</button>
		</a> <a href="">
			<button class="btn default backBtn btnfloat2"
				style="background-color: gray; color: #fff;">구매내역 가기</button>
		</a>
	</div>

	</div>
	<br />
	<br />
	<br>



	<div align="center">


		<br> <br> <br> <span class="clearboth"></span>

	</div>
	<br />
	<br />
	<br />
	<br />
	<br />
	<div id="frame" class="bbb">

		<div
			style="border: solid 1px #3333; padding: 10px 0; font-size: 12pt; background-color: antiquewhite; padding-left: 10px;">배송
			예약 시스템안내</div>
		<div
			style="border: solid 1px #3333; height: 220px; font-size: 12pt; padding-left: 10px;">
			<br />

			<ol>

				<li class="lifont">제품은 단품이 각각 포장되어 직접 배송/시공해드립니다.(일부 택배 품목 제외)</li>
				<li class="lifont">또한, 저의 "reemD는 고객님들의 편의를 위하여 배송일을 좀 더 정확하고
					확정할 수 있는 서비스를 제공하도록 노력하고있습니다."</li>
				<li class="lifont">배송 희망일을 선택하시면 온라인 담당자와 시공담당자가 세부일정을 확정해
					알려드리는 시스템을 실행하고 있습니다.</li>
				<li class="lifont">배송시간은 확실하게 지정할 수 없으며 배송 전 시공사가 연락드릴 예정입니다.</li>
				<li class="lifont">성수기인 1월~6월사이에는 납기가 많이 지연되는 점, 양해부탁드리며 시공에 다라
					희망 배송일이 변경될 수 있습니다. <br>따라서 변경 시 온라인 담당자가 연락을 드리며 일정을 최대한
					맞춰드리도록 하겠습니다.
				</li>

			</ol>

		</div>
	</div>
	<br />
	<br />
	<br />
	<br />
	<br />
	<div id="frame" class="bbb">
		<div
			style="border: solid 1px #3333; padding: 10px 0; font-size: 12pt; background-color: antiquewhite; padding-left: 10px;">결제
			전 확인사항</div>
		<div
			style="border: solid 1px #3333; height: 120px; font-size: 12pt; padding-left: 10px;">

			<ol>

				<li class="lifont">고객의 단순한 변심으로 교환, 반품 빛 환불을 요구할 때 수반되는 배송비는
					고객님께서 부담하셔야합니다.</li>
				<br>
				<li class="lifont">상품을 개봉, 설치한 후에는 상품의 재판매가 불가능하므로 고객님의 변심에 대한
					교환, 반품이 불가능함을 양지해 주시기 바랍니다.</li>
				<br>
				<br>
			</ol>

		</div>
	</div>

	<!-- 변경을 위한 form : 수량, 카트번호가 있어야함 -->
	<form method="post" action="cart_cnt_change.do" class="edit-form">
		<input type="hidden" name="cart_no" value=""> <input
			type="hidden" name="cart_cnt" value="">
	</form>

	<form method="post" action="market_buy.do" class="edit-form1">
		<input type="hidden" id="arr" name="array" value="">
		<input type="hidden" id="total_aaa" name="total_aaa" value="">
	</form>
	
	<form method="post" action="market_delete.do" class="edit-form2">
		<input type="hidden" id="arr" name="array" value="">
	</form>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/holder.js"></script>
	<script src="../js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
