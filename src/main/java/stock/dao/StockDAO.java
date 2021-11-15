package stock.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import stock.bean.StockDTO;

@Repository
public class StockDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	// 목록
	public List<StockDTO> stockList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.stockMapper.stockList", map);
	}

	public List<StockDTO> stockListAll(String sep) {
		return sqlSession.selectList("mybatis.stockMapper.stockListAll",sep);
	}

	// 전체 데이터 갯수 구하기
	public int getTotal() {
		return sqlSession.selectOne("mybatis.stockMapper.getTotal");
	}

	// 상품 페이지 구현
	public StockDTO stockView(int stock_num) {
		return sqlSession.selectOne("mybatis.stockMapper.stockView", stock_num);
	}

	// 상품 일부 검색시 페이지 구현
	public StockDTO stockViewPart(String menu_name) {
		return sqlSession.selectOne("mybatis.stockMapper.stockViewPart", menu_name);
	}
}
