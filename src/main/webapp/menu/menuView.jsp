<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/styles.css" rel="stylesheet">
<link href="../css/carousel.css" rel="stylesheet">
<link href="../css/badok.css" rel="stylesheet">
<script src="../js/scripts.js"></script>

<style>
* {
	box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
}

main {
	width: 1250px;
	height: 1000px;
	margin: auto;
}

section {
	width: 1000px;
	height: 1000px;
	margin: auto;
}

.center {
	text-align: center;
}

.left {
	text-align: left;
}

.right {
	text-align: right;
}

.img-size {
	width: 484px;
	height: 713px;
	float: left;
	padding-right: 427px;
}

.row-empty {
	height: 20px;
}

.item-name {
	font-size: 20px;
}

.item-info {
	font-size: 25px;
	color: darkblue;
}

.item-price {
	font-size: 20px;
	color: firebrick;
}

/*가격_버튼*/
.pay-btn {
	width: 205px;
	height: 50px;
	margin: 0 5px 0px 0px;
	background-color: #c80a1e;
	color: white;
	border: none;
	cursor: pointer;
	font-size: 20px;
}
/*장바구니_버튼*/
.bag-btn {
	width: 205px;
	height: 50px;
	margin-top: -50px;
	background-color: gray;
	border: none;
	color: white;
	cursor: pointer;
	font-size: 20px;
}

.ggim-btn {
	width: 50px;
	height: 50px;
	margin-top: -50px;
	background-color: chocolate;
	border: none;
	color: white;
	cursor: pointer;
	font-size: 20px;
}

.bottom-outline {
	border-bottom: 1px solid #aaa;
}

.top-outline {
	border-bottom: 1px solid #aaa;
}

.item-haha>li {
	display: inline-block;
	padding-left: 100px;
}

.selectbox {
	width: 200px; /* 원하는 너비설정 */
	padding: .8em .5em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	background:
		url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
		no-repeat 95% 50%; /* 네이티브 화살표 대체 */
	border: 1px solid #999;
	border-radius: 0px; /* iOS 둥근모서리 제거 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
	font-size: 15px;
}

.selectbox:focus {
	width: 200px; /* 원하는 너비설정 */
	padding: .8em .5em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	background:
		url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
		no-repeat 95% 50%; /* 네이티브 화살표 대체 */
	border: 1px solid #999;
	border-radius: 0px; /* iOS 둥근모서리 제거 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
	outline: none;
	font-size: 15px;
}
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
								<li class="내정보"><a href="../mypage/mypage.do">내정보</a></li>
								<li class="market"><a href="../market/market.do">장바구니</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</div>

	<!-- 리스트 불러오기  -->

	<section>
		<article style="padding-top: 200px">

			<div class="img-size">
				<img src="../storage/${dto.image }" width="300px" height="400px">
			</div>

			<div class="row-empty"></div>
			<div class="row-empty"></div>
			<div class="row-empty"></div>
			<div class="row-empty"></div>
			<form method="post">
				<div>
					<div class="item-name">${dto.menu_name }</div>
					<div class="row-empty"></div>
					<div class="item-info">${dto.info }</div>
					<div class="row-empty"></div>
					<div class="item-price">${dto.price }원</div>

					<div class="row-empty"></div>
					<div class="row-empty"></div>
					<div class="row-empty">
						제품 영양 정보 : ${dto.nutrition_info }<br>
						<br> 1회 제공량 (kcal) : ${dto.info1 }<br>
						<br> 나트륨 (g) : ${dto.info2 }<br>
						<br> 포화지방 (g) : ${dto.info3 }<br>
						<br> 당류 (g) : ${dto.info4 }<br>
						<br> 단백질 (g) : ${dto.info5 }<br>
						<br> 보유수량 : ${dto.stock_count }개
					</div>
					<div class="row-empty"></div>
					<div class="row-empty"></div>
					<div class="row-empty"></div>
					<div class="row-empty"></div>
					<div class="row-empty"></div>

					<div style="padding-left: 812px;">
						수량 : <select class="selectbox" name="cart_cnt">

							<option>1</option>

							<option>2</option>

							<option>3</option>

							<option>4</option>

							<option>5</option>

							<option>6</option>

							<option>7</option>

							<option>8</option>

							<option>9</option>

							<option>10</option>

							<option>11</option>

							<option>12</option>

							<option>13</option>

							<option>14</option>

							<option>15</option>

							<option>16</option>

							<option>17</option>

							<option>18</option>

							<option>19</option>

							<option>20</option>

							<option>21</option>

							<option>22</option>

							<option>23</option>

							<option>24</option>

							<option>25</option>

							<option>26</option>

							<option>27</option>

							<option>28</option>

							<option>29</option>

							<option>30</option>

							<option>31</option>

							<option>32</option>

							<option>33</option>

							<option>34</option>

							<option>35</option>

							<option>36</option>

							<option>37</option>

							<option>38</option>

							<option>39</option>

							<option>40</option>

							<option>41</option>

							<option>42</option>

							<option>43</option>

							<option>44</option>

							<option>45</option>

							<option>46</option>

							<option>47</option>

							<option>48</option>

							<option>49</option>

							<option>50</option>

							<option>51</option>

							<option>52</option>

							<option>53</option>

							<option>54</option>

							<option>55</option>

							<option>56</option>

							<option>57</option>

							<option>58</option>

							<option>59</option>

							<option>60</option>

							<option>61</option>

							<option>62</option>

							<option>63</option>

							<option>64</option>

							<option>65</option>

							<option>66</option>

							<option>67</option>

							<option>68</option>

							<option>69</option>

							<option>70</option>

							<option>71</option>

							<option>72</option>

							<option>73</option>

							<option>74</option>

							<option>75</option>

							<option>76</option>

							<option>77</option>

							<option>78</option>

							<option>79</option>

							<option>80</option>

							<option>81</option>

							<option>82</option>

							<option>83</option>

							<option>84</option>

							<option>85</option>

							<option>86</option>

							<option>87</option>

							<option>88</option>

							<option>89</option>

							<option>90</option>

							<option>91</option>

							<option>92</option>

							<option>93</option>

							<option>94</option>

							<option>95</option>

							<option>96</option>

							<option>97</option>

							<option>98</option>

							<option>99</option>

						</select>
					</div>
					<div class="row-empty"></div>
					<div class="row-empty"></div>

					<div class="row-empty"></div>
					<div class="row-empty"></div>
					<div class="row-empty"></div>
					<div>
					<!--form 클릭시 formation이 작동됨 : test.jsp로 가도록 해보았음-->
						<input class="pay-btn" type="submit"
							formaction="../checkout/buy_page.do?stock_num=${dto.stock_num }" value="결제하기" 
							onclick="return button_event();"> <input class="bag-btn"
							type="submit" formaction="../market/insert.do?stock_num=${dto.stock_num }" value="장바구니에 넣기"
							onclick="return checkAdd();"> <input class="ggim-btn"
							type="submit" formaction="" value="찜"
							onclick="return checkAdd();">
					</div>
				</div>
			</form>
		</article>
		<article>
			<div>
				<div class="row-empty"></div>
				<div class="row-empty"></div>
				<div class="row-empty"></div>
				<div class="row-empty"></div>
				<div class="row-empty"></div>
				<div class="row-empty"></div>
				<div class="row-empty"></div>
				<div class="row-empty"></div>
				<div class="row-empty"></div>
				<div class="bottom-outline"></div>
				<div class="row-empty"></div>
				<div class="row-empty"></div>


			</div>
		</article>
	</section>
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