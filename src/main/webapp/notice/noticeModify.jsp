<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 | Cafedria</title>
<script type="text/javascript">
	if(${result > 0}){
		alert("작성한 글이 수정을 되었습니다.");
		location.href="noticeView.do?notice_num=" + ${notice_num} + "&pg=" + ${pg};
	}else{
		alert("작성한 글 수정 실패입니다.");
		location.href="history.back()";
	}
</script>
</head>
<body>

</body>
</html>