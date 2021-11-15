package market.dao;

import java.util.List;

import market.bean.MarketDTO;

public interface MarketDAO {
	List<MarketDTO> marketMoney();
    int insert(MarketDTO dto); //장바구니 추가
    List<MarketDTO> listMarket(String id); //장바구니 목록
    int delete(int stock_num, String id); //장바구니 개별 삭제
    void deleteAll(String id); //장바구니 비우기
    int update(MarketDTO dto); 
    int sumMoney(String id); //장바구니 금액 합계
    int countMarket(String id, int stock_num); //장바구니 상품 갯수
    int amount(String id, int stock_num); //장바구니 해당상품 갯수
    void updateMarket(MarketDTO dto); //장바구니 수정 
    void modifyMarket(MarketDTO dto);
    MarketDTO marketView(String id,int stock_num); 
}
