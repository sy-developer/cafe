package stock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stock.bean.StockDTO;
import stock.dao.StockDAO;

@Service
public class StockServiceImpl implements StockService{
	@Autowired
	StockDAO dao;

	@Override
	public List<StockDTO> stockList(int startNum, int endNum) {
		return dao.stockList(startNum, endNum);
	}

	@Override
	public int getTotal() {
		return dao.getTotal();
	}

	@Override
	public StockDTO stockView(int stock_num) {
		return dao.stockView(stock_num);
	}

	@Override
	public List<StockDTO> stockListAll(String sep) {
		return dao.stockListAll(sep);
	}

	@Override
	public StockDTO stockViewPart(String menu_name) {
		return dao.stockViewPart(menu_name);
	}
}
