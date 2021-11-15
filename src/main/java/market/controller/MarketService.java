package market.controller;

import java.util.List;

import market.bean.MarketDTO;

public interface MarketService {
	List<MarketDTO> marketMoney();
    void insert(MarketDTO dto);
    List<MarketDTO> listMarket(String id);
    int delete(int stock_num, String id);
    void deleteAll(String id);
    int update(MarketDTO dto);
    int sumMoney(String id);
    int countMarket(String id, int stock_num);
    int amount(String id, int stock_num);
    void updateMarket(MarketDTO dto);
    void modifyMarket(MarketDTO dto);
    MarketDTO marketView(String id,int stock_num); 

}
