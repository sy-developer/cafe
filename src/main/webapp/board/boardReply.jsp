<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 게시판 | Cafederia</title>
<script type="text/javascript">
	if(${result > 0}) {
		alert("작성한 댓글을 저장했습니다.");
		location.href="boardList.do?pg=1";
	} else {
		alert("작성한 댓글 저장이 실패했습니다.");
		location.href="history.back()";
	}	
</script>
</head>
<body>

</body>
</html>