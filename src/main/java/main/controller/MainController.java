package main.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import menu.bean.MenuDTO;
import menu.controller.MenuService;
import stock.bean.StockDTO;
import stock.controller.StockService;

@Controller
public class MainController {
	
	@Autowired
	MenuService menuservice;
	
	@Autowired
	StockService stockservice;

	@RequestMapping(value = "/main/main.do")
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		ModelAndView modelAndView = new ModelAndView();
		Random rd = new Random(); 		//랜덤 객체 생성
		
		int stock_num_a = (int)((Math.random()*9)+1);
		int stock_num_b = (int)((Math.random()*9)+10);
		int stock_num_c = (int)((Math.random()*9)+19);
		
		int mug_num = (int)((Math.random()*4)+1);
		int glass_num = (int)((Math.random()*4)+5);
		int tum_num = (int)((Math.random()*4)+9);
		
		MenuDTO dto_a = menuservice.menuView(stock_num_a);
		MenuDTO dto_b = menuservice.menuView(stock_num_b);
		MenuDTO dto_c = menuservice.menuView(stock_num_c);
		
		StockDTO dto_mug = stockservice.stockView(mug_num);
		StockDTO dto_glass = stockservice.stockView(glass_num);
		StockDTO dto_tum = stockservice.stockView(tum_num);
		
		String naver_Id = request.getParameter("naver_Id");
		String kakao_Id = request.getParameter("kakao_Id");
		
		if (naver_Id == null && kakao_Id == null) { //그냥 DB로그인시 실행
			//데이터
			String id = (String) session.getAttribute("memId");
			String name = (String) session.getAttribute("memName");
			
			// 화면 네비게이션 : 데이터 공유 + view 처리 파일 선택
			modelAndView.addObject("id",id);
			modelAndView.addObject("name",name);	
			modelAndView.addObject("sep_a","a");
			modelAndView.addObject("sep_b","b");
			modelAndView.addObject("sep_c","c");
			
			modelAndView.addObject("dto_a",dto_a);
			modelAndView.addObject("dto_b",dto_b);
			modelAndView.addObject("dto_c",dto_c);
			
			modelAndView.addObject("dto_mug",dto_mug);
			modelAndView.addObject("dto_glass",dto_glass);
			modelAndView.addObject("dto_tum",dto_tum);
			
			modelAndView.setViewName("main.jsp");	
		} else if (naver_Id != null) {
			session.setAttribute("memId", naver_Id);
			System.out.println("naver_Id : " + naver_Id);
			modelAndView.setViewName("main.jsp");	
		} else if (kakao_Id != null) {
			session.setAttribute("memId", kakao_Id);
			System.out.println("kakao_Id : " + kakao_Id);
			modelAndView.setViewName("main.jsp");	
		}
		return modelAndView;
	}
}
