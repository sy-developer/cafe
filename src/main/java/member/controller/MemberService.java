package member.controller;

import java.util.List;

import member.bean.MemberDTO;

public interface MemberService {
	/* insert 작업 */
	public int write(MemberDTO dto);	
	
	// 로그인
	public String login(String id, String pwd);	
	
	// id가 있는지 확인
	public boolean isExistId(String id);
	
	// 추가 : id를 사용하여 전체 고객 정보 dto에 담기
	public MemberDTO memberView(String id);
	
	public int modify(MemberDTO dto);	
	
	public int modify_pw(MemberDTO dto);	

	public String check_pw(String id, String pwd);
	
	public String find_id(String name, String tel);
	
	public String find_pw(String id, String name, String tel);
	
	public int drop_id(String id, String pwd);

}
