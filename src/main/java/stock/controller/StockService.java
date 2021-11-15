package stock.controller;

import java.util.List;

import menu.bean.MenuDTO;
import stock.bean.StockDTO;

public interface StockService {
	// 목록
	public List<StockDTO> stockList(int startNum, int endNum);

	// 전체 데이터 갯수 구하기
	public int getTotal();

	// 상세보기
	public StockDTO stockView(int stock_num);

	// 목록 전체보기
	public List<StockDTO> stockListAll(String sep);

	// 상품 검색
	public StockDTO stockViewPart(String menu_name);
}
