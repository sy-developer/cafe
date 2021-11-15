function checkId() {
	var sId = document.joinForm_end.member_id.value;
	
	if(!sId) {
		alert("먼저 아이디를 입력하세요.");
		document.writeForm.id.focus();
	} else {
		window.open("checkId.do?id=" + sId, "",
				    "width=400 height=160 left=500 top=200");
	}
}
