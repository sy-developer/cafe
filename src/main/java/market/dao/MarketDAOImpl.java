package market.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import market.bean.MarketDTO;
import market.dao.MarketDAO;

@Repository
public class MarketDAOImpl implements MarketDAO{
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<MarketDTO> marketMoney() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(MarketDTO dto) {		
		return sqlSession.insert("mybatis.marketMapper.insert", dto);
	}

	@Override
	public List<MarketDTO> listMarket(String id) {
		return sqlSession.selectList("mybatis.marketMapper.listMarket", id);	
	}

	@Override
	public int delete(int stock_num, String id) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("stock_num", stock_num);
		map.put("id", id);
		return sqlSession.delete("mybatis.marketMapper.delete", map);
		
	}

	@Override
	public void deleteAll(String id) {
		sqlSession.delete("mybatis.marketMapper.deleteAll", id);
		
	}

	@Override
	public int update(MarketDTO dto) {
		return sqlSession.update("mybatis.marketMapper.update", dto);
		
	}

	@Override
	public int sumMoney(String id) {
		return sqlSession.selectOne("mybatis.marketMapper.sumMoney", id);
	}

	@Override
	public int countMarket(String id, int stock_num) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("id", id);
		map.put("stock_num", stock_num);
		return sqlSession.selectOne("mybatis.marketMapper.countMarket", map);
	}

	@Override
	public void updateMarket(MarketDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modifyMarket(MarketDTO dto) {
		sqlSession.update("mybatis.marketMapper.modify", dto);
		
	}

	@Override
	public int amount(String id, int stock_num) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("id", id);
		map.put("stock_num", stock_num);
		return sqlSession.selectOne("mybatis.marketMapper.amount", map);
	}

	@Override
	public MarketDTO marketView(String id, int stock_num) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("id", id);
		map.put("stock_num", stock_num);
		return sqlSession.selectOne("mybatis.marketMapper.marketView", map);
	}



	

}
