package menu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import menu.bean.MenuDTO;
import menu.dao.MenuDAO;

@Service
public class MenuServiceImpl implements MenuService {
	@Autowired
	MenuDAO dao;

	@Override
	public List<MenuDTO> menuList(int startNum, int endNum) {
		return dao.menuList(startNum, endNum);
	}

	@Override
	public int getTotal() {
		return dao.getTotal();
	}

	@Override
	public MenuDTO menuView(int stock_num) {
		return dao.menuView(stock_num);
	}

	@Override
	public List<MenuDTO> menuListAll(String sep) {
		return dao.menuListAll(sep);
	}

	@Override
	public MenuDTO menuViewPart(String menu_name) {
		return dao.menuViewPart(menu_name);
	}
	
	

	
}
