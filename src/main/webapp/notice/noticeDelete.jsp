<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	if(${result } > 0) {
		alert("공지사항이 삭제했습니다.");
		location.href="noticeList.do?pg=${pg }";
	} else {
		alert("공지사항 삭제에 실패했습니다.");
		location.href="history.back()";
	}
</script>
</body>
</html>