function modify(){
	var frm = document.change_pw;
	
	if(frm.member_pw.value != frm.re_member_pw.value){	//비밀번호와 재확인이 같은지 검사 
		alert("비밀번호를 다시 확인하여주세요");
		return false;	
	}
	frm.submit();
}


