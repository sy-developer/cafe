<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
    if(${result > 0}) {
		alert("작성한 글을 저장했습니다.");
		location.href="boardList.do?pg=1";
	} else {
		alert("작성한 글 저장을 실패했습니다.");
		location.href="history.back()";
	}	
</script>
</head>
<body>

</body>
</html>