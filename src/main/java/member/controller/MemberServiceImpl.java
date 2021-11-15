package member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDAO dao;

	@Override
	public int write(MemberDTO dto) {
		return dao.write(dto);
	}
	@Override
	public String login(String id, String pwd) {
		return dao.login(id, pwd);
	}
	@Override
	public boolean isExistId(String id) {
		return dao.isExistId(id);
	}
	
	// 추가
	@Override
	public MemberDTO memberView(String id) {
		return dao.memberView(id);
	}	
	
	@Override
	public int modify(MemberDTO dto) {
		return dao.modify(dto);
	}
	
	@Override
	public int modify_pw(MemberDTO dto) {
		return dao.modify_pw(dto);
	}
	
	@Override
	public String check_pw(String id, String pwd) {
		return dao.check_pw(id, pwd);
	}
	
	@Override
	public String find_id(String name, String tel) {
		return dao.find_id(name, tel);
	}
	
	@Override
	public String find_pw(String id, String name, String tel) {
		return dao.find_pw(id, name, tel);
	}
	@Override
	public int drop_id(String id, String pwd) {
		return dao.drop_id(id, pwd);
	}
}
