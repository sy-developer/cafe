package menu.controller;

import java.util.List;

import menu.bean.MenuDTO;


public interface MenuService {
	//목록
		public List<MenuDTO> menuList(int startNum, int endNum);
		//전체 데이터 갯수 구하기
		public int getTotal();
		//상세보기
		public MenuDTO menuView(int stock_num);
		//목록 전체보기
		public List<MenuDTO> menuListAll(String sep);
		//상품 검색
		public MenuDTO menuViewPart(String menu_name);
}
