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

<!-- 우편번호 api -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link href="../css/styles.css" rel="stylesheet">

<script src="../js/scripts.js"></script>
<script src="../js/postcode.js"></script>
<script src="../js/pay.js?v=2"></script>
<link href="../css/carousel.css" rel="stylesheet">
<link href="../css/buy_page.css" rel="stylesheet">

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

		<form action="buy_page.do" method="post" name="buy_page" class="form">
			<c:if test="${one != null}">

				<table>
					<thead>
						<tr>
							<td colspan="6" class="center bottomline"></td>
						</tr>
						<tr class="row-empty"></tr>
						<tr>
							<td class="center" style="width: 13%">이미지</td>
							<td class="center" style="width: 5%">상품이름</td>
							<td class="center" style="width: 20%">상품정보</td>
							<td class="center" style="width: 5%">가격</td>
							<td class="center" style="width: 5%">수량</td>
							<td class="center" style="width: 5%">총 주문금액</td>
						</tr>
						<tr class="row-empty"></tr>
					</thead>

					<tbody class="item_info_color">


						<tr>
							<td colspan="6" class="center bottomline"></td>
						</tr>
						<tr class="row-empty"></tr>

						<tr>
							<td class="center" style="width: 13%"><img
								src="../storage/${menuDTO.image }" width="100px" height="100px"></td>
							<td class="center" style="width: 5%"><input
								class="input_text_style" type="text" readonly
								value=${menuDTO.menu_name }> <input type="hidden"
								name="shopping_item_name" value="17"></td>
							<td class="center" style="width: 5%"><textarea readonly
									class="text_textarea">${menuDTO.info }</textarea></td>
							<td class="center" style="width: 5%"><input
								style="width: 40%;" class="input_text_style" type="text"
								value=${menuDTO.price }>원</td>
							<td class="center" style="width: 5%"><input
								style="width: 40%;" class="input_text_style" type="text"
								value=${cart_cnt } name="shopping_item_cnt"></td>
							<td class="center" style="width: 5%;"><input
								style="text-align: right; width: 70%;" class="input_text_style"
								type="text" value=${total_cost }>원</td>
						</tr>
						<tr class="row-empty"></tr>

						<tr>
							<td colspan="6" class="center bottomline"></td>
						</tr>
						<tr class="center">
							<td colspan="4" style="background-color: white;"></td>
							<td>총수량</td>
							<td>총 금액</td>
						</tr>
						<tr class="center">
							<td colspan="4" style="background-color: white;"></td>
							<td>${cart_cnt }</td>
							<td>${total_cost }원</td>
						</tr>
						<tr>
							<td colspan="6" class="center bottomline"></td>
						</tr>
					</tbody>
				</table>
			</c:if>
			<c:if test="${one == null}">
				<table>
					<thead>
						<tr>
							<td colspan="6" class="center bottomline"></td>
						</tr>
						<tr class="row-empty"></tr>
						<tr>
							<td class="center" style="width: 13%">이미지</td>
							<td class="center" style="width: 5%">상품이름</td>
							<td class="center" style="width: 20%">상품정보</td>
							<td class="center" style="width: 5%">가격</td>
							<td class="center" style="width: 5%">수량</td>
							<td class="center" style="width: 5%">총 주문금액</td>
						</tr>
						<tr class="row-empty"></tr>
					</thead>

					<tbody class="item_info_color">


						<tr>
							<td colspan="6" class="center bottomline"></td>
						</tr>
						<tr class="row-empty"></tr>

						<c:forEach var="entry" items="${marketMap}">
							<tr>
								<td class="center" style="width: 13%"><img
									src="../storage/${entry.value.image }" width="100px"
									height="100px"></td>
								<td class="center" style="width: 5%"><input
									class="input_text_style" type="text" readonly
									value=${entry.value.menu_name }> <input type="hidden"
									name="shopping_item_name" value="17"></td>
								<td class="center" style="width: 5%"><textarea readonly
										class="text_textarea">${entry.value.info }</textarea></td>
								<td class="center" style="width: 5%"><input
									style="width: 40%;" class="input_text_style" type="text"
									value=${entry.value.price }>원</td>
								<td class="center" style="width: 5%"><input
									style="width: 40%;" class="input_text_style" type="text"
									value=${entry.value.amount } name="shopping_item_cnt"></td>
								<td class="center" style="width: 5%;"><input
									style="text-align: right; width: 70%;" class="input_text_style"
									type="text" value=${entry.value.money }>원</td>
							</tr>
						</c:forEach>
						<tr class="row-empty"></tr>

						<tr>
							<td colspan="6" class="center bottomline"></td>
						</tr>
						<tr class="center">
							<td colspan="4" style="background-color: white;"></td>
							<td>총수량</td>
							<td>총 금액</td>
						</tr>
						<tr class="center">
							<td colspan="4" style="background-color: white;"></td>
							<td>${length }</td>
							<td>${total_cost }원</td>
						</tr>
						<tr>
							<td colspan="6" class="center bottomline"></td>
						</tr>
					</tbody>
				</table>
			</c:if>

			<div class="row-empty"></div>

			<section>
				<article class="buy_list1">
					<div class="phrchase-info">
						<h3>회원 정보</h3>

						<h4>회원이름</h4>
						<input style="text-align: left" class="user-name input_text_style"
							id="user-name" type="text" readonly value=${memberDTO.name }>
						<h4>연락처</h4>
						<input style="text-align: left"
							class="user-phone input_text_style" readonly
							value=${memberDTO.tel }>

						<h4>이메일</h4>
						<input style="text-align: left"
							class="form-email input_text_style" type="text" readonly
							value=${memberDTO.email }>
					</div>


				</article>
				<article class="buy_list2">
					<div class="phrchase-info">


						<h3>배송지 정보</h3>

						<h4>받는사람</h4>
						<input class="recive-name" type="text" name="shopping_recive_name"
							required value=${memberDTO.name }>

						<h4>핸드폰번호</h4>
						<input class="recive-phone" type="text"
							name="shopping_recive_phone" required value=${memberDTO.tel }>

						<h4>주소</h4>
						<div>
							<input class="recive-addr1" type="text" name="post" required
								value=${memberDTO.addr1 }> <input class="addr-btn2"
								type="button" value="주소찾기" onclick="findAddress();">
						</div>
						<div>
							<input class="recive-addr2" type="text" name="base_addr" required
								value=${memberDTO.addr2 }> <input class="recive-addr2"
								type="text" name="extra_addr" required value=${memberDTO.addr3 }>
						</div>
						<h4>배송시 요청사항</h4>
						<input class="form-request" type="text"
							name="shopping_recive_content" placeholder="200자 이내로 작성해주세요."
							required>
					</div>

				</article>
			</section>
		</form>
		<footer class="buy_list2">


			<div class="area on" id="cb3-area">

				<div class="row-empty"></div>
				<div class="row-empty"></div>

			</div>
			<div class="row-empty">
				<hr>
			</div>
			<div class="row-empty" style="text-align: center">
				<div>
					<h3>총 결제 금액</h3>
				</div>
			</div>

				<div class="row-empty" style="text-align: center">
					<div class="row-empty center"></div>
					<span class="price">${total_cost }</span>원
				</div>

			<div class="row-empty center"></div>
			<div class="row-empty center"></div>
			<div class="row-empty center">
				<div class="row-empty center"></div>
				<hr>
				<div class="row-empty center"></div>
				<div class="row-empty center"></div>
				<input type="button" id="purchase-button" value="결제하기"
					class="purchase-button" onclick="javascript:pay();"> 
				<input type="submit" value="결제취소"
					class="purchase-button2" onclick="history.back();">
				<div class="row-empty center"></div>
				<div class="row-empty center"></div>
				<div class="row-empty center"></div>

			</div>
	</div>



	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/holder.js"></script>
	<script src="../js/ie10-viewport-bug-workaround.js"></script>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</body>
</html>