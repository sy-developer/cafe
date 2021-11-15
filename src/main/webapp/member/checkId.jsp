<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkIdClose() {
		// opener : 현재 브라우저 창 기준 부모 창을 관리하는 내장 객체
		opener.joinForm_end.member_id.value = "${id}";
		window.close();  // 현재창 닫기
		opener.joinForm_end.pwd.focus();
	}
	function checkId() {
		if(!document.form2.id.value) {
			alert("아이디를 입력해주세요.");
			document.form2.id.focus();
		} else {
			document.form2.submit();
		}
	}
</script>
</head>
<body>
<c:if test="${result}">
	${id}는 사용중입니다.<br><br>다른아이디를 입력해주세요.<br><br>
	<form action="../member/checkId.do" method="post" name="form2">
		아이디  <input type="text" name="id">
		<input type="submit" value="중복 체크" onclick="checkId(); return false;">
	</form>
</c:if>

<c:if test="${!result }">
	${id}는 사용 가능합니다.<br><br>
	<input type="button" value="사용" onclick="checkIdClose()">
</c:if>

</body>
</html>