package menu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import menu.bean.MenuDTO;

@Repository
public class MenuDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	// 목록
	public List<MenuDTO> menuList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.menuMapper.menuList", map);
	}

	public List<MenuDTO> menuListAll(String sep) {
		return sqlSession.selectList("mybatis.menuMapper.menuListAll",sep);
	}

	// 전체 데이터 갯수 구하기
	public int getTotal() {
		return sqlSession.selectOne("mybatis.menuMapper.getTotal");
	}

	// 상품 페이지 구현
	public MenuDTO menuView(int stock_num) {
		return sqlSession.selectOne("mybatis.menuMapper.menuView", stock_num);
	}

	// 상품 일부 검색시 페이지 구현
	public MenuDTO menuViewPart(String menu_name) {
		return sqlSession.selectOne("mybatis.menuMapper.ViewPart", menu_name);
	}
}
