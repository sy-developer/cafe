<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		if (${result} > 0) {
			alert("해당상품이 장바구니에서 제거되었습니다!!")
		} else {
			alert("해당상품이 장바구니에서 제거되지 않았습니다!!");
		}
		location.href = "../market/market.do";
	}
</script>
</head>
<body>

</body>
</html>