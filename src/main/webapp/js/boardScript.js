function checkBoardWrite() {
	var frm = document.boardWriteForm;
	
	if(!frm.pass.value) {
		alert("제목을 입력하세요");
		frm.pass.focus();
	} else if(!frm.subject.value) {
		alert("내용을 입력하세요");
		frm.subject.focus();
	} else if(!frm.content.value) {
		alert("내용을 입력하세요");
		frm.content.focus();
	} else {
		frm.submit();
	}
}


function checkBoardModify(){
	var frm = document.boardModifyForm;

	if(!frm.subject.value){
		alert("제목을 입력하세요.");
		frm.subject.focus();
	} else if(!frm.content.value){
		alert("내용을 입력하세요.");
		frm.content.focus();
	} else {
		frm.submit();
	}
}

	
		
	
	
	