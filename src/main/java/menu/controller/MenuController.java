package menu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import menu.bean.MenuDTO;

@Controller
public class MenuController {
	@Autowired
	MenuService menuService;
	
	@RequestMapping(value = "/menu/menuList.do")
	public ModelAndView menuListAll(HttpServletRequest request, HttpServletResponse response, MenuDTO test_dto) {
		String sep = request.getParameter("sep");
		//System.out.println("sep : " + sep);
		List<MenuDTO> list = menuService.menuListAll(sep);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list",list);
		modelAndView.addObject("sep",sep);

		modelAndView.setViewName("menuList.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/menu/menuView.do")
	public ModelAndView menuView(HttpServletRequest request, HttpServletResponse response) {
		String sep = request.getParameter("sep");
		int stock_num = Integer.parseInt(request.getParameter("stock_num"));
		MenuDTO dto = menuService.menuView(stock_num);
				
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("stock_num",stock_num);
		modelAndView.addObject("dto",dto);
		modelAndView.setViewName("menuView.jsp");
		
		return modelAndView;
	}
}
