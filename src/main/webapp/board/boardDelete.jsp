<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if(${result } > 0) {
		alert("삭제했습니다.");
		location.href="boardList.do?pg=${pg }";
	} else {
		alert("삭제 실패했네요.");
		location.href="history.back()";
	}
</script>
</head>
<body>

</body>
</html>