package member.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.bean.MemberDTO;

@Repository
public class MemberDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	/* insert 작업 */
	public int write(MemberDTO dto) {
		return sqlSession.insert("mybatis.memberMapper.write", dto);
	}

	// 로그인
	public String login(String id, String pwd) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		return sqlSession.selectOne("mybatis.memberMapper.login", map);
	}

	// id가 있는지 확인
	public boolean isExistId(String id) {
		boolean exist = false;
		if (sqlSession.selectOne("mybatis.memberMapper.isExistId", id) != null) {
			exist = true;
		}
		return exist;
	}

	// 장수훈 추가 : id로 membership자료 DTO에 담아내기
	public MemberDTO memberView(String id) {
		return sqlSession.selectOne("mybatis.memberMapper.memberView", id);
	}

	// 회원정보 수정
	public int modify(MemberDTO dto) {
		return sqlSession.update("mybatis.memberMapper.modify", dto);
	}
	
	public int modify_pw(MemberDTO dto) {
		return sqlSession.update("mybatis.memberMapper.modify_pw", dto);
	}
	
	public String check_pw(String id, String pwd) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		return sqlSession.selectOne("mybatis.memberMapper.check_pw", map);
	}
	
	public String find_id(String name, String tel) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("tel", tel);
		return sqlSession.selectOne("mybatis.memberMapper.find_id", map);
	}
	
	public String find_pw(String id, String name, String tel) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("name", name);
		map.put("tel", tel);
		return sqlSession.selectOne("mybatis.memberMapper.find_pw", map);
	}
	
	public int drop_id(String id, String pwd) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		return sqlSession.delete("mybatis.memberMapper.drop_id", map);
	}
}