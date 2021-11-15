package market.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import market.bean.MarketDTO;
import market.dao.MarketDAO;

@Service
public class MarketServiceImpl implements MarketService {
	
	@Autowired
	MarketDAO dao;

	@Override
	public List<MarketDTO> marketMoney() {
		return null;
	}

	@Override
	public void insert(MarketDTO dto) {
		dao.insert(dto);
		
	}

	@Override
	public List<MarketDTO> listMarket(String id) {
		return dao.listMarket(id);
	}

	@Override
	public int delete(int stock_num, String id) {
		return dao.delete(stock_num, id);		
	}

	@Override
	public void deleteAll(String id) {
		dao.deleteAll(id);
		
	}

	@Override
	public int update(MarketDTO dto) {
		return dao.update(dto);
		
	}

	@Override
	public int sumMoney(String id) {
		return dao.sumMoney(id);
	}

	@Override
	public int countMarket(String id, int stock_num) {
		return dao.countMarket(id, stock_num);
	}

	@Override
	public void updateMarket(MarketDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modifyMarket(MarketDTO dto) {
		dao.modifyMarket(dto);
		
	}

	@Override
	public int amount(String id, int stock_num) {
		return dao.amount(id, stock_num);
	}

	@Override
	public MarketDTO marketView(String id, int stock_num) {
		return dao.marketView(id, stock_num);
	}

}
