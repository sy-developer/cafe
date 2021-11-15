<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		if (${result} > 0) {
			alert("해당상품이 이미 장바구니에 존재합니다!!")
		} else {
			alert("해당상품이 장바구니에 추가되었습니다");
		}
		location.href = "../menu/menuView.do?sep=${sep}&stock_num=${stock_num}";
	}
</script>
</head>
<body>

</body>
</html>